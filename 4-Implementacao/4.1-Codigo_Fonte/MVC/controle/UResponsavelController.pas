unit UResponsavelController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UResponsavelVO,UPessoasVo, UPessoasController ;


type
  TResponsavelController = class(TController<TResponsavelVO>)
  private

  public
    function ConsultarPorId(id: integer): TResponsavelVO;
    procedure ValidarDados(Objeto:TResponsavelVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;



{ TUsuarioController }

function TResponsavelController.ConsultarPorId(id: integer): TResponsavelVO;
var
  P: TResponsavelVO;
  PessoaController : TPessoasController;

begin
  P := TDAO.ConsultarPorId<TResponsavelVO>(id);


  if (P <> nil) then
  begin
     p.PessoaVo := TDAO.ConsultarPorId<TPessoasVO>(P.idPessoa);
  end;
  result := P;
end;

procedure TResponsavelController.ValidarDados(Objeto: TResponsavelVO);
var
  query, data, idResponsavel : string;
  listaResponsavel :TObjectList<TResponsavelVO>;
begin
    data := DateToStr(Objeto.dtEntrada);
    idResponsavel := IntToStr(Objeto.idResponsavel);
    Query :=  ' dtEntrada = ' +QuotedStr(Data) + 'and idresponsavel <> '+QuotedStr(idResponsavel);
    listaResponsavel := self.Consultar(query);
    if (listaResponsavel.Count > 0) then
      raise Exception.Create('Ja existe responsável informado nessa data');
end;

begin


end.
