unit UUsuarioVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UPessoasVO;

type
  [TEntity]
  [TTable('Usuario')]
  TUsuarioVO = class(TGenericVO)
  private
    FidUsuario : Integer;
    FLogin : String;
    FSenha : String;
    FidPessoa : Integer;
    Fnome : String;

  public

    PessoaVO : TPessoasVO;

    [TId('idUsuario')]
    [TGeneratedValue(sAuto)]
    property idUsuario : Integer  read FidUsuario write FidUsuario;

    [TColumn('login','Login',150,[ldGrid,ldLookup,ldComboBox], False)]
    property Login: String  read FLogin write FLogin;

    [TColumn('senha','Senha',50,[ldLookup,ldComboBox], False)]
    property senha: string  read FSenha write FSenha;

    [TColumn('idPessoa','Pessoa',0,[ldLookup,ldComboBox], False)]
    property idPessoa: integer  read FidPessoa write FidPessoa;

    [TColumn('nome','Pessoa',300,[ldGrid], True, 'Pessoa', 'idPessoa', 'idPessoa')]
    property Nome: string  read FNome write FNome;


    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TUsuarioVO.ValidarCamposObrigatorios;
begin
  if (Self.FidPessoa =  0) then
  begin
    raise Exception.Create('O campo Pessoa é obrigatório!');
  end;
   if (Self.Login = '') then
  begin
    raise Exception.Create('O campo Login é obrigatório!');
  end;
   if (Self.senha = '') then
  begin
    raise Exception.Create('O campo Senha é obrigatório!');
  end;

end;
end.

