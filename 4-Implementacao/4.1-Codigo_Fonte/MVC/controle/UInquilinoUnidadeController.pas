unit UInquilinoUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UCondominioController, UInquilinoUnidadeVO, UPessoasController, UUnidadeVO, UUnidadeController;


type
  TInquilinoUnidadeController = class(TController<TInquilinoUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TInquilinoUnidadeVO;
    procedure ValidarDados(Objeto:TInquilinoUnidadeVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TInquilinoUnidadeController.ConsultarPorId(id: integer): TInquilinoUnidadeVO;
var
  P: TInquilinoUnidadeVO;
  pessoaController : TPessoasController;
begin
  P := TDAO.ConsultarPorId<TInquilinoUnidadeVO>(id);
  pessoaController := TPessoasController.Create;

  if (P <> nil) then
  begin
      p.PessoaVo := pessoacontroller.ConsultarPorId(p.idPessoa);
  end;
  pessoaController.Free;
  result := P;
end;


procedure TInquilinoUnidadeController.ValidarDados(Objeto: TInquilinoUnidadeVO);
var
  query, data, idInquilino : string;
  listaInquilino:TObjectList<TInquilinoUnidadeVO>;
  UnidadeVo : TUnidadeVo;
  unidadeController : TUnidadeController;
begin
    data := DateToStr(Objeto.dtInicio);
    idInquilino := IntToStr(Objeto.idInquilinounidade);
    unidadeController := TUnidadeController.Create;
    UnidadeVo := UnidadeController.ConsultarPorId(Objeto.IdUnidade);


    Query :=  ' dtInicio = ' +QuotedStr(Data) + 'and idInquilinoUnidade <> '+QuotedStr(idInquilino) + 'and InquilinoUnidade.idunidade = ' + IntToStr(UnidadeVo.idUnidade);
    listaInquilino := self.Consultar(query);
    if (listaInquilino.Count > 0) then
      raise Exception.Create('Ja existe Inquilino informado nessa data');
end;

begin


end.
