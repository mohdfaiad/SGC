unit UEstadoController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UEstadoVO, UPaisVo;

type
  TEstadoController = class(TController<TEstadoVO>)
  private

  public
    function ConsultarPorId(id: integer): TEstadoVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

{ TPessoasController }

{ TPessoasController }

function TEstadoController.ConsultarPorId(id: integer): TEstadoVO;
var
  P: TEstadoVO;
begin
  P := TDAO.ConsultarPorId<TEstadoVO>(id);
  if (P <> nil) then
    P.PaisVO := TDAO.ConsultarPorId<TPaisVO>(P.idPais);
  result := P;
end;

begin

end.
