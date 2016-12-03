unit UContasReceberController;


interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UUnidadeVO, UController, DBClient, DB, UContasReceberVO, UPessoasController, UCondominioController,
  UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO, ULancamentoContabilVO, UEmpresaTrab, UContaCorrenteVO;


type
  TContasReceberController = class(TController<TContasReceberVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasReceberVO;
    procedure ValidarDados(Objeto :TContasReceberVO);override;
    function Inserir(ContasReceber: TContasReceberVO): integer;
    function Excluir(ContasReceber: TContasReceberVO): boolean;
    function Alterar(ContasReceber: TContasReceberVO): boolean;
    function InserirBaixa (ContasReceber : TContasReceberVO) : integer;
    function RemoverBaixa (idContasReceber : integer) :integer;
    function InserirTitulosContaCorrente(ListaCReber:TObjectList<TContasReceberVO>):boolean;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasReceberController.Alterar(ContasReceber: TContasReceberVO): boolean;
var Lancamentos : TObjectList<TLancamentoContabilVO>;
  ContaCorrente : TObjectList<TContaCorrenteVO>;
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
    ContaCorrente := TDAO.Consultar<TContaCorrenteVO>(' idContasReceber = ' + IntToStr(ContasReceber.idContasReceber),  '',0,true);
    if ContaCorrente.Count > 0 then
    begin
      ShowMessage('Titulo gerado pelo conta corrente não poderá ser alterado! ');
    end
    else
    begin
      Lancamentos:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber), '',0,true);

    if(Lancamentos.Count>0)then
    begin
      TDAO.Excluir(Lancamentos.First);
    end;
    if(ContasReceber.IdUnidade > 0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ContasReceber.IdUnidade))+ ' and PlanoContas.idcondominio = '+ IntToStr(FormEmpresaTrab.CodigoEmpLogada);
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
    ContaCorrente : TObjectList<TContaCorrenteVO>;
    i : integer;
begin
  try
    TDBExpress.IniciaTransacao;
    Lancamento:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber),  '',0,true);
    ContaCorrente := TDAO.Consultar<TContaCorrenteVO>(' contacorrente.idContasReceber = ' + IntToStr(ContasReceber.idContasReceber),  '',0,true);
    if(Lancamento.Count>0)then
    begin
      TDAO.Excluir(Lancamento.First);
    end;

    for I := 0 to ContaCorrente.Count - 1 do
    begin
      TDAO.Excluir(ContaCorrente[i]);
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
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ContasReceber.IdUnidade) + ' and PlanoContas.idcondominio = '+ IntToStr(FormEmpresaTrab.CodigoEmpLogada));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count > 0) then
      begin
        idContaUnidade:=listaConta[0].idPlanoContas;
      end;
    end;

      if ContasReceber.IdUnidade >  0 then
         idContaDebito := idContaUnidade;
      if ContasReceber.IdConta > 0  then
         idContaDebito := ContasReceber.IdConta;
      if ContasReceber.IdContraPartida > 0 then
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
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TContasReceberController.InserirBaixa(ContasReceber: TContasReceberVO): integer;
var
   Lancamentos : TObjectList<TLancamentoContabilVO>;
   i:integer;
   Lancamento, lctoDesconto, lctoJurosMulta : TLancamentoContabilVO;
   PlanoContasController : TPlanoContasController;
   query : string;
   listaConta : TObjectList<TPlanoContasVO>;
   valordebito : currency;
