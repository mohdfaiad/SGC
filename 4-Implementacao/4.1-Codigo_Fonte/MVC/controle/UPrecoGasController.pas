unit UPrecoGasController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UPrecoGasVO;

type
  TPrecoGasController = class(TController<TPrecoGasVO>)
  private

  public
    function ConsultarPorId(id: integer): TPrecoGasVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TPrecoGasController.ConsultarPorId(id: integer)
  : TPrecoGasVO;
var
  P: TPrecoGasVO;
begin
  P := TDAO.ConsultarPorId<TPrecoGasVO>(id);
  result := P;
end;

begin

end.
