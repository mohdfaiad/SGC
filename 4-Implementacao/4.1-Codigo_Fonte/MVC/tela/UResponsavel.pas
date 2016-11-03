unit UResponsavel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UResponsavelVO,
  UResponsavelCOntroller, Generics.Collections, UPessoa, UPessoasVO, UPessoasController, biblioteca;

type
  TFTelaCadastroResponsavel = class(TFTelaCadastro)
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    Label6: TLabel;
    LabeledEditPessoa: TEdit;
    BitBtn3: TBitBtn;
    LabeledEditNomePessoa: TEdit;
    Label3: TLabel;
    MaskEditDtInicio: TMaskEdit;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    LabeledEditSenha: TEdit;
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure LabeledEditPessoaExit(Sender: TObject);
    procedure MaskEditDtInicioExit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    idCondominio : Integer;
    procedure GridParaEdits; override;
    function EditsToObject(Responsavel: TResponsavelVO): TResponsavelVO;
  end;

var
  FTelaCadastroResponsavel: TFTelaCadastroResponsavel;
  ControllerResponsavel: TResponsavelController;

implementation

{$R *.dfm}

{ TFTelaCadastroResponsavel }

procedure TFTelaCadastroResponsavel.BitBtn3Click(Sender: TObject);
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


procedure TFTelaCadastroResponsavel.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabeledEditPessoa.setFocus;
end;

procedure TFTelaCadastroResponsavel.DoConsultar;
var
  listaResponsavel: TObjectList<TResponsavelVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaResponsavel := ControllerResponsavel.Consultar(filtro, 'ORDER BY DTENTRADA DESC');
  PopulaGrid<TResponsavelVO>(listaResponsavel);
end;

function TFTelaCadastroResponsavel.DoExcluir: boolean;
var
  Responsavel: TResponsavelVO;
begin
  try
    try
      Responsavel := TResponsavelVO.Create;
      Responsavel.idResponsavel := CDSGrid.FieldByName('IDRESPONSAVEL').AsInteger;
      ControllerResponsavel.Excluir(Responsavel);
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

function TFTelaCadastroResponsavel.DoSalvar: boolean;
var
  Responsavel: TResponsavelVO;
begin
    Responsavel:=EditsToObject(TResponsavelVO.Create);
    try
      try
        Responsavel.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
        begin
          Responsavel.idCondominio := idCondominio;
          ControllerResponsavel.Inserir(Responsavel);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          Responsavel := ControllerResponsavel.ConsultarPorId(CDSGrid.FieldByName('IDRESPONSAVEL')
            .AsInteger);
          Responsavel := EditsToObject(Responsavel);
          ControllerResponsavel.Alterar(Responsavel);
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

function TFTelaCadastroResponsavel.EditsToObject(
  Responsavel: TResponsavelVO): TResponsavelVO;
begin

  if (LabeledEditPessoa.Text <> '') then
    Responsavel.idPessoa := strtoint(LabeledEditPessoa.Text);
  if (LabeledEditSenha.Text<>'') then
    Responsavel.Ocupacao := LabeledEditSenha.Text;
  if (MaskEditDtInicio.Text<>'  /  /    ') then
    Responsavel.dtEntrada := StrToDate(MaskEditDtInicio.Text);
  if (MaskEdit1.Text <> '  /  /    ') then
    Responsavel.dtSaida := StrToDate(MaskEdit1.Text);
  if (CheckBox1.Checked = true)then
    Responsavel.RespReceita := 'S'
  else
    Responsavel.RespReceita := 'N';

  Result := Responsavel;

end;

procedure TFTelaCadastroResponsavel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerResponsavel);
end;

procedure TFTelaCadastroResponsavel.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TResponsavelVO;
  RadioButton1.Checked := true;
  ControllerResponsavel := TResponsavelController.Create;
  inherited;
end;

procedure TFTelaCadastroResponsavel.GridParaEdits;
var
  Responsavel: TResponsavelVO;
begin
  inherited;

  Responsavel := nil;
  if not CDSGrid.IsEmpty then
    Responsavel := ControllerResponsavel.ConsultarPorId(CDSGrid.FieldByName('IDRESPONSAVEL')
      .AsInteger);

  if Responsavel <> nil then
  begin
    if Responsavel.PessoaVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(Responsavel.PessoaVO.idPessoa);
      LabeledEditNomePessoa.Text := Responsavel.PessoaVO.nome;
    end;
    LabeledEditSenha.Text := Responsavel.Ocupacao;
    if (Responsavel.dtEntrada <> 0) then
      MaskEditDtInicio.Text := DateToStr(Responsavel.dtEntrada);
    if (Responsavel.dtSaida <> 0 ) then
      MaskEdit1.Text := DateToStr(Responsavel.dtSaida);
    if (Responsavel.RespReceita <> '') then
      CheckBox1.Checked := true
    else
      CheckBox1.Checked := false;
  end;

end;

procedure TFTelaCadastroResponsavel.LabeledEditPessoaExit(Sender: TObject);
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
    raise Exception.Create('Código Inválido');
    end;
  end;
end;

procedure TFTelaCadastroResponsavel.MaskEdit1Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroResponsavel.MaskEditDtInicioExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

function TFTelaCadastroResponsavel.MontaFiltro: string;
begin

  Result := ' (IDCONDOMINIO = '+inttostr(IDCONDOMINIO)+')';

  if (RadioButton1.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result :=  '( UPPER(NOME) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ') ';
    end;
  end;
end;

end.
