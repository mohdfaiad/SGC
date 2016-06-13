unit UEstadoVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UPaisVO;

type
  [TEntity]
  [TTable('Estado')]
  TEstadoVO = class(TGenericVO)

  private
    FIdEstado: Integer;
    FnomeEstado: String;
    FIdPais : Integer;

  public
    PaisVO: TPAISVO;

    [TId('idEstado')]
    [TGeneratedValue(sAuto)]
    property idEstado: Integer  read FIdEstado write FIdEstado;
    [TColumn('NOMEESTADO','Estado',250,[ldGrid], False)]
    property NomeEstado: String  read FnomeEstado write FnomeEstado;

    [TColumn('idPais','idPais',0,[ldLookup,ldComboBox], False)]
    property idPais: integer  read FIdPais write FIdPais;

     function ValidarCamposObrigatorios:boolean;

  end;

implementation




{ TEstadoVO }

function TEstadoVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.FnomeEstado = '') then
  begin
    raise Exception.Create('O campo Nome é obrigatório!');
    Result := false;
  end
end;

end.
