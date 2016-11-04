unit UPlanoContasController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UPlanoContasVO, UPessoasController, UCondominioController, UUnidadeController;


type
  TPlanoContasController = class(TController<TPlanoContasVO>)
  private

  public

    function ConsultarPorId(id: integer): TPlanoContasVO;
    procedure ValidarDados(Objeto:TplanoContasVO);override;
   // function Inserir(Objeto: TPlanoContasController): integer; override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs, System.Contnrs;

function TPlanoContasController.ConsultarPorId(id: integer): TPlanoContasVO;
var
  P: TPlanoContasVO;
  unidadeController : TUnidadeController;
  condominioController : TCondominioController;
  pessoaController : TPessoasController;

begin
  P := TDAO.ConsultarPorId<TPlanoContasVO>(id);
  //unidadeController := TUnidadeController.Create;
  //condominioController := TCondominioController.Create;
  //pessoaController := TPessoasController.Create;


  //if (P <> nil) then
  //begin
    //  p.UnidadeVO := unidadeController.ConsultarPorId(p.idUnidade);
      //p.CondominioVO := condominioController.ConsultarPorId(p.idcondominio);
  //    p.idPessoa := TPessoaVO.

  //end;
  //unidadeController.Free;
  //condominioController.Free;
 // pessoaController.Free;
  result := P;
end;

{function TPlanoContasController.Inserir(
  Objeto: TPlanoContasController): integer;
var  classificacao : string;
    objetosRetorno : TObjectList<TPlanoContasVO>;
begin
  classificacao := ' classificacao like '+QuotedStr('1');
  TDAO.Consultar(classificacao);
  inherited;
end;}

procedure TPlanoContasController.ValidarDados(Objeto:TplanoContasVO);
var classificacaoAnterior,WhereQuery :STring;
    objetosretorno:TObjectList<TPlanoContasVO>;
begin

  if(objeto.flTipo<>'S')THEN
  begin
    classificacaoAnterior:= Copy(objeto.nrClassificacao,0, Objeto.nrClassificacao.LastIndexOf('.'));
    whereQuery:=' FLTIPO = '+QuotedStr('S')+' AND nrclassificacao = '+QuotedStr(classificacaoAnterior);
    ObjetosREtorno := self.Consultar(whereQuery);
    if(objetosRetorno.Count<=0)then
      raise Exception.Create('A conta informada não possui conta sintética a ser referenciada!');
  end;




end;

end.
