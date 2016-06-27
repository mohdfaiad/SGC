unit UProprietarioUnidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCondominioVO, UpESSOAsVO;

type
  [TEntity]
  [TTable('ProprietarioUnidade')]
  TProprietarioUnidadeVO = class(TGenericVO)
  private
    FidProprietario: Integer;
    FidUnidade: Integer;
    FdtInicio : TdateTime;

  public
    CondominioVO : TCondominioVO;
    PessoaVo : TpESSOASVO;

    [TId('idproprietario')]
    [TGeneratedValue(sAuto)]
    property idProprietario: Integer  read FidProprietario write FidProprietario;
    [TColumn('idunidade','Unidade',50,[ldGrid,ldLookup,ldComboBox], False)]
    property IdUnidade: Integer  read FidUnidade write FidUnidade;
    [TColumn('DtInicio','Data Inicio',0,[ldLookup,ldComboBox], False)]
    property DtInicio: TDateTime  read FdtInicio write FdtInicio;

    Function ValidarCamposObrigatorios:boolean;

  end;

  implementation

  { TProprietarioUnidadeVO }

function TProprietarioUnidadeVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.FidProprietario = 0) then
  begin
    raise Exception.Create('O campo Proprietário é obrigatório!');
    Result := false;
  end
  else if (self.FdtInicio = 0) then
  begin
    raise Exception.Create('O campo data é obrigatório!');
    Result := false;
  end;

end;

end.

