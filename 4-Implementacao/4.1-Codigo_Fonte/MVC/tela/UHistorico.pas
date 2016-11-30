unit UHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  UHistoricoVO, UHistoricoCOntroller,  Generics.Collections;

type
  TFTelaCadastroHistorico = class(TFTelaCadastro)
    LabeledEditDescricao: TLabeledEdit;
    Label1: TLabel;
    ComboBoxTipo: TComboBox;
    GroupBox2: TGroupBox;
    RadioButtonDescricao: TRadioButton;
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoExcluir: boolean; override;
    procedure DoConsultar; override;
    procedure CarregaObjetoSelecionado; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Historico: THistoricoVo): THistoricoVo;
  end;

var
  FTelaCadastroHistorico: TFTelaCadastroHistorico;
  ControllerHistorico : THistoricoController;

implementation

{$R *.dfm}

{ TFTelaCadastroHistorico }

procedure TFTelaCadastroHistorico.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabeledEditDescricao.SetFocus;
end;

procedure TFTelaCadastroHistorico.CarregaObjetoSelecionado;
begin
  if not CDSGrid.IsEmpty then
  begin
    ObjetoRetornoVO := THistoricoVo.Create;
    THistoricoVo(ObjetoRetornoVO).idHistorico := CDSGrid.FieldByName('IDHISTORICO').AsInteger;
    THistoricoVo(ObjetoRetornoVO).dsHistorico :=
      CDSGrid.FieldByName('DSHISTORICO').AsString;
    THistoricoVo(ObjetoRetornoVO).flContaCorrente :=
      CDSGrid.FieldByName('FLCONTACORRENTE').AsString;
  end;
end;

procedure TFTelaCadastroHistorico.DoConsultar;
var
  listaHistorico: TObjectList<THistoricoVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaHistorico := ControllerHistorico.Consultar(filtro);
  PopulaGrid<THistoricoVo>(listaHistorico);
end;

function TFTelaCadastroHistorico.DoExcluir: boolean;
var
  Historico: THistoricoVo;
begin
  try
    try
      Historico := THistoricoVo.Create;
      Historico.idhistorico := CDSGrid.FieldByName('IDHISTORICO').AsInteger;
      ControllerHistorico.Excluir(Historico);
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

function TFTelaCadastroHistorico.DoSalvar: boolean;
var
  Historico: THistoricoVo;
begin
    Historico:=EditsToObject(THistoricoVO.Create);
    try
      try
        Historico.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
        begin
          ControllerHistorico.Inserir(Historico);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          Historico := ControllerHistorico.ConsultarPorId(CDSGrid.FieldByName('IDHISTORICO')
            .AsInteger);
          Historico := EditsToObject(Historico);
          ControllerHistorico.Alterar(Historico);
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

function TFTelaCadastroHistorico.EditsToObject(
  Historico: THistoricoVo): THistoricoVo;
begin
  Historico.dsHistorico := LabeledEditDescricao.Text;
  Historico.flContaCorrente := IntToStr(comboboxTipo.ItemIndex+1);
  Result := Historico;
end;

procedure TFTelaCadastroHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerHistorico);
end;

procedure TFTelaCadastroHistorico.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := THistoricoVo;
  RadioButtonDescricao.Checked := true;
  ControllerHistorico := THistoricoController.Create;
  inherited;
end;

procedure TFTelaCadastroHistorico.GridParaEdits;
var
  Historico: THistoricoVo;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    Historico := ControllerHistorico.ConsultarPorId(CDSGrid.FieldByName('IDHISTORICO')
      .AsInteger);

  if Assigned(Historico) then
  begin
    LabeledEditDescricao.text := Historico.DsHistorico;
    ComboboxTipo.ItemIndex:= strtoint(HISTORICO.FlContaCorrente)-1;

  end;

end;

function TFTelaCadastroHistorico.MontaFiltro: string;
begin
  Result := '';
  if (RadioButtonDescricao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(DSHISTORICO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;

end.
