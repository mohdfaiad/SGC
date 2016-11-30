unit UProprietarioUnidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCondominioVO, UpESSOAsVO;

type
  [TEntity]
  [TTable('ProprietarioUnidade')]
  TProprietarioUnidadeVO = class(TGenericVO)
  private
    FidProprietarioUnidade: Integer;
    FidUnidade: Integer;
    FdtInicio : TdateTime;
    FidPessoa : Integer;
    FNomePessoa : string;

  public
    CondominioVO : TCondominioVO;
    PessoaVo : TpESSOASVO;


    [TId('idproprietariounidade')]
    [TGeneratedValue(sAuto)]
    property idProprietarioUnidade: Integer  read FidProprietarioUnidade write FidProprietarioUnidade;
    [TColumn('nome','Pessoa',500,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property NomePessoa: string  read FNomePessoa write FNomePessoa;
    [TColumn('idunidade','Unidade',50,[ldLookup,ldComboBox], False)]
    property IdUnidade: Integer  read FidUnidade write FidUnidade;
    [TColumn('idpessoa','id Pessoa',50,[ldLookup,ldComboBox], False)]
    property idPessoa: Integer  read FidPessoa write FidPessoa;
    [TColumn('DtInicio','Data Inicio',0,[ldGrid,ldLookup,ldComboBox], False)]
    property DtInicio: TDateTime  read FdtInicio write FdtInicio;

    Procedure ValidarCamposObrigatorios;

  end;

  implementation

  { TProprietarioUnidadeVO }

Procedure TProprietarioUnidadeVO.ValidarCamposObrigatorios;
begin
 if (Self.FidPessoa = 0) then
  begin
    raise Exception.Create('O campo Inquilino é obrigatório!');
  end
  else if (self.FdtInicio = 0) then
  begin
    raise Exception.Create('O campo data é obrigatório!');
  end;
end;

end.

