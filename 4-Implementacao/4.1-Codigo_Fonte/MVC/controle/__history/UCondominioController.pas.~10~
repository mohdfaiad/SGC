unit UCondominioController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCnaeVO, UCondominioVO,
  UNaturezaJuridicaVO, UCidadeController;

type
  TCondominioController = class(TController<TCondominioVO>)
  private

  public
    function ConsultarPorId(id: integer): TCondominioVO;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

{ TPessoasController }

{ TPessoasController }

function TCondominioController.ConsultarPorId(id: integer): TCondominioVO;
var
  P: TCondominioVO;
  cidadeController:TCidadeController;
begin
  P := TDAO.ConsultarPorId<TCondominioVO>(id);
  cidadeController:=TCidadeController.Create;
  if (P <> nil) then
  begin
    P.CnaeVO := TDAO.ConsultarPorId<TCnaeVO>(P.idCnae);
    P.NaturezaVO := TDAO.ConsultarPorId<TNaturezaJuridicaVO>
      (P.idNaturezaJuridica);
    P.CidadeVO := cidadeController.ConsultarPorId(P.idCidade);
  end;
  cidadeController.Free;
  result := P;
end;

begin

end.
