unit UContasReceberController;


interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UUnidadeVO, UController, DBClient, DB, UContasReceberVO, UPessoasController, UCondominioController,
  UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO, ULancamentoContabilVO;


type
  TContasReceberController = class(TController<TContasReceberVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasReceberVO;
    procedure ValidarDados(Objeto :TContasReceberVO);override;
    function Inserir(ContasReceber: TContasReceberVO): integer;
    function Excluir(ContasReceber: TContasReceberVO): boolean;
    function Alterar(ContasReceber: TContasReceberVO): boolean;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasReceberController.Alterar(ContasReceber: TContasReceberVO): boolean;
var Lancamentos : TObjectList<TLancamentoContabilVO>;
  idContaUnidade, idContaDebito, idContaCredito : Integer;
  Lancamento : TLancamentoContabilVO;
  PlanoContasController : TPlanoContasCOntroller;
  ListaConta : TObjectList<TPlanoContasVO>;
  ContaPlano : TPlanoContasVO;
  Query : string;
begin
  validarDados(ContasReceber);
  idContaUnidade := 0;
  try
    TDBExpress.IniciaTransacao;
    Result := TDAO.Alterar(ContasReceber);
    Lancamentos:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber), '',0,true);
    if(Lancamentos.Count>0)then
    begin
      TDAO.Excluir(Lancamentos.First);
    end;
    if(ContasReceber.IdUnidade > 0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ContasReceber.IdUnidade));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count > 0) then
      begin
        idContaUnidade:=listaConta[0].idPlanoContas;
      end;
      if ContasReceber.IdUnidade <>  0 then
           idContaDebito := idContaUnidade;
      if ContasReceber.IdConta <> 0  then
        idContaDebito := ContasReceber.IdConta;
      if ContasReceber.IdContraPartida <> 0 then
        idContaCredito := ContasReceber.IdContraPartida;
      Lancamento := TLancamentoContabilVo.Create;
      Lancamento.idcontadebito := idContaDebito;
      Lancamento.idContaCredito := idContaCredito;
      Lancamento.complemento := ContasReceber.DsComplemento;
      Lancamento.dtLcto := ContasReceber.DtCompetencia;
      Lancamento.VlValor := ContasReceber.VlValor;
      Lancamento.idContasReceber := ContasReceber.idContasReceber;
      Lancamento.idHistorico := ContasReceber.IdHistorico;
      TDao.Inserir(Lancamento);
      TDBExpress.ComitaTransacao;
    end;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TContasReceberController.ConsultarPorId(id: integer): TContasReceberVO;
var
  P: TContasReceberVO;
begin
  P := TDAO.ConsultarPorId<TContasReceberVO>(id);
  if (P <> nil) then
  begin
      p.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.IdCondominio);
      p.UnidadeVO := TDAO.ConsultarPorId<TUnidadeVO>(p.IdUnidade);
      p.PlanoContasContaVO := TDAO.ConsultarPorId<TPlanoContasVO>(P.IdConta);
      P.PlanoContasContraPartidaVO := TDao.ConsultarPorId<TPlanoContasVO>(P.IdContraPartida);
      p.HistoricoVO := TDao.ConsultarPorId<THistoricoVO>(P.IdHistorico);
  end;
  result := P;
end;

function TContasReceberController.Excluir(ContasReceber: TContasReceberVO): boolean;
var Lancamento : TObjectList<TLancamentoContabilVO>;
begin
  try
    TDBExpress.IniciaTransacao;
    Lancamento:= TDAO.Consultar<TLancamentoContabilVO>('LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber), '',0,true);
    if(Lancamento.Count>0)then
    begin
      TDAO.Excluir(Lancamento.First);
    end;
    Result := TDAO.Excluir(ContasReceber);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TContasReceberController.Inserir(ContasReceber: TContasReceberVO): integer;
var contaPlano:TPlanoContasVO;
    Lancamento : TLancamentoContabilVO;
    listaConta :TObjectList<TPlanoContasVO>;
    Query : String;
    idContaUnidade,idcontadebito,idcontacredito:integer;
    PlanoContasController : TPlanoContasController;
begin
  try
    idContaUnidade := 0;
    TDBExpress.IniciaTransacao;
    Result := TDAO.Inserir(ContasReceber);
    if(ContasReceber.IdUnidade > 0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ContasReceber.IdUnidade));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count > 0) then
      begin
        idContaUnidade:=listaConta[0].idPlanoContas;
      end;
      if ContasReceber.IdUnidade <>  0 then
         idContaDebito := idContaUnidade;
      if ContasReceber.IdConta <> 0  then
         idContaDebito := ContasReceber.IdConta;
      if ContasReceber.IdContraPartida <> 0 then
        idContaCredito := ContasReceber.IdContraPartida;
      Lancamento := TLancamentoContabilVo.Create;
      Lancamento.idcontadebito := idContaDebito;
      Lancamento.idContaCredito := idContaCredito;
      Lancamento.complemento := ContasReceber.DsComplemento;
      Lancamento.dtLcto := ContasReceber.DtCompetencia;
      Lancamento.VlValor := ContasReceber.VlValor;
      Lancamento.idContasReceber := result;
      Lancamento.idHistorico := ContasReceber.IdHistorico;
      TDao.Inserir(Lancamento);
      TDBExpress.ComitaTransacao;
    end;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

procedure TContasReceberController.ValidarDados(Objeto: TContasReceberVO);
begin
  inherited;
end;

begin

end.
