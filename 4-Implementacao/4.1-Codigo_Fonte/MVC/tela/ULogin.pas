unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, UUsuarioVO, UUsuarioController, Generics.Collections;

type
  TFormLogin = class(TForm)
    Image1: TImage;
    EditLogin: TEdit;
    EditSenha: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    BotaoConfirma: TBitBtn;
    BotaoCancela: TBitBtn;
    procedure BotaoConfirmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function ValidarCampos: Boolean;

  public
    { Public declarations }
    Logado: Boolean;
    ParSenha: String;
    ParUsuario: String;
    idUsuario : integer;
    function DoLogin: Boolean;



  end;

var
  FormLogin: TFormLogin;


implementation

{$R *.dfm}

uses ConexaoBD;

Function TFormLogin.ValidarCampos: Boolean;
Var // Este procedimento faz um loop em todos os componentes
  C: Byte; // do form, procurando Tedits e verificando se est�o em
begin // branco (vazios)

  Result := True; // Sup�e que todos os campo de user e senha for�o informados
  For C := 0 To ComponentCount - 1 Do
  Begin

    If (Components[C] is TEdit) Then
    // Se o componente atual for um Tedit ent�o...
    Begin
      If (Trim(TEdit(Components[C]).Text) = '') Then
      // Se o componente atual estiver em branco ent�o...
      Begin
        MessageDlg('Usu�rio ou Senha n�o informado', mtInformation, [mbOK], 0);
        (TEdit(Components[C]).SetFocus);
        // TypeCasting para acessar o m�todo SetFocus do componente
        Result := False; // Existe campos em branco (n�o for�o informados)
        Exit; // Sai do la�o para evitar que seja validado duas vezes, caso os dois edits estejam em branco
      End;
    end;

  End;
end;

procedure TFormLogin.BotaoConfirmaClick(Sender: TObject);
begin

  if ValidarCampos then
  begin
    try
      if DoLogin then
      begin
        Logado := True;
        Close;
      end
      else
      begin
        Application.MessageBox('N�o foi poss�vel realizar login.', 'Aten��o',
          MB_OK + MB_ICONWARNING);
      end;
    except
    end;
  end;

end;

function TFormLogin.DoLogin: Boolean;
var
  query,CommandText : string;
  Usuario : TUsuarioVO;
  listaUsuario: TObjectList<TUsuarioVO>;
  ControllerUsuario : TUsuarioController;
  ObjetoRetornoVO : TUsuarioVO;
begin
  Result := False;

  try
    TDBExpress.Conectar('Firebird');
    ControllerUsuario := TUsuarioController.Create;
    CommandText :=  ' UPPER(LOGIN) = ' + QuotedStr(UpperCase(EditLogin.Text)) +' AND SENHA = ' + QuotedStr(EditSenha.Text);
    listaUsuario := controllerUsuario.Consultar(CommandText);
    if (listaUsuario.Count > 0 )then
    begin
      Result := True;
      ObjetoRetornoVO := ControllerUsuario.ConsultarPorId(listaUsuario.First.idUsuario);
      idUsuario := ObjetoRetornoVO.idUsuario;
    end;
  except
    on e: Exception do
    begin
      Result := False;
      ShowMessage('Login e Senha Incorretos!');
    end;
  end;
end;

procedure TFormLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = Vk_Return then
    Screen.ActiveForm.Perform(Wm_NextDlgCtl, 0, 0);
  if Key = Vk_Up then
    Screen.ActiveForm.Perform(Wm_NextDlgCtl, 0, 1);

  if Key = VK_F11 then
    BotaoCancela.Click;
  if Key = VK_F12 then
    BotaoConfirma.Click;

end;

procedure TFormLogin.FormShow(Sender: TObject);
var
  Lista: TStringList;
  x: integer;
begin

  Logado := False;
  EditLogin.Text := '';

  Lista := TStringList.Create;
  try
    Lista.LoadFromFile('UltUsu');
    EditLogin.Text := Lista[0];
  except
  end;

  Lista.Free;
  EditLogin.SetFocus;

end;

end.