begin
    TDBExpress.IniciaTransacao;
    try
      TDAO.Alterar(ContasReceber);
      Lancamentos:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber) +
                                                          ' AND LANCAMENTOCONTABIL.IDBAIXA = '+inttostr(ContasReceber.idContasReceber), '',0,true);
      if(Lancamentos.Count>0)then
      begin
        for i:=0 to Lancamentos.Count-1 do
        begin
          TDAO.Excluir(Lancamentos[i]);
        end;
      end;

      Lancamento := TLancamentoContabilVo.Create;

      if(ContasReceber.IdUnidade>0)then
      begin
        PlanoContasController := TPlanoContasController.Create;
        Query :=  ' PlanoContas.idunidade = ' +(IntTOsTR(ContasReceber.idunidade) + ' and PlanoContas.idcondominio = '+ IntToStr(FormEmpresaTrab.CodigoEmpLogada));
        listaConta := PlanoContasController.Consultar(query);
        if (listaConta.Count > 0) then
        begin
          Lancamento.idcontaCredito := listaConta[0].idPlanoContas;
        end;
      end
      else
          Lancamento.idcontaCredito := ContasReceber.idConta;

      Lancamento.dtLcto := ContasReceber.DtBaixa;
      Lancamento.VlValor := ContasReceber.VlBaixa;
      Lancamento.idContasReceber := ContasReceber.idContasReceber;
      Lancamento.idbaixa := ContasReceber.idContasReceber;
      Lancamento.idHistorico := ContasReceber.IdHistoricoBx;
      TDAO.Inserir(Lancamento);

      ValorDebito:= ContasReceber.VlBaixa;

      if((ContasReceber.VlDesconto>0))then
      begin
        LctoDesconto := TLancamentoContabilVo.Create;
        LctoDesconto.idContaDebito := FormEmpresaTrab.ctdescontop;
        LctoDesconto.dtLcto := ContasReceber.DtBaixa;
        LctoDesconto.VlValor := ContasReceber.vldesconto;
        LctoDesconto.idContasReceber := ContasReceber.idContasReceber;
        LctoDesconto.idBaixa:=ContasReceber.idContasReceber;
        ValorDebito := ValorDebito - ContasReceber.VlDesconto;
        TDao.Inserir(LctoDesconto);
      end ;

      if((ContasReceber.VlJuros>0))then
      begin
        lctoJurosMulta := TLancamentoContabilVo.Create;
        lctoJurosMulta.idContaCredito := FormEmpresaTrab.ctjurosp;
        lctoJurosMulta.dtLcto := ContasReceber.DtBaixa;
        lctoJurosMulta.VlValor := ContasReceber.vljuros;
        lctoJurosMulta.idContasReceber := ContasReceber.idContasReceber;
        lctoJurosMulta.idBaixa:=ContasReceber.idContasReceber;
        ValorDebito := ValorDebito + ContasReceber.VlJuros;
        TDao.Inserir(lctoJurosMulta);
      end;

      if((ContasReceber.VlMulta>0))then
      begin
        lctoJurosMulta := TLancamentoContabilVo.Create;
        lctoJurosMulta.idContaCredito := FormEmpresaTrab.ctmultap;
        lctoJurosMulta.dtLcto := ContasReceber.DtBaixa;
        lctoJurosMulta.VlValor := ContasReceber.vlmulta;
        lctoJurosMulta.idContasReceber := ContasReceber.idContasReceber;
        lctoJurosMulta.idBaixa:=ContasReceber.idContasReceber;
        ValorDebito := ValorDebito + ContasReceber.vlmulta;
        TDao.Inserir(lctoJurosMulta);

      end;
        lancamento := TLancamentoContabilVo.Create;
        Lancamento.dtLcto := ContasReceber.DtBaixa;
        Lancamento.VlValor := ValorDebito;
        lancamento.idContaDebito := ContasReceber.IdContaBaixa;
        Lancamento.idContasReceber := ContasReceber.idContasReceber;
        Lancamento.idbaixa := ContasReceber.idContasReceber;
        TDAO.Inserir(Lancamento);

      TDBExpress.ComitaTransacao;

    finally
      TDBExpress.RollBackTransacao;
    end;
end;

function TContasReceberController.InserirTitulosContaCorrente(
  ListaCReber: TObjectList<TContasReceberVO>): boolean;
  var i,x, idContaReceber:integer;
begin
    TDBExpress.IniciaTransacao;
    try
      for i:=0 to ListaCReber.Count-1 do
      begin
        idContaReceber:=0;
        idContaREceber:= TDAO.Inserir(ListaCReber[i]);
        for x := 0 to listaCReber[i].ItensContaCorrente.Count-1 do
        begin
          listaCReber[i].ItensContaCorrente[x].idContasReceber:=idContaReceber;
          TDAO.Inserir(listaCReber[i].ItensContaCorrente[x]);
        end;
      end;

      TDBEXpress.ComitaTransacao;
    finally
      TDBExpress.RollBackTransacao;
    end;
end;

function TContasReceberController.RemoverBaixa(
  idcontasReceber : integer): integer;
var Lancamentos : TObjectList<TLancamentoContabilVO>;
    ContasReceber:TContasReceberVO;
    i:integer;
begin
    TDBExpress.IniciaTransacao;
    try
      ContasReceber := nil;
      ContasReceber := self.ConsultarPorId(idContasReceber);
      ContasReceber.DtBaixa := 0;
      ContasReceber.VlBaixa := 0;
      ContasReceber.VlJuros := 0;
      ContasReceber.VlMulta := 0;
      ContasReceber.VlDesconto := 0;
      ContasReceber.IdHistoricoBx := 0;
      ContasReceber.IdContaBaixa := 0;
      ContasReceber.VlPago := 0;
      ContasReceber.FlBaixa := 'P';
      TDAO.Alterar(ContasReceber);

      Lancamentos:= TDAO.Consultar<TLancamentoContabilVO>(' LANCAMENTOCONTABIL.IDCONTASRECEBER = '+inttostr(ContasReceber.idContasReceber) +
                                                          ' AND LANCAMENTOCONTABIL.IDBAIXA = '+inttostr(ContasReceber.idContasReceber), '',0,true);
      if(Lancamentos.Count>0)then
      begin
        for i:=0 to Lancamentos.Count-1 do
        begin
          TDAO.Excluir(Lancamentos[i]);
        end;
      end;
      TDBEXpress.ComitaTransacao;
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
