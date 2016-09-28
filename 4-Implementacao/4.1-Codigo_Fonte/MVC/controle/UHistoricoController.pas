unit UHistoricoController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UHistoricoVO;

type
  THistoricoController = class(TController<THistoricoVO>)
  private

  public
    function ConsultarPorId(id: integer): THistoricoVO;
    procedure ValidarDados(Objeto:THistoricoVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function THistoricoController.ConsultarPorId(id: integer): THistoricoVO;
var
  P: THistoricoVO;
begin
  P := TDAO.ConsultarPorId<THistoricoVO>(id);
  result := P;
end;

procedure THistoricoController.ValidarDados(Objeto: THistoricoVO);
begin
  inherited;

end;

begin

end.
