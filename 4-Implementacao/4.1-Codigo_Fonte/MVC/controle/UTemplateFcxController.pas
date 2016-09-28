unit UTemplateFcxController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UTemplateFcxVO, UCondominioController;


type
  TTemplateFcxController = class(TController<TTemplateFcxVO>)
  private

  public
    function ConsultarPorId(id: integer): TTemplateFcxVO;
    procedure ValidarDados(Objeto:TTemplateFcxVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TTemplateFcxController.ConsultarPorId(id: integer): TTemplateFcxVO;
var
  P: TTemplateFcxVO;
  condominioController : TCondominioController;

begin
  P := TDAO.ConsultarPorId<TTemplateFcxVO>(id);
  condominioController := TCondominioController.Create;


  if (P <> nil) then
  begin
      p.CondominioVO := condominioController.ConsultarPorId(p.idcondominio);
  end;
  condominioController.Free;
  result := P;
end;
procedure TTemplateFcxController.ValidarDados(Objeto: TTemplateFcxVO);
begin
  inherited;

end;

begin


end.
