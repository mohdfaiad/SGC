unit UPessoasController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCnaeVO;

type
  TPessoasController = class(TController<TPessoasVO>)
  private

  public
    function ConsultarPorId(id: integer): TPessoasVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

{ TPessoasController }

{ TPessoasController }

function TPessoasController.ConsultarPorId(id: integer): TPessoasVO;
var
  P: TPessoasVO;
begin
  P := TDAO.ConsultarPorId<TPessoasVO>(id);
  if (P <> nil) then
    P.CnaeVO := TDAO.ConsultarPorId<TCnaeVO>(P.idCnae);
  result := P;
end;

begin

end.
