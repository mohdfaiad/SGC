unit UNaturezaJuridicaController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UNaturezaJuridicaVO;

type
  TNaturezaJuridicaController = class(TController<TNaturezaJuridicaVO>)
  private

  public
    function ConsultarPorId(id: integer): TNaturezaJuridicaVO;
    procedure ValidarDados(Objeto:TNaturezaJuridicaVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TNaturezaJuridicaController.ConsultarPorId(id: integer)
  : TNaturezaJuridicaVO;
var
  P: TNaturezaJuridicaVO;
begin
  P := TDAO.ConsultarPorId<TNaturezaJuridicaVO>(id);
  result := P;
end;

procedure TNaturezaJuridicaController.ValidarDados(Objeto: TNaturezaJuridicaVO);
begin
  inherited;

end;

begin

end.
