unit UProprietarioUnidadeController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UPessoasVO, UController, DBClient, DB, UCondominioVO, UProprietarioUnidadeVO,
  UPessoasCOntroller, UCondominioController, UUnidadeController, UUnidadeVO;


type
  TProprietarioUnidadeController = class(TController<TProprietarioUnidadeVO>)
  private

  public
    function ConsultarPorId(id: integer): TProprietarioUnidadeVO;
    procedure ValidarDados(Objeto:TProprietarioUnidadeVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;

function TProprietarioUnidadeController.ConsultarPorId(id: integer): TProprietarioUnidadeVO;
var
  P: TProprietarioUnidadeVO;
  pessoaController : TPessoasController;
begin
  P := TDAO.ConsultarPorId<TProprietarioUnidadeVO>(id);
  pessoaController := TPessoasController.Create;

  if (P <> nil) then
  begin
      p.PessoaVo := pessoacontroller.ConsultarPorId(p.idPessoa);

  end;
  pessoaController.Free;
  result := P;
end;


procedure TProprietarioUnidadeController.ValidarDados(
  Objeto: TProprietarioUnidadeVO);
var
  query, data, idProprietario : string;
  listaProprietario :TObjectList<TProprietarioUnidadeVO>;
  UnidadeVo : TUnidadeVo;
  unidadeController : TUnidadeController;
begin
    data := DateToStr(Objeto.dtInicio);
    idProprietario := IntToStr(Objeto.idProprietarioUnidade);
    unidadeController := TUnidadeController.Create;
    UnidadeVo := UnidadeController.ConsultarPorId(Objeto.IdUnidade);


    Query :=  ' dtInicio = ' +QuotedStr(Data) + 'and idProprietarioUnidade <> '+QuotedStr(idProprietario) + 'and ProprietarioUnidade.idunidade = ' + IntToStr(UnidadeVo.idUnidade);
    listaProprietario := self.Consultar(query);
    if (listaProprietario.Count > 0) then
      raise Exception.Create('Ja existe Proprietário informado nessa data');
end;

begin


end.
