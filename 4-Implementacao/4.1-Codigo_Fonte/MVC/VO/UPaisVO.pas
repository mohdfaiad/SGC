unit UPaisVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('Pais')]
  TPaisVO = class(TGenericVO)

  private
    FidPais: Integer;
    FnomePais: String;

    //FidCidade: integer;

  public
    [TId('idPais')]
    [TGeneratedValue(sAuto)]
    property idPais: Integer  read FidPais write FidPais;

    [TColumn('NOMEPAIS','País',250,[ldGrid], False)]
    property NomePais: String  read FnomePais write FnomePais;

    function ValidarCamposObrigatorios:boolean;

  end;

implementation


{ TPaisVO }



{ TPaisVO }

function TPaisVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.FnomePais = '') then
  begin
    raise Exception.Create('O campo Nome é obrigatório!');
    Result := false;
  end
end;

end.
