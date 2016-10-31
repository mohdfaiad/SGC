unit UContadorController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, DBXJSON, DBXCommon,
  ConexaoBD,
  UController, DBClient, DB, UContadorVO,UPessoasVo, UPessoasController ;


type
  TContadorController = class(TController<TContadorVO>)
  private

  public
    function ConsultarPorId(id: integer): TContadorVO;
    procedure ValidarDados(Objeto:TContadorVO);override;
  end;

implementation

uses
  UDao, Constantes, Vcl.Dialogs;



{ TUsuarioController }

function TContadorController.ConsultarPorId(id: integer): TContadorVO;
var
  P: TContadorVO;
  PessoaController : TPessoasController;

begin
  P := TDAO.ConsultarPorId<TContadorVO>(id);


  if (P <> nil) then
  begin
     p.PessoaVo := TDAO.ConsultarPorId<TPessoasVO>(P.idPessoa);
  end;
  result := P;
end;

procedure TContadorController.ValidarDados(Objeto: TContadorVO);
var
  query, data, idContador : string;
  listaContador :TObjectList<TContadorVO>;
begin
    data := DateToStr(Objeto.dtEntrada);
    idContador := IntToStr(Objeto.idContador);
    Query :=  ' dtEntrada = ' +QuotedStr(Data) + 'and idcontador <> '+QuotedStr(idcontador);
    listaContador := self.Consultar(query);
    if (ListaContador.Count > 0) then
      raise Exception.Create('Ja existe contador informado nessa data');
end;

begin


end.
