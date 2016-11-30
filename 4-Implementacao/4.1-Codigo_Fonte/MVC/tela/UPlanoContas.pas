unit UPlanoContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UPlanoContasVO,UPlanoContasController,
  Generics.Collections,UEmpresaTrab;

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
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnAlteraClick(Sender: TObject);
    procedure BitBtnExcluiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    idempresaaux:integer;
    procedure GridParaEdits; override;
    function EditsToObject(PlanoContas: TPlanoContasVO): TPlanoContasVO;
  end;

var
  FTelaCadastroPlano: TFTelaCadastroPlano;
  controllerPlanoConta : TPlanoContasController;
implementation

{$R *.dfm}

procedure TFTelaCadastroPlano.BitBtnAlteraClick(Sender: TObject);
begin
  if(CDSGrid.FieldByName('FLTIPO').AsString='U')then
    showmessage('Contas do tipo Unidade n�o podem ser alteradas')
  else
    inherited;
end;

procedure TFTelaCadastroPlano.BitBtnExcluiClick(Sender: TObject);
begin
  if(CDSGrid.FieldByName('FLTIPO').AsString='U')then
    showmessage('Contas do tipo Unidade n�o podem ser exclu�das pelo plano de contas')
  else
    inherited;
end;

procedure TFTelaCadastroPlano.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditDescricao.setFocus;
//  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroPlano.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := controllerPlanoConta.ConsultarPorId(CDSGRID.FieldByName('IDPLANOCONTAS').AsInteger);
  end;
end;

procedure TFTelaCadastroPlano.DoConsultar;
var
  listaPlanoContas: TObjectList<TPlanoContasVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaPlanoContas := controllerPlanoConta.Consultar(filtro, 'ORDER BY NRCLASSIFICACAO');
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
      controllerPlanoConta.Excluir(PlanoContas);
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
              controllerPlanoConta.Inserir(PlanoContas);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            PlanoContas := controllerPlanoConta.ConsultarPorId(CDSGrid.FieldByName('IDPLANOCONTAS')
              .AsInteger);
            PlanoContas := EditsToObject(PlanoContas);
            controllerPlanoConta.Alterar(PlanoContas);
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
var  classAux:String;
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
    classAux:=EditClassificacao.Text;
    PlanoContas.nrClassificacao := Copy(classAux,0,classaux.IndexOf(' ')-1);
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
    if ComboboxTipo.ItemIndex = 6 then
      PlanoContas.flTipo :='U';
    if ComboboxTipo.ItemIndex = 7 then
      PlanoContas.flTipo :='F';
    if ComboboxTipo.ItemIndex = 8 then
      PlanoContas.flTipo := 'L'
  end;

  Result := PlanoContas;
end;

procedure TFTelaCadastroPlano.FormCreate(Sender: TObject);
begin
  idempresaaux:=0;
  ClasseObjetoGridVO := TPlanoContasVO;
  controllerPlanoConta:=TPlanoContasController.Create;
  RadioButtonClassificacao.Checked := true;
  inherited;

end;

procedure TFTelaCadastroPlano.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(controllerPlanoConta);
end;

procedure TFTelaCadastroPlano.GridParaEdits;
var
  PlanoContas: TPlanoContasVO;
begin
  inherited;
  PlanoContas := nil;

  if not CDSGrid.IsEmpty then
    PlanoContas := controllerPlanoConta.ConsultarPorId
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
        ComboboxTipo.ItemIndex := 5
      else if PlanoContas.flTipo = 'U' then
        ComboboxTipo.ItemIndex := 6
      else if PlanoContas.flTipo = 'F' then
        ComboboxTipo.ItemIndex := 7
      else if PlanoContas.flTipo = 'L' then
        ComboboxTipo.ItemIndex := 8

     // ComboBoxTipo.ItemIndex:= Integer(Comboboxtipo.items.indexof(planocontas.flTipo));
    end;
  end;
end;

function TFTelaCadastroPlano.MontaFiltro: string;
var idempresafiltro:integer;
begin
  idempresafiltro:=FormEmpresaTrab.CodigoEmpLogada;
  if(idempresaaux>0)  then
    idempresafiltro:=idempresaaux;

  Result :='( IDCONDOMINIO = '+inttostr(idempresafiltro)+ ')';
  if (RadioButtonCodigo.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := Result + ' AND ( UPPER(IDPLANOCONTAS) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonClassificacao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := Result + 'AND ( UPPER(NRCLASSIFICACAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
  if (editBusca.Text <> '') then
      Result := Result + ' AND ( UPPER(DSCONTA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;

end;

end.
