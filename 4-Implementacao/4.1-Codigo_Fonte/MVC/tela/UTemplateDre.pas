unit UTemplateDre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UTemplateDreVO,
  Generics.Collections,UTemplateDreController, UEmpresaTrab;

type
  TFTelaCadastroTemplateDre = class(TFTelaCadastro)
    LabelEditCodigo: TLabeledEdit;
    LabeledEditDescricao: TLabeledEdit;
    LabeledEditOrdem: TLabeledEdit;
    LabeledEditTotal: TLabeledEdit;
    ComboBoxTipo: TComboBox;
    Label1: TLabel;
    EditClassificacao: TMaskEdit;
    Telefone_1: TLabel;
    GroupBox2: TGroupBox;
    RadioButtonCodigo: TRadioButton;
    RadioButtonDescricao: TRadioButton;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(TemplateDre: TTemplateDreVO): TTemplateDreVO;
  end;

var
  FTelaCadastroTemplateDre: TFTelaCadastroTemplateDre;

implementation

{$R *.dfm}
var
TemplateDreController: TTemplateDreController;

procedure TFTelaCadastroTemplateDre.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroTemplateDre.DoConsultar;
var
  listaTemplateDre: TObjectList<TTemplateDreVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaTemplateDre := TemplateDreController.Consultar(filtro);
  PopulaGrid<TTemplateDreVO>(listaTemplateDre);
end;

function TFTelaCadastroTemplateDre.DoExcluir: boolean;
var
  TemplateDre: TTemplateDreVO;
begin
  try
    try
      TemplateDre := TTemplateDreVO.Create;
      TemplateDre.idDre := CDSGrid.FieldByName('IDDRE').AsInteger;
      TemplateDreController.Excluir(TemplateDre);
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


function TFTelaCadastroTemplateDre.DoSalvar: boolean;
var
   TemplateDre: TTemplateDreVO;
begin
  begin
    TemplateDre:=EditsToObject(TTemplateDreVO.Create);
    try
      try
        if (TemplateDre.ValidarCamposObrigatorios()) then
        begin
           if (StatusTela = stInserindo) then
           begin
              TemplateDre.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              TemplateDreController.Inserir(TemplateDre);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            TemplateDre := TemplateDreController.ConsultarPorId(CDSGrid.FieldByName('IDDRE')
              .AsInteger);
            TemplateDre := EditsToObject(TemplateDre);
            TemplateDreController.Alterar(TemplateDre);
            Result := true;
          end;
        end
        else
          Result := false;
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

function TFTelaCadastroTemplateDre.EditsToObject(
  TemplateDre: TTemplateDreVO): TTemplateDreVO;
begin
  TemplateDre.idTemplate := StrToInt(LabelEditCodigo.Text);
  TemplateDre.descricao := LabeledEditDescricao.Text;
  TemplateDre.Classificacao := EditClassificacao.Text;
  TemplateDre.flTipo := IntToStr(comboboxTipo.ItemIndex);
  TemplateDre.ordem := LabeledEditOrdem.Text;
  TemplateDre.total := LabeledEditTotal.Text;
  Result := TemplateDre;

end;

procedure TFTelaCadastroTemplateDre.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TTemplateDreVO;
  inherited;

end;

procedure TFTelaCadastroTemplateDre.GridParaEdits;
var
  TemplateDre: TTemplateDreVO;
begin
  inherited;
  TemplateDre := nil;

  if not CDSGrid.IsEmpty then
    TemplateDre := TemplateDreController.ConsultarPorId
      (CDSGrid.FieldByName('IDDRE').AsInteger);

  if TemplateDre <> nil then
  begin
    LabelEditCodigo.Text := IntToStr(TemplateDre.idTemplate);
    LabeledEditDescricao.Text := TemplateDre.descricao;
    EditClassificacao.Text := TemplateDre.Classificacao;
    LabeledEditOrdem.Text := TemplateDre.ordem;
    LabeledEditTotal.Text := TemplateDre.total;
//    comboboxTipo.ItemIndex := IntToStr(TemplateDre.flTipo);
  end;
end;

function TFTelaCadastroTemplateDre.MontaFiltro: string;
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