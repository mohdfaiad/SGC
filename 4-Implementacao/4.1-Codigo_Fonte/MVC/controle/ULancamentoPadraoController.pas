unit ULancamentoPadraoController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
   UPessoasVO, UController, DBClient, DB,  UPessoasController, UCondominioController,
   UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO, ULancamentoPadraoVo,
   UContasReceberVo, UContasPagarVO, ULoteVO;

type
  TLancamentoPadraoController = class(TController<TLancamentoPadraoVO>)
  private

  public
    function ConsultarPorId(id: integer): TLancamentoPadraoVO;
    procedure ValidarDados(Objeto:TLancamentoPadraoVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

procedure TLancamentoPadraoController.ValidarDados(
  Objeto: TLancamentoPadraoVO);
begin
  inherited;
end;

function TLancamentoPadraoController.ConsultarPorId(id: integer): TLancamentoPadraoVO;
var
  P: TLancamentoPadraoVO;
  condominioController : TCondominioController;

begin
  P := TDAO.ConsultarPorId<TLancamentoPadraoVO>(id);


  if (P <> nil) then
  begin
      p.ContaDebitoVo := TDao.ConsultarPorId<TPlanoContasVO>(P.idcontadebito);
      p.ContaCreditoVO := TDAO.ConsultarPorId<TPlanoContasVO>(P.idContaCredito);
      p.HistoricoVO := TDAO.ConsultarPorId<THistoricoVO>(p.idHistorico);
      p.CondominioVO := TDao.ConsultarPorId<TCondominioVO>(p.idCondominio);
  end;

  result := P;

end;


end.
