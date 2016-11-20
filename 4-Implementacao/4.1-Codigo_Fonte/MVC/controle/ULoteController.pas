unit ULoteController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, ULoteVO,UCondominioVo, UCondominioController;


type
  TLoteController = class(TController<TLoteVO>)
  private

  public
    function ConsultarPorId(id: integer): TLoteVO;
    procedure ValidarDados(Objeto:TLoteVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TLoteController.ConsultarPorId(id: integer): TLoteVO;
var
  P: TLoteVO;
  condominioController : TCondominioController;

begin
  P := TDAO.ConsultarPorId<TLoteVO>(id);


  if (P <> nil) then
  begin
      p.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.IdCondominio);
  end;
  result := P;
end;
procedure TLoteController.ValidarDados(Objeto: TLoteVO);
var WhereQuery:STring;
    mes,ano,dia:word;
    objetosretorno:TObjectList<TLoteVO>;
begin
   DecodeDate(objeto.dtLote,ano,mes,dia);

   whereQuery:=' NRLOTE = '+ Objeto.nrLote +' AND IDCONDOMINIO = '+ IntToStr(Objeto.idCondominio);
   whereQuery:=whereQuery + ' AND ( EXTRACT(MONTH FROM DTLOTE) = '+inttostr(mes)+ ' AND ';
   whereQuery:=whereQuery + '       EXTRACT(YEAR FROM DTLOTE) = '+inttostr(ano)+ ' ) ';

    ObjetosREtorno := self.Consultar(whereQuery);
    if(objetosRetorno.Count>0)then
      raise Exception.Create('Lote ja cadastrado para mês ano informado!');
end;

begin


end.
