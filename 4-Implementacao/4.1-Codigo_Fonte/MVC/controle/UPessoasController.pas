unit UPessoasController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCnaeVO, UCidadeVO;

type
  TPessoasController = class(TController<TPessoasVO>)
  private

  public
    function ConsultarPorId(id: integer): TPessoasVO;
    procedure ValidarDados(Objeto:TPessoasVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs, UCidadeController;

{ TPessoasController }

{ TPessoasController }

function TPessoasController.ConsultarPorId(id: integer): TPessoasVO;
var
  P: TPessoasVO;
  cidadeController:TCidadeController;
begin
  P := TDAO.ConsultarPorId<TPessoasVO>(id);
  cidadeController:=TCidadeController.Create;
  if (P <> nil) then
  begin
    P.CnaeVO := TDAO.ConsultarPorId<TCnaeVO>(P.idCnae);
    P.CidadeVO := cidadeController.ConsultarPorId(P.idCidade);
  end;

  cidadeController.Free;
  result := P;
end;

procedure TPessoasController.ValidarDados(Objeto: TPessoasVO);
begin
  inherited;

end;

begin

end.
