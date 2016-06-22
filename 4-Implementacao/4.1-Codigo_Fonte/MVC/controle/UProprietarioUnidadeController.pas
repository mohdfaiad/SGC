unit UProprietarioUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UProprietarioUnidadeVO, UCondominioController;


type
  TProprietarioUnidadeController = class(TController<TProprietarioUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TProprietarioUnidadeVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TProprietarioUnidadeController.ConsultarPorId(id: integer): TProprietarioUnidadeVO;
var
  P: TProprietarioUnidadeVO;
  codominioController:TCondominioController;
begin
  P := TDAO.ConsultarPorId<TProprietarioUnidadeVO>(id);
{//  codominioController:=TCondominioController.Create;
//  if (P <> nil) then
  begin
    P.CondominioVO := codominioController.ConsultarPorId(P.idCondominio);
  end;
  codominioController.Free;    }
  result := P;
end;


begin


end.
