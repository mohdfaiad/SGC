unit ConexaoBD;

interface

uses Classes, SQLExpr, WideStrings, DB, SysUtils, DBXFirebird,
  IWSystem, Inifiles;

type

  TDBExpress = class(TSQLConnection)
  private
    class var Banco: String;
    class var Conexao: TSQLConnection;
    class procedure ConfigurarConexao(var pConexao: TSQLConnection;
      pBD: String);
  public
    class procedure Conectar(BD: String);
    class procedure Desconectar;
    class function getConexao: TSQLConnection;
    class function getBanco: String;
  end;

implementation

class procedure TDBExpress.Conectar(BD: String);
begin
  Conexao := TSQLConnection.Create(nil);
  ConfigurarConexao(Conexao, BD);
  Conexao.KeepConnection := True;
  Conexao.AutoClone := False;
  Conexao.Connected := True;
  Banco := BD;
end;

class procedure TDBExpress.Desconectar;
begin
  Conexao.Connected := False;
end;

class function TDBExpress.getBanco: String;
begin
  Result := Banco;
end;

class function TDBExpress.getConexao: TSQLConnection;
begin
  Result := Conexao;
end;

class procedure TDBExpress.ConfigurarConexao(var pConexao: TSQLConnection;
  pBD: String);
var
  Arquivo: String;
  Parametros: TStrings;
begin
  // Carrega valores para conexão com banco de dados
  { Conexao.Connected := false;
    Conexao.LoginPrompt := false;
    Conexao.ParamsLoaded := True;
    Conexao.DriverName := 'MySQL';
    Conexao.GetDriverFunc := 'getSQLDriverMYSQL50';
    Conexao.LibraryName := 'dbxopenmysql50.dll';
    Conexao.VendorLib := 'libmysql.dll';
    Conexao.Params.Clear;
    Conexao.Params.Add('servercharset=utf8');
    Conexao.Params.Add('hostname=localhost');
    Conexao.Params.Add('user_name=mysql');
    Conexao.Params.Add('password=mysql');
    Conexao.Params.Add('Database=SGC'); }

  if pBD = 'Firebird' then
  begin

    Arquivo := gsAppPath + 'config.txt';

    Conexao.DriverName := 'Firebird';
    Conexao.ConnectionName := 'FBConnection';
    Conexao.GetDriverFunc := 'getSQLDriverINTERBASE';
    Conexao.LibraryName := 'dbxfb.dll';
    Conexao.VendorLib := 'fbclient.dll';
  end;

  // variável para carregar os parametros do banco
  Parametros := TStringList.Create;

  try
    Parametros.LoadFromFile(Arquivo);
    Conexao.Params.Text := Parametros.Text;
  finally
    Parametros.Free;
  end;
  Conexao.LoginPrompt := False;
  Conexao.Name := 'Conexao';
end;

end.
