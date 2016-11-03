unit UContador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Generics.Collections,
  UContadorVO, UContadorController, UPessoa, UPessoasVO, UPessoasController, biblioteca;

type
  TFTelaCadastroContador = class(TFTelaCadastro)
    GroupBox3: TGroupBox;
    RadioButtonPessoa: TRadioButton;
    Label6: TLabel;
    LabeledEditPessoa: TEdit;
    BitBtn3: TBitBtn;
    LabeledEditNomePessoa: TEdit;
    Label1: TLabel;
    LabeledEditLogin: TEdit;
    Label5: TLabel;
    LabeledEditSenha: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    MaskEditDtInicio: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
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
    procedure MaskEdit2Exit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    idCondominio : Integer;
    procedure GridParaEdits; override;
    function EditsToObject(Contador: TContadorVO): TContadorVO;
  end;

var
  FTelaCadastroContador: TFTelaCadastroContador;
  ControllerContador: TContadorController;

implementation

{$R *.dfm}



{ TFTelaCadastroContador }

procedure TFTelaCadastroContador.BitBtn3Click(Sender: TObject);
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

procedure TFTelaCadastroContador.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabeledEditPessoa.setFocus;
end;

procedure TFTelaCadastroContador.DoConsultar;
var
  listaContador: TObjectList<TContadorVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaContador := ControllerContador.Consultar(filtro, 'ORDER BY DTENTRADA DESC');
  PopulaGrid<TContadorVO>(listaContador);
end;

function TFTelaCadastroContador.DoExcluir: boolean;
var
  Contador: TContadorVO;
begin
  try
    try
      Contador := TContadorVO.Create;
      Contador.idContador := CDSGrid.FieldByName('IDCONTADOR').AsInteger;
      ControllerContador.Excluir(Contador);
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


function TFTelaCadastroContador.DoSalvar: boolean;
var
  Contador: TContadorVO;
begin
    Contador:=EditsToObject(TContadorVO.Create);
    try
      try
        Contador.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
        begin
          Contador.idCondominio := idCondominio;
          ControllerContador.Inserir(Contador);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          Contador := ControllerContador.ConsultarPorId(CDSGrid.FieldByName('IDCONTADOR')
            .AsInteger);
          Contador := EditsToObject(Contador);
          ControllerContador.Alterar(Contador);
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

function TFTelaCadastroContador.EditsToObject(
  Contador: TContadorVO): TContadorVO;
begin
  if (LabeledEditPessoa.Text <> '') then
    Contador.idPessoa := strtoint(LabeledEditPessoa.Text);
  if (LabeledEditLogin.Text<> '') then
    Contador.Crc := LabeledEditLogin.Text;
  if (LabeledEditSenha.Text<>'') then
    Contador.Ocupacao := LabeledEditSenha.Text;
  if (MaskEditDtInicio.Text<>'  /  /    ') then
    Contador.dtEntrada := StrToDate(MaskEditDtInicio.Text);
  if (MaskEdit1.Text <> '  /  /    ') then
    Contador.dtSaida := StrToDate(MaskEdit1.Text);
  if (Edit1.Text <> '')then
    Contador.CertidaoReg := Edit1.Text;
  if (MaskEdit2.Text <> '  /  /    ') then
    Contador.dtValidade := StrToDate(MaskEdit2.Text);

  Result := Contador;
end;

procedure TFTelaCadastroContador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerContador);
end;

procedure TFTelaCadastroContador.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContadorVO;
  RadioButtonPessoa.Checked := true;
  ControllerContador := TContadorController.Create;
  inherited;
end;

procedure TFTelaCadastroContador.GridParaEdits;
var
  Contador: TContadorVO;
begin
  inherited;

  Contador := nil;
  if not CDSGrid.IsEmpty then
    Contador := ControllerContador.ConsultarPorId(CDSGrid.FieldByName('IDCONTADOR')
      .AsInteger);

  if Contador <> nil then
  begin
    if Contador.PessoaVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(Contador.PessoaVO.idPessoa);
      LabeledEditNomePessoa.Text := Contador.PessoaVO.nome;
    end;
    LabeledEditLogin.Text := Contador.Crc;
    LabeledEditSenha.Text := Contador.Ocupacao;
    if (Contador.dtEntrada <> 0) then
      MaskEditDtInicio.Text := DateToStr(Contador.dtEntrada);
    if (Contador.dtSaida <> 0 ) then
      MaskEdit1.Text := DateToStr(COntador.dtSaida);
    if (Contador.dtValidade <> 0) then
      MaskEdit2.Text := DateToStr(Contador.dtValidade);


    Edit1.Text := Contador.CertidaoReg;

  end;
end;

procedure TFTelaCadastroContador.LabeledEditPessoaExit(Sender: TObject);
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

procedure TFTelaCadastroContador.MaskEdit1Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContador.MaskEdit2Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContador.MaskEditDtInicioExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

function TFTelaCadastroContador.MontaFiltro: string;
begin

  Result := ' (IDCONDOMINIO = '+inttostr(IDCONDOMINIO)+')';

  if (RadioButtonPessoa.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result :=  '( UPPER(CRC) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ') ';
    end;
  end;
  if (RadioButton1.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(NOME) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end;
end;

end.
