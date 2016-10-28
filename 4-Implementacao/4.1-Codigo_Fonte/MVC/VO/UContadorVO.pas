unit UContadorVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UPessoasVO, UCondominioVO;

type
  [TEntity]
  [TTable('Contador')]
  TContadorVO = class(TGenericVO)
  private
    FidContador : Integer;
    FidCondominio : Integer;
    FidPessoa : Integer;
    FCrc : String;
    FOcupacao : String;

    Fnome : String;

  public

    PessoaVO : TPessoasVO;
    CondominioVO : TCondominioVO;

    [TId('idContador')]
    [TGeneratedValue(sAuto)]
    property idContador : Integer  read FidContador write FidContador;

    [TColumn('nome','Pessoa',250,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property Nome: string  read FNome write FNome;

    [TColumn('idCondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;

    [TColumn('idPessoa','Pessoa',0,[ldLookup,ldComboBox], False)]
    property idPessoa: integer  read FidPessoa write FidPessoa;

    [TColumn('Crc','CRC',100,[ldGrid,ldLookup,ldComboBox], False)]
    property Crc: String  read FCrc write FCrc;

    [TColumn('Ocupacao','Ocupa��o',180,[ldGrid,ldLookup,ldComboBox], False)]
    property Ocupacao: string  read FOcupacao write FOcupacao;

    procedure ValidarCamposObrigatorios;

  end;
implementation



{ TContadorVO }

procedure TContadorVO.ValidarCamposObrigatorios;
begin
  if (Self.FidPessoa =  0) then
  begin
    raise Exception.Create('O campo Pessoa � obrigat�rio!');
  end;
end;

end.

