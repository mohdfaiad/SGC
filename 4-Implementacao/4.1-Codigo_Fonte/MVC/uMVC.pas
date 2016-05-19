unit uMVC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ULogin, Vcl.Menus;
type
    TFormMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Pessoa1: TMenuItem;
    Sair1: TMenuItem;
    Pas1: TMenuItem;
    Cnae1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pessoa1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pas1Click(Sender: TObject);
    procedure Cnae1Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }

    function DoLogin: Boolean;

  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses Upessoa, UPais, UCnae;


procedure TFormMenu.Cnae1Click(Sender: TObject);
var FormCnae:TFTelaCadastroCnae;
begin
  Application.CreateForm(TFTelaCadastroCnae,FormCnae);
  FormCnae.ShowModal;
  FormCnae.Close;
end;

function TFormMenu.doLogin: Boolean;
var
  FormLogin: TFormLogin;
begin
  FormLogin := TFormLogin.Create(Self);
  try
    FormLogin.ShowModal;
    Result := FormLogin.Logado;
  finally
    FormLogin.Free;
  end;
end;


procedure TFormMenu.FormCreate(Sender: TObject);
begin
  if not DoLogin then
    Application.Terminate

end;

procedure TFormMenu.Pas1Click(Sender: TObject);
var FormPais:TFTelaCadastroPais;
begin
  Application.CreateForm(TFTelaCadastroPais,FormPais);
  FormPais.ShowModal;
  FormPais.Close;
end;

procedure TFormMenu.Pessoa1Click(Sender: TObject);
var FormPessoa:TFTelaCadastroPessoa;
begin
  Application.CreateForm(TFTelaCadastroPessoa,FormPessoa);
  FormPessoa.ShowModal;
  FormPessoa.Close;
end;

procedure TFormMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
