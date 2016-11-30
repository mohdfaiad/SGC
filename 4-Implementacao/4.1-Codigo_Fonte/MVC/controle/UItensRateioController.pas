unit UItensRateioController;

interface

uses
    Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
    ConexaoBD,
   UPessoasVO, UController, DBClient, DB,  UPessoasController, UCondominioController,
   UPlanoCOntasController, UUnidadeVO, UPlanoContasVO, UHistoricoVO, UItensRateioVo,
   ULancamentoContabilVO, ULeituraGasVO, UEmpresaTrab;


type
  TItensRateioController = class(TController<TItensRateioVO>)
  private

  public
    function ConsultarPorId(id: integer): TItensRateioVO;
    procedure ValidarDados(Objeto:TItensRateioVO);override;
    function Inserir( ItensRateio :TItensRateioVO): integer;
    function Excluir(ItensRateio :TItensRateioVO): boolean;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TItensRateioController.Excluir(ItensRateio: TItensRateioVO): boolean;
var Lancamento : TObjectList<TLancamentoContabilVO>;
  i : integer;
begin
 try
    TDBExpress.IniciaTransacao;
    Lancamento:= TDAO.Consultar<TLancamentoContabilVO>('LANCAMENTOCONTABIL.IDITENSRATEIO = '+inttostr(ItensRateio.idItensRateio),'',0,true);
  if(Lancamento.Count>0)then
    begin
    for I := 0 to Lancamento.Count-1 do
      TDAO.Excluir(Lancamento[i]);
    end;
    Result := TDAO.Excluir(ItensRateio);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;
function TItensRateioController.Inserir(ItensRateio :TItensRateioVO): integer;
var contaPlano:TPlanoContasVO;
    Lancamento : TLancamentoContabilVO;
    listaConta :TObjectList<TPlanoContasVO>;
    Query : String;
    idContaUnidade, idContaDebitoRateio,idcontacreditorateio, idctDebitoFundo, idCtCreditoFundo:integer;
    PlanoContasController : TPlanoContasController;
begin
     Result := TDAO.Inserir(ItensRateio);

    if(ItensRateio.IdUnidade > 0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ItensRateio.IdUnidade));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count > 0) then
      begin
        idContaUnidade:=listaConta[0].idPlanoContas;
      end;
    end;

      if ItensRateio.IdUnidade >  0 then
      begin
         idContaDebitoRateio := idContaUnidade;
         idcontacreditorateio := FormEmpresaTrab.ctrateio;
         idCtDebitoFundo := idContaUnidade;
         idCtCreditoFundo := FormEmpresaTrab.ctfundoreserva;
      end;
      if idContaDebitoRateio > 0 then
      begin
          Lancamento := TLancamentoContabilVo.Create;
          Lancamento.idcontadebito := idContaDebitoRateio;
          Lancamento.idContaCredito := idcontacreditorateio;
          Lancamento.complemento := '';
          Lancamento.dtLcto := ItensRateio.dtRateio;
          Lancamento.VlValor := ItensRateio.vlRateio;
          Lancamento.idItensRateio := result;
          Lancamento.idHistorico := formempresatrab.idhistoricor;
          TDao.Inserir(Lancamento);
      end;
      if idCtDebitoFundo > 0 then
      begin
          Lancamento := TLancamentoContabilVo.Create;
          Lancamento.idcontadebito := idCtDebitoFundo;
          Lancamento.idContaCredito := idCtCreditoFundo;
          Lancamento.complemento := '';
          Lancamento.dtLcto := ItensRateio.dtRateio;
          Lancamento.VlValor := ItensRateio.vlFundoReserva;
          Lancamento.idItensRateio := result;
          Lancamento.idHistorico :=formempresatrab.idhistoricof;
          TDao.Inserir(Lancamento);
      end;
end;

procedure TItensRateioController.ValidarDados(
  Objeto: TItensRateioVO);
begin
  inherited;
end;

function TItensRateioController.ConsultarPorId(id: integer): TItensRateioVO;
var
  P: TItensRateioVO;

begin
  P := TDAO.ConsultarPorId<TItensRateioVO>(id);


  if (P <> nil) then
  begin
      p.UnidadeVO := TDAO.ConsultarPorId<TUnidadeVo>(p.idUnidade);
  end;
  result := P;
end;


end.
