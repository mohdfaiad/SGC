unit UCidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UEstadoVO, UPaisVo, UCidadeVO;

type
  TCidadeController = class(TController<TCidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TCidadeVO;
    procedure ValidarDados(Objeto:TCidadeVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

{ TPessoasController }

{ TPessoasController }

function TCidadeController.ConsultarPorId(id: integer): TCidadeVO;
var
  p: TCidadeVO;
begin
  p := TDAO.ConsultarPorId<TCidadeVO>(id);
  if (p <> nil) then
  begin
    p.PaisVO := TDAO.ConsultarPorId<TPaisVO>(p.idPais);
    p.EstadoVO := TDAO.ConsultarPorId<TEstadoVO>(p.idEstado);
  end;
  result := p;
end;

procedure TCidadeController.ValidarDados(Objeto: TCidadeVO);
begin
  inherited;

end;

begin

end.
