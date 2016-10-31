unit UResponsavelVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UPessoasVO, UCondominioVO;

type
  [TEntity]
  [TTable('Responsavel')]
  TResponsavelVO = class(TGenericVO)
  private
    FidResponsavel : Integer;
    FidCondominio : Integer;
    FidPessoa : Integer;
    FOcupacao : String;
    FdtEntrada : TDateTime;
    FdtSaida : TDateTime;
    FRespReceita : String;

    Fnome : String;

  public

    PessoaVO : TPessoasVO;
    CondominioVO : TCondominioVO;

    [TId('idResponsavel')]
    [TGeneratedValue(sAuto)]
    property idResponsavel : Integer  read FidResponsavel write FidResponsavel;

    [TColumn('nome','Pessoa',250,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property Nome: string  read FNome write FNome;

    [TColumn('idCondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;

    [TColumn('idPessoa','Pessoa',0,[ldLookup,ldComboBox], False)]
    property idPessoa: integer  read FidPessoa write FidPessoa;

    [TColumn('Ocupacao','Ocupação',180,[ldGrid,ldLookup,ldComboBox], False)]
    property Ocupacao: string  read FOcupacao write FOcupacao;

    [TColumn('dtEntrada','Data Entrada',20,[ldGrid, ldLookup,ldComboBox], False)]
    property dtEntrada: TDateTime  read FdtEntrada write FdtEntrada;

    [TColumn('dtSaida','Data Saida',0,[ ldLookup,ldComboBox], False)]
    property dtSaida: TDateTime  read FdtSaida write FdtSaida;

    [TColumn('RespReceita','Receita',10,[ldGrid,ldLookup,ldComboBox], False)]
    property RespReceita: String  read FRespReceita write FRespReceita;


    procedure ValidarCamposObrigatorios;

  end;
implementation



{ TContadorVO }

procedure TResponsavelVO.ValidarCamposObrigatorios;
begin
  if (Self.FidPessoa =  0) then
  begin
    raise Exception.Create('O campo Pessoa é obrigatório!');
  end;
  if (Self.dtEntrada=  0) then
  begin
    raise Exception.Create('O campo Data Entrada   é obrigatório!');
  end;
end;

end.

