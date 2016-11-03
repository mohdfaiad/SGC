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
var
  query, data, idPrecoGas : string;
  listaPrecoGas :TObjectList<TPrecoGasVO>;
begin
    data := DateToStr(Objeto.dtmesano);
    idPrecoGas := IntToStr(Objeto.idPrecoGas);
    Query :=  ' dtmesano = ' +QuotedStr(Data) + 'and idprecogas <> '+QuotedStr(idPrecoGas);
    listaPrecoGas := self.Consultar(query);
    if (listaPrecoGas.Count > 0) then
      raise Exception.Create('Ja existe Preço Gás informado nessa data');

end;

begin

end.
