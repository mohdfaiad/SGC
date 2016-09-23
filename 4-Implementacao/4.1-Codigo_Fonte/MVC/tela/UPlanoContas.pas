unit UPlanoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UPlanoContasVO,UPlanoContasController,
  Generics.Collections, UEmpresaTrab;

type
  TFTelaCadastroPlano = class(TFTelaCadastro)
    LabelEditCodigo: TLabeledEdit;
    Telefone_1: TLabel;
    EditClassificacao: TMaskEdit;
    Label1: TLabel;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    RadioButtonClassificacao: TRadioButton;
    RadioButtonCodigo: TRadioButton;
    RadioButtonDescricao: TRadioButton;
    LabelEditDescricao: TMaskEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    function DoSalvar: boolean; override;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;

    function MontaFiltro: string;
    procedure CarregaObjetoSelecionado; override;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(PlanoContas: TPlanoContasVO): TPlanoContasVO;
  end;

var
  FTelaCadastroPlano: TFTelaCadastroPlano;
  PlanoContasController : TPlanoContasController;
implementation

{$R *.dfm}

procedure TFTelaCadastroPlano.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroPlano.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := PlanoContasController.ConsultarPorId(CDSGRID.FieldByName('IDPLANOCONTAS').AsInteger);
  end;
end;

procedure TFTelaCadastroPlano.DoConsultar;
var
  listaPlanoContas: TObjectList<TPlanoContasVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaPlanoContas := PlanoContasController.Consultar(filtro);
  PopulaGrid<TPlanoContasVo>(listaPlanoContas);
end;

function TFTelaCadastroPlano.DoExcluir: boolean;
var
  PlanoContas : TPlanoContasVo;
begin
  try
    try
      PlanoContas := TPlanoContasVo.Create;
      PlanoContas.idPlanoContas := CDSGrid.FieldByName('IDPLANOCONTAS')
        .AsInteger;
      PlanoContasController.Excluir(PlanoContas);
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

function TFTelaCadastroPlano.DoSalvar: boolean;
var
  PlanoContas : TPlanoContasVo;
begin
  begin
    PlanoContas:=EditsToObject(TPlanoContasVo.Create);
    try
      try
        PlanoContas.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
              PlanoContas.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              PlanoContasController.Inserir(PlanoContas);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            PlanoContas := PlanoContasController.ConsultarPorId(CDSGrid.FieldByName('IDPLANOCONTAS')
              .AsInteger);
            PlanoContas := EditsToObject(PlanoContas);
            PlanoContasController.Alterar(PlanoContas);
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

function TFTelaCadastroPlano.EditsToObject(
  PlanoContas: TPlanoContasVO): TPlanoContasVO;
begin
  if LabelEditCodigo.Text <> '' then
  begin
    PlanoContas.idConta := StrToInt(LabelEditCodigo.Text);
  end;
  if LabelEditDescricao.Text <> '' then
  begin
    PlanoContas.dsConta := LabelEditDescricao.Text;
  end;
  if EditClassificacao.Text <> '' then
  begin
    PlanoContas.nrClassificacao := EditClassificacao.Text;
  end;
  if ComboboxTipo.ItemIndex >= 0 then
  begin
    if ComboboxTipo.ItemIndex = 0 then
      PlanoContas.flTipo :='S';
    if ComboboxTipo.ItemIndex = 1 then
      PlanoContas.flTipo :='B';
    if ComboboxTipo.ItemIndex = 2 then
      PlanoContas.flTipo :='C';
    if ComboboxTipo.ItemIndex = 3 then
      PlanoContas.flTipo :='R';
    if ComboboxTipo.ItemIndex = 4 then
      PlanoContas.flTipo :='D';
    if ComboboxTipo.ItemIndex = 5 then
      PlanoContas.flTipo :='O';
  end;

  Result := PlanoContas;
end;

procedure TFTelaCadastroPlano.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPlanoContasVO;
  inherited;

end;

procedure TFTelaCadastroPlano.GridParaEdits;
var
  PlanoContas: TPlanoContasVO;
begin
  inherited;
  PlanoContas := nil;

  if not CDSGrid.IsEmpty then
    PlanoContas := PlanoContasController.ConsultarPorId
      (CDSGrid.FieldByName('IDPLANOCONTAS').AsInteger);

  if PlanoContas <> nil then
  begin
    LabelEditCodigo.Text := IntToStr(PlanoContas.idConta);
    LabelEditDescricao.Text := PlanoContas.dsConta;
    EditClassificacao.Text := PlanoContas.nrClassificacao;
    if PlanoContas.flTipo <> '' then
    begin
      if PlanoContas.flTipo = 'S' then
        comboboxTipo.ItemIndex := 0
      else if PlanoCONTAS.flTipo = 'B' then
        ComboboxTipo.ItemIndex := 1
      else if PlanoContas.flTipo = 'C' then
        ComboboxTipo.ItemIndex := 2
      else if PlanoContas.flTipo = 'R' then
        ComboboxTipo.ItemIndex := 3
      else if PlanoContas.flTipo = 'D' then
        ComboboxTipo.ItemIndex := 4
      else if PlanoContas.flTipo = 'O' then
        ComboboxTipo.ItemIndex := 5;
     // ComboBoxTipo.ItemIndex:= Integer(Comboboxtipo.items.indexof(planocontas.flTipo));
    end;
  end;
end;

function TFTelaCadastroPlano.MontaFiltro: string;
begin
  Result :=' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButtonCodigo.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(IDCONTA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonClassificacao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(NRCLASSIFICACAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
  if (editBusca.Text <> '') then
      Result := '( UPPER(DSCONTA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;

end;

end.
