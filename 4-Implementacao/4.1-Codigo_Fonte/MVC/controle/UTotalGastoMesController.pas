unit UTotalGastoMesController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UTotalGastoMesVO;

type
  TTotalGastoMesController = class(TController<TTotalGastoMesVO>)
  private

  public
    function ConsultarPorId(id: integer): TTotalGastoMesVO;
    procedure ValidarDados(Objeto:TTotalGastoMesVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TTotalGastoMesController.ConsultarPorId(id: integer)
  : TTotalGastoMesVO;
var
  P: TTotalGastoMesVO;
begin
  P := TDAO.ConsultarPorId<TTotalGastoMesVO>(id);
  result := P;
end;

procedure TTotalGastoMesController.ValidarDados(Objeto: TTotalGastoMesVO);
var
  query, data, idTotalGastoMes : string;
  listaTotalGastoMes :TObjectList<TTotalGastoMesVO>;
begin
    data := DateToStr(Objeto.dtMesAno);
    idTotalGastoMes := IntToStr(Objeto.idTotalGastoMes);
    Query :=  ' dtMesAno = ' +QuotedStr(Data) + 'and idTotalGastoMes <> '+QuotedStr(idTotalGastoMes);
    listaTotalGastoMes := self.Consultar(query);
    if (listaTotalGastoMes.Count > 0) then
      raise Exception.Create('Ja existe Total Gasto Mês informado nessa data');
end;

begin

end.
