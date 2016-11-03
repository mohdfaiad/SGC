unit UTotalGastoMesController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UTotalGastoMesVO;

type
  TTotalGastoMesController = class(TController<TTotalGastoMesVO>)
  private

  public
    function ConsultarPorId(id: integer): TTotalGastoMesVO;
    procedure ValidarDados(Objeto:TTotalGastoMesVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TTotalGastoMesController.ConsultarPorId(id: integer)
  : TTotalGastoMesVO;
var
  P: TTotalGastoMesVO;
begin
  P := TDAO.ConsultarPorId<TTotalGastoMesVO>(id);
  result := P;
end;

procedure TTotalGastoMesController.ValidarDados(Objeto: TTotalGastoMesVO);
begin
  inherited;

end;

begin

end.
