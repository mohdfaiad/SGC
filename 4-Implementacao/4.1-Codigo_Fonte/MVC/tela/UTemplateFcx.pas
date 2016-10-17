unit UTemplateFcx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, UTemplateFcxVO,
  UEmpresaTrab, UTemplateFcxController, Generics.Collections, UPlanoContas, UPlanoContasVO;

type
  TFTelaCadastroTemplateFcx = class(TFTelaCadastro)
    GroupBox2: TGroupBox;
    RadioButtonCodigo: TRadioButton;
    RadioButtonDescricao: TRadioButton;
    LabelEditCodigo: TLabeledEdit;
    EditClassificacao: TMaskEdit;
    LabeledEditDescricao: TLabeledEdit;
    ComboBoxTipo: TComboBox;
    LabeledEditOrdem: TLabeledEdit;
    LabeledEditTotal: TLabeledEdit;
    Telefone_1: TLabel;
    Label1: TLabel;
    EditClassificacaoFcx: TMaskEdit;
    Label2: TLabel;
    BtnBxConta: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnBxContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(TemplateFcx : TTemplateFcxVO): TTemplateFcxVO;
  end;

var
  FTelaCadastroTemplateFcx: TFTelaCadastroTemplateFcx;

implementation

{$R *.dfm}

{ TFTelaCadastroTemplateFcx }
var
  ControllerTemplateFcx : TTemplateFcxController;

procedure TFTelaCadastroTemplateFcx.BitBtnNovoClick(Sender: TObject);
begin
   inherited;
   LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroTemplateFcx.BtnBxContaClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    EditClassificacao.Text := (TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).nrClassificacao);
    //EditBxDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroTemplateFcx.DoConsultar;
var
  listaTemplateFcx: TObjectList<TTemplateFcxVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaTemplateFcx := ControllerTemplateFcx.Consultar(filtro);
  PopulaGrid<TTemplateFcxVO>(listaTemplateFcx);
end;

function TFTelaCadastroTemplateFcx.DoExcluir: boolean;
var
  TemplateFcx: TTemplateFcxVO;
begin
  try
    try
      TemplateFcx := TTemplateFcxVO.Create;
      TemplateFcx.idFcx := CDSGrid.FieldByName('IDFCX').AsInteger;
      ControllerTemplateFcx.Excluir(TemplateFcx);
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


function TFTelaCadastroTemplateFcx.DoSalvar: boolean;
var
   TemplateFcx: TTemplateFcxVO;
begin
  begin
    TemplateFcx:=EditsToObject(TTemplateFcxVO.Create);
    try
      try
       TemplateFcx.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
              TemplateFcx.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerTemplateFcx.Inserir(TemplateFcx);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            TemplateFcx := ControllerTemplateFcx.ConsultarPorId(CDSGrid.FieldByName('IDFCX')
              .AsInteger);
            TemplateFcx := EditsToObject(TemplateFcx);
            ControllerTemplateFcx.Alterar(TemplateFcx);
            Result := true;
          end
        else
          Result := false;
        end;
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
end;

function TFTelaCadastroTemplateFcx.EditsToObject(
  TemplateFcx: TTemplateFcxVO): TTemplateFcxVO;
begin
if LabelEditCodigo.Text <> '' then
  begin
     TemplateFcx.idTemplate := StrToInt(LabelEditCodigo.Text);
  end;
  if LabeledEditDescricao.Text <> '' then
  begin
    TemplateFcx.descricao := LabeledEditDescricao.Text;;
  end;
  if EditClassificacao.Text <> '' then
  begin
    TemplateFcx.ClassificacaoContabil := EditClassificacao.Text;
  end;
  if EditClassificacaoFcx.Text <> '' then
  begin
    TemplateFcx.Classificacao := EditClassificacaoFcx.Text;
  end;
  if ComboboxTipo.ItemIndex >= 0  then
  begin
    TemplateFcx.flTipo := IntToStr(comboboxTipo.ItemIndex);
  end;
  if LabeledEditOrdem.Text <> '' then
  begin
    TemplateFcx.linha := LabeledEditOrdem.Text;
  end;
  if LabeledEditTotal.Text <> '' then
  begin
    TemplateFcx.linhatotal := LabeledEditTotal.Text;
  end;

  Result := TemplateFcx;

end;

procedure TFTelaCadastroTemplateFcx.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerTemplateFcx);
end;

procedure TFTelaCadastroTemplateFcx.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTemplateFcxVO;
  ControllerTemplateFcx := TTemplateFcxController.Create;
  inherited;
end;

procedure TFTelaCadastroTemplateFcx.GridParaEdits;
var
  TemplateFcx: TTemplateFcxVO;
begin
  inherited;
  TemplateFcx := nil;

  if not CDSGrid.IsEmpty then
    TemplateFcx := ControllerTemplateFcx.ConsultarPorId
      (CDSGrid.FieldByName('IDFCX').AsInteger);

  if TemplateFcx <> nil then
  begin
    LabelEditCodigo.Text := IntToStr(TemplateFcx.idTemplate);
    LabeledEditDescricao.Text := TemplateFcx.descricao;
    EditClassificacao.Text := TemplateFcx.ClassificacaoContabil;
    EditClassificacaoFcx.Text := TemplateFcx.Classificacao;
    LabeledEditOrdem.Text := TemplateFcx.linha;
    LabeledEditTotal.Text := TemplateFcx.linhatotal;
//    comboboxTipo.ItemIndex := IntToStr(TemplateFcx.flTipo);
  end;
end;

function TFTelaCadastroTemplateFcx.MontaFiltro: string;
begin
  Result := ' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButtonCodigo.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(IDTEMPLATE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
      if (editBusca.Text <> '') then
      begin
        Result := '( UPPER(DESCRICAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
      end;
  end;
end;

end.
