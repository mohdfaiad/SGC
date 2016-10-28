unit UUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Generics.Collections,
  UUsuarioController, UUsuarioVO, UPessoa, UPessoasVo, UPessoasController;

type
  TFTelaCadastroUsuario = class(TFTelaCadastro)
    Label1: TLabel;
    LabeledEditLogin: TEdit;
    Label5: TLabel;
    LabeledEditSenha: TEdit;
    Label6: TLabel;
    LabeledEditPessoa: TEdit;
    BitBtn3: TBitBtn;
    LabeledEditNomePessoa: TEdit;
    GroupBox3: TGroupBox;
    RadioButtonPessoa: TRadioButton;
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure LabeledEditPessoaExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Usuario: TUsuarioVO): TUsuarioVO;
  end;

var
  FTelaCadastroUsuario: TFTelaCadastroUsuario;
  ControllerUsuario: TUsuarioController;

implementation

{$R *.dfm}



{ TFTelaCadastroUsuario }

procedure TFTelaCadastroUsuario.BitBtn3Click(Sender: TObject);
var
  FormPessoaConsulta: TFTelaCadastroPessoa;
begin
  FormPessoaConsulta := TFTelaCadastroPessoa.Create(nil);
  FormPessoaConsulta.FechaForm := true;
  FormPessoaConsulta.ShowModal;
  if (FormPessoaConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditPessoa.Text := IntToStr(TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).idpessoa);
    LabeledEditNomePessoa.Text := TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).nome;
  end;
  FormPessoaConsulta.Release;
end;

procedure TFTelaCadastroUsuario.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabeledEditPessoa.setFocus;
end;


procedure TFTelaCadastroUsuario.DoConsultar;
var
  listaUsuario: TObjectList<TUsuarioVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaUsuario := ControllerUsuario.Consultar(filtro);
  PopulaGrid<TUsuarioVO>(listaUsuario);
end;

function TFTelaCadastroUsuario.DoExcluir: boolean;
var
  Usuario: TUsuarioVO;
begin
  try
    try
      Usuario := TUsuarioVO.Create;
      Usuario.idUsuario := CDSGrid.FieldByName('IDUSUARIO').AsInteger;
      ControllerUsuario.Excluir(Usuario);
    except
      on E: Exception do
      begin
        ShowMessage('Ocorreu um erro ao excluir o registro: ' + #13 + #13 +
          E.Message);
        Result := false;
      end;
    end;
  finally
  end;

end;

function TFTelaCadastroUsuario.DoSalvar: boolean;
var
  Usuario: TUsuarioVO;
begin
    Usuario:=EditsToObject(TUsuarioVO.Create);
    try
      try
        Usuario.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
        begin
          ControllerUsuario.Inserir(Usuario);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          Usuario := ControllerUsuario.ConsultarPorId(CDSGrid.FieldByName('IDUSUARIO')
            .AsInteger);
          Usuario := EditsToObject(Usuario);
          ControllerUsuario.Alterar(Usuario);
          Result := true;
        end
      except
        on E: Exception do
        begin
          ShowMessage(E.Message);
          Result := false;
        end;
      end;
    finally
    end;
end;

function TFTelaCadastroUsuario.EditsToObject(Usuario: TUsuarioVO): TUsuarioVO;
begin
if (LabeledEditPessoa.Text <> '') then
    Usuario.idPessoa := strtoint(LabeledEditPessoa.Text);
  if (LabeledEditLogin.Text<> '') then
    Usuario.login := LabeledEditLogin.Text;
  if (LabeledEditSenha.Text<>'') then
    Usuario.senha := LabeledEditSenha.Text;

  Result := Usuario;

end;

procedure TFTelaCadastroUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerUsuario);

end;

procedure TFTelaCadastroUsuario.FormCreate(Sender: TObject);
begin

  ClasseObjetoGridVO := TUsuarioVO;
  RadioButtonPessoa.Checked := true;
  ControllerUsuario := TUsuarioController.Create;
  inherited;
end;

procedure TFTelaCadastroUsuario.GridParaEdits;
var
  Usuario: TUsuarioVO;
begin
  inherited;

  Usuario := nil;
  if not CDSGrid.IsEmpty then
    Usuario := ControllerUsuario.ConsultarPorId(CDSGrid.FieldByName('IDUSUARIO')
      .AsInteger);

  if Usuario <> nil then
  begin
    if usuario.PessoaVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(Usuario.PessoaVO.idPessoa);
      LabeledEditNomePessoa.Text := Usuario.PessoaVO.nome;
    end;
    LabeledEditLogin.Text := Usuario.Login;
    LabeledEditSenha.Text := Usuario.senha;
  end;
end;

procedure TFTelaCadastroUsuario.LabeledEditPessoaExit(Sender: TObject);
var
  PessoaController:TPessoasController;
  PessoaVO: TPessoasVO;
begin
  if LabeledEditPessoa.Text <> '' then
  begin
  try
    PessoaController := TPessoasController.Create;
    PessoaVO := PessoaController.ConsultarPorId(StrToInt(LabeledEditPessoa.Text));
    labeledEditNomePessoa.Text := PessoaVO.nome;
    LabeledEditPessoa.Text := inttostr(PessoaVO.idPessoa);
    PessoaController.Free;
  except
    raise Exception.Create('C�digo Inv�lido');
    end;
  end;
end;

function TFTelaCadastroUsuario.MontaFiltro: string;
begin
  Result := '';
  if (RadioButtonPessoa.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(LOGIN) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end;
end;

end.
