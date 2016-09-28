unit UPaisController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UPaisVO;

type
  TPaisController = class(TController<TPaisVO>)
  private

  public
    function ConsultarPorId(id: integer): TPaisVO;
    procedure ValidarDados(Objeto:TPaisVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TPaisController.ConsultarPorId(id: integer): TPaisVO;
var
  P: TPaisVO;
begin
  P := TDAO.ConsultarPorId<TPaisVO>(id);
  result := P;
end;

procedure TPaisController.ValidarDados(Objeto: TPaisVO);
begin
  inherited;

end;

begin

end.
