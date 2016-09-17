unit UInquilinoUnidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UCondominioVO, UPessoasVO;

type
  [TEntity]
  [TTable('InquilinoUnidade')]
  TInquilinoUnidadeVO = class(TGenericVO)
  private
    FidInquilino: Integer;
    FidUnidade: Integer;
    FdtInicio : TdateTime;

  public
    CondominioVO : TCondominioVO;
    PessoaVo : TPessoasVO;

    [TId('idinquilino')]
    [TGeneratedValue(sAuto)]
    property idInquilino: Integer  read FidInquilino write FidInquilino;
    [TColumn('idunidade','Unidade',50,[ldGrid,ldLookup,ldComboBox], False)]
    property IdUnidade: Integer  read FidUnidade write FidUnidade;
    [TColumn('DtInicio','Data Inicio',0,[ldLookup,ldComboBox], False)]
    property DtInicio: TDateTime  read FdtInicio write FdtInicio;

    procedure ValidarCampos;

  end;

  implementation

  { TProprietarioUnidadeVO }

procedure TInquilinoUnidadeVO.ValidarCampos;
begin

  if (Self.FidInquilino = 0) then
  begin
    raise Exception.Create('O campo Inquilino é obrigatório!');

  end
  else if (self.FdtInicio = 0) then
  begin
    raise Exception.Create('O campo data é obrigatório!');

  end;
end;

end.

