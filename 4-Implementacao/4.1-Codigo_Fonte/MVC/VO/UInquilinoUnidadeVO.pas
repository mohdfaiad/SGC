unit UInquilinoUnidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCnaeVO, UCidadeVO, UEstadoVO, UPaisVO;

type
  [TEntity]
  [TTable('InquilinoUnidade')]
  TInquilinoUnidadeVO = class(TGenericVO)
  private
    FidInquilino: Integer;
    FidUnidade: Integer;
    FdtInicio : TdateTime;

  public

    [TId('idproprietario')]
    [TGeneratedValue(sAuto)]
    property idInquilino: Integer  read FidInquilino write FidInquilino;
    [TColumn('idunidade','Unidade',50,[ldGrid,ldLookup,ldComboBox], False)]
    property IdUnidade: Integer  read FidUnidade write FidUnidade;
    [TColumn('DtInicio','Data Inicio',0,[ldLookup,ldComboBox], False)]
    property DtInicio: TDateTime  read FdtInicio write FdtInicio;

    Function ValidarCamposObrigatorios:boolean;

  end;

  implementation

  { TProprietarioUnidadeVO }

function TInquilinoUnidadeVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.FidInquilino = 0) then
  begin
    raise Exception.Create('O campo Inquilino � obrigat�rio!');
    Result := false;
  end
  else if (self.FdtInicio = 0) then
    raise Exception.Create('O campo data � obrigat�rio!');
    Result := false;
end;

end.

