unit UUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UUnidadeVO, UCondominioController,
  UPlanoContasVO;


type
  TUnidadeController = class(TController<TUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TUnidadeVO;
    function Inserir(Unidade: TUnidadeVO): integer;
    function Excluir(Unidade: TUnidadeVO): boolean;
    procedure ValidarDados(Objeto:TUnidadeVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;



function TUnidadeController.ConsultarPorId(id: integer): TUnidadeVO;
var
  P: TUnidadeVO;
  //codominioController:TCondominioController;
begin
  P := TDAO.ConsultarPorId<TUnidadeVO>(id);
  //codominioController:=TCondominioController.Create;
  if (P <> nil) then
  begin
    P.CondominioVO := TDAO.ConsultarPorId<TCondominioVO>(P.idCondominio);
  end;
  //codominioController.Free;
  result := P;
end;

function TUnidadeController.Excluir(Unidade: TUnidadeVO): boolean;
var contas:TObjectList<TPlanoContasVO>;
begin
  try
    TDBExpress.IniciaTransacao;
    contas:= TDAO.Consultar<TPlanoContasVO>(' IDUNIDADE = '+inttostr(UNIDADE.idUnidade), '',0,true);
    if(contas.Count>0)then
    begin
      TDAO.Excluir(contas.First);
    end;
    Result := TDAO.Excluir(Unidade);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

function TUnidadeController.Inserir(Unidade: TUnidadeVO): integer;
var contaPlano:TPlanoContasVO;
begin
  try
    TDBExpress.IniciaTransacao;
    Result := TDAO.Inserir(Unidade);
    contaPlano:=TPlanoContasVO.Create;
    contaPlano.nrClassificacao:= '1.1.20.01';
    contaplano.dsConta:= Unidade.DsUnidade;
    contaplano.flTipo:= 'U';
    contaPlano.idcondominio:=unidade.idcondominio;
    contaPlano.idUnidade:= Result;
    TDAO.Inserir(contaPlano);
    TDBExpress.ComitaTransacao;
  finally
    TDBExpress.RollBackTransacao;
  end;
end;

procedure TUnidadeController.ValidarDados(Objeto: TUnidadeVO);
begin
  inherited;

end;

begin

end.
