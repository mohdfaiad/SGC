unit UContasPagarController;


interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UContasPagarVO, UPessoasController, UCondominioController;


type
  TContasPagarController = class(TController<TContasPagarVO>)
  private

  public
    function ConsultarPorId(id: integer): TContasPagarVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContasPagarController.ConsultarPorId(id: integer): TContasPagarVO;
var
  P: TContasPagarVO;
  condominioController : TCondominioController;
  pessoaController : TPessoasController;

begin
  P := TDAO.ConsultarPorId<TContasPagarVO>(id);
  condominioController := TCondominioController.Create;
  pessoaController := TPessoasController.Create;


  if (P <> nil) then
  begin
      p.CondominioVO := condominioController.ConsultarPorId(p.idcondominio);
      p.PessoaVO := pessoaController.ConsultarPorId(p.IdPessoa);

  end;

  condominioController.Free;
  pessoaController.Free;
  result := P;
end;
begin


end.
