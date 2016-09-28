unit UUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UUnidadeVO, UCondominioController;


type
  TUnidadeController = class(TController<TUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TUnidadeVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TUnidadeController.ConsultarPorId(id: integer): TUnidadeVO;
var
  P: TUnidadeVO;
  //codominioController:TCondominioController;
begin
  P := TDAO.ConsultarPorId<TUnidadeVO>(id);
  //codominioController:=TCondominioController.Create;
  if (P <> nil) then
  begin
    P.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.idCondominio);
  end;
  //codominioController.Free;
  result := P;
end;

begin

end.
