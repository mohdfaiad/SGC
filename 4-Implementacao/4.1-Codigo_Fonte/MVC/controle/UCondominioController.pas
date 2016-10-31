unit UCondominioController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCnaeVO, UCondominioVO,
  UNaturezaJuridicaVO, UCidadeController, UPrecoGasVO, UPrecoGasController ;

type
  TCondominioController = class(TController<TCondominioVO>)
  private

  public
    function ConsultarPorId(id: integer): TCondominioVO;
     procedure ValidarDados(Objeto:TCondominioVO);override;
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
  PrecoGasController : TPrecoGasController;
begin
  P := TDAO.ConsultarPorId<TCondominioVO>(id);
  cidadeController:=TCidadeController.Create;
  if (P <> nil) then
  begin
    P.CnaeVO := TDAO.ConsultarPorId<TCnaeVO>(P.idCnae);
    P.NaturezaVO := TDAO.ConsultarPorId<TNaturezaJuridicaVO>
      (P.idNaturezaJuridica);
    P.CidadeVO := cidadeController.ConsultarPorId(P.idCidade);
    P.PrecoGasVO := PrecoGasController.ConsultarPorId(p.idPrecoGas);
  end;
  cidadeController.Free;
  result := P;
end;

procedure TCondominioController.ValidarDados(Objeto: TCondominioVO);
begin
  inherited;

end;

begin

end.
