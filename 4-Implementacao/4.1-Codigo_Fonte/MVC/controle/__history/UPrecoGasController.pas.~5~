unit UPrecoGasController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UPrecoGasVO, UPessoasVO;

type
  TPrecoGasController = class(TController<TPrecoGasVO>)
  private

  public
    function ConsultarPorId(id: integer): TPrecoGasVO;
    procedure ValidarDados(Objeto:TPrecoGasVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TPrecoGasController.ConsultarPorId(id: integer)
  : TPrecoGasVO;
var
  P: TPrecoGasVO;
begin
  P := TDAO.ConsultarPorId<TPrecoGasVO>(id);
  if (P <> nil) then
  begin
     p.PessoaVo := TDAO.ConsultarPorId<TPessoasVO>(P.idPessoa);
  end;
  result := P;
end;

procedure TPrecoGasController.ValidarDados(Objeto: TPrecoGasVO);
begin
  inherited;

end;

begin

end.
