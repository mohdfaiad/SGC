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
      p.ContasReceverVo := TDAO.ConsultarPorId<TContasReceberVO>(P.idContasReceber);
      P.LctoVO := TDAO.ConsultarPorId<TLancamentoContabilVO>(p.idLcto);
  end;
  result := P;
end;

begin


end.
