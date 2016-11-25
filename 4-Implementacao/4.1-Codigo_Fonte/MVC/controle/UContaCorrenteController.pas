unit UContaCorrenteController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UContaCorrenteVO, UContasReceberVO, ULancamentoContabilVO;


type
  TContaCorrenteController = class(TController<TContaCorrenteVO>)
  private

  public
    function ConsultarPorId(id: integer): TContaCorrenteVO;
    procedure ValidarDados(Objeto: TContaCorrenteVO);
   end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TContaCorrenteController.ConsultarPorId(id: integer): TContaCorrenteVO;
var
  P: TContaCorrenteVo;


begin
  P := TDAO.ConsultarPorId<TContaCorrenteVO>(id);


  if (P <> nil) then
  begin
      //p.ContasReceverVo := TDAO.ConsultarPorId<TContasReceberVO>(P.idContasReceber);
    //  P.LctoVO := TDAO.ConsultarPorId<TLancamentoContabilVO>(p.idLcto);
  end;
  result := P;
end;

procedure TContaCorrenteController.ValidarDados(Objeto: TContaCorrenteVO);
var WhereQuery:STring;
    mes,ano,dia:word;
    objetosretorno:TObjectList<TContaCorrenteVO>;
begin
  { DecodeDate(objeto.,ano,mes,dia);

   whereQuery:=' IDCONDOMINIO = '+ IntToStr(Objeto.IDCONDOMINIO);
   whereQuery:=whereQuery + ' AND ( EXTRACT(MONTH FROM DTRATEIO) = '+inttostr(mes)+ ' AND ';
   whereQuery:=whereQuery + '       EXTRACT(YEAR FROM DTRATEIO) = '+inttostr(ano)+ ' ) ';

    ObjetosREtorno := self.Consultar(whereQuery);
    if(objetosRetorno.Count>0)then
      raise Exception.Create('Rateio ja realizada para mês ano informado!');  }
end;

begin


end.
