unit UProprietarioUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UProprietarioUnidadeVO,
  UPessoasCOntroller, UCondominioController;


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
  pessoaController : TPessoasController;
begin
  P := TDAO.ConsultarPorId<TProprietarioUnidadeVO>(id);
  pessoaController := TPessoasController.Create;

  if (P <> nil) then
  begin
      p.PessoaVo := pessoacontroller.ConsultarPorId(p.idProprietario);
  end;
  pessoaController.Free;
  result := P;
end;


begin


end.
