unit UContasPagarController;


interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UContasPagarVO, UPessoasController, UCondominioController,
  UPlanoCOntasController, UCondominioVO, UPlanoContasVO, UHistoricoVO;


type
  TContasPagarController = class(TController<TContasPagarVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasPagarVO;
    procedure ValidarDados(Objeto:TContasPagarVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasPagarController.ConsultarPorId(id: integer): TContasPagarVO;
var
  P: TContasPagarVO;



begin
  P := TDAO.ConsultarPorId<TContasPagarVO>(id);


  if (P <> nil) then
  begin
      p.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.IdCondominio);
      p.PessoaVO := TDAO.ConsultarPorId<TPessoasVO>(P.IdPessoa);
      p.PlanoContasContaVO := TDAO.ConsultarPorId<TPlanoContasVO>(P.IdConta);
      P.PlanoContasContraPartidaVO := TDao.ConsultarPorId<TPlanoContasVO>(P.IdContraPartida);
      p.HistoricoVO := TDao.ConsultarPorId<THistoricoVO>(P.IdHistorico);
  end;


  result := P;
end;

procedure TContasPagarController.ValidarDados(Objeto: TContasPagarVO);
begin
  inherited;

end;

begin

end.
