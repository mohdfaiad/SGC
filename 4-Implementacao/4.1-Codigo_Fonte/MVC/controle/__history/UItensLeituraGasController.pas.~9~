unit UItensLeituraGasController;

interface

uses
    Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
    ConexaoBD,
   UPessoasVO, UController, DBClient, DB,  UPessoasController, UCondominioController,
   UPlanoCOntasController, UUnidadeVO, UPlanoContasVO, UHistoricoVO, UItensLeituraGasVo,
   ULancamentoContabilVO, ULeituraGasVO, UEmpresaTrab;


type
  TItensLeituraGasController = class(TController<TItensLeituraGasVO>)
  private

  public
    function ConsultarPorId(id: integer): TItensLeituraGasVO;
    procedure ValidarDados(Objeto:TItensLeituraGasVO);override;
    function Inserir( ItensLeitura :TItensLeituraGasVO): integer;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TItensLeituraGasController.Inserir(ItensLeitura :TItensLeituraGasVO): integer;
var contaPlano:TPlanoContasVO;
    Lancamento : TLancamentoContabilVO;
    listaConta :TObjectList<TPlanoContasVO>;
    Query : String;
    idContaUnidade, idcontadebito,idcontacredito:integer;
    PlanoContasController : TPlanoContasController;
begin
    Result := TDAO.Inserir(ItensLeitura);
    if(ItensLeitura.IdUnidade > 0)then
    begin
      PlanoContasController := TPlanoContasController.Create;
      Query :=  ' PlanoContas.idUnidade = ' +(IntTOsTR(ItensLeitura.IdUnidade));
      listaConta := PlanoContasController.Consultar(query);
      if (listaConta.Count > 0) then
      begin
        idContaUnidade:=listaConta[0].idPlanoContas;
      end;
    end;

      if ItensLeitura.IdUnidade >  0 then
      begin
         idContaDebito := idContaUnidade;
         idContaCredito := FormEmpresaTrab.ctLeituraGas;
      end;

      Lancamento := TLancamentoContabilVo.Create;
      Lancamento.idcontadebito := idContaDebito;
      Lancamento.idContaCredito := idContaCredito;
      Lancamento.complemento := 'Leitura Gás';
      Lancamento.dtLcto := ItensLeitura.dtLeitura;
      Lancamento.VlValor := ItensLeitura.vlCalculado;
      Lancamento.iditensleituragas := result;
      Lancamento.idHistorico :=0;
      TDao.Inserir(Lancamento);
end;

procedure TItensLeituraGasController.ValidarDados(
  Objeto: TItensLeituraGasVO);
begin
  inherited;
end;

function TItensLeituraGasController.ConsultarPorId(id: integer): TItensLeituraGasVO;
var
  P: TItensLeituraGasVO;

begin
  P := TDAO.ConsultarPorId<TItensLeituraGasVO>(id);


  if (P <> nil) then
  begin
      p.UnidadeVO := TDAO.ConsultarPorId<TUnidadeVo>(p.idUnidade);
  end;
  result := P;
end;


end.
