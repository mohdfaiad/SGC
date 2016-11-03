unit UUsuarioController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UUsuarioVO,UPessoasVo, UPessoasController;


type
  TUsuarioController = class(TController<TUsuarioVO>)
  private

  public
    function ConsultarPorId(id: integer): TUsuarioVO;
    procedure ValidarDados(Objeto:TUsuarioVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;



{ TUsuarioController }

function TUsuarioController.ConsultarPorId(id: integer): TUsuarioVO;
var
  P: TUsuarioVO;
  PessoaController : TPessoasController;

begin
  P := TDAO.ConsultarPorId<TUsuarioVO>(id);


  if (P <> nil) then
  begin
     p.PessoaVo := TDAO.ConsultarPorId<TPessoasVO>(P.idPessoa);
  end;
  result := P;
end;

procedure TUsuarioController.ValidarDados(Objeto: TUsuarioVO);
begin
  inherited;

end;

begin


end.
