unit UNaturezaJuridica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  UNaturezaJuridicaVO, UController, Generics.Collections,
  UNaturezaJuridicaController;

type
  TFTelaCadastroNaturezaJuridica = class(TFTelaCadastro)
    LabelEditDescricao: TLabeledEdit;
    LabelEditNatureza: TLabeledEdit;
    GroupBox2: TGroupBox;
    RadioButtonDescricao: TRadioButton;
    RadioButtonNaturezaJuridica: TRadioButton;
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoExcluir: boolean; override;
    procedure DoConsultar; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure CarregaObjetoSelecionado; override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(NaturezaJuridica: TNaturezaJuridicaVo)
      : TNaturezaJuridicaVo;

  end;

var
  FTelaCadastroNaturezaJuridica: TFTelaCadastroNaturezaJuridica;
  ControllerNaturezaJuridica: TNaturezaJuridicaController;

implementation

{$R *.dfm}
{ TFTelaCadastroNaturezaJuridica }

procedure TFTelaCadastroNaturezaJuridica.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditNatureza.SetFocus;
end;

procedure TFTelaCadastroNaturezaJuridica.CarregaObjetoSelecionado;
begin
  if not CDSGrid.IsEmpty then
  begin
    ObjetoRetornoVO := TNaturezaJuridicaVo.Create;
    TNaturezaJuridicaVo(ObjetoRetornoVO).idNatureza :=
      CDSGrid.FieldByName('IDNATUREZA').AsInteger;
    TNaturezaJuridicaVo(ObjetoRetornoVO).descricao :=
      CDSGrid.FieldByName('DESCRICAO').AsString;
    TNaturezaJuridicaVo(ObjetoRetornoVO).codigoNatureza :=
      CDSGrid.FieldByName('CODIGONATUREZA').AsString;
  end;
end;

procedure TFTelaCadastroNaturezaJuridica.DoConsultar;
var
  listaNaturezaJuridica: TObjectList<TNaturezaJuridicaVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaNaturezaJuridica := ControllerNaturezaJuridica.Consultar(filtro);
  PopulaGrid<TNaturezaJuridicaVo>(listaNaturezaJuridica);
end;

function TFTelaCadastroNaturezaJuridica.DoExcluir: boolean;
var
  NaturezaJuridica: TNaturezaJuridicaVo;
begin
  try
    try
      NaturezaJuridica := TNaturezaJuridicaVo.Create;
      NaturezaJuridica.idNatureza := CDSGrid.FieldByName('IDNATUREZA')
        .AsInteger;
      ControllerNaturezaJuridica.Excluir(NaturezaJuridica);
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

function TFTelaCadastroNaturezaJuridica.DoSalvar: boolean;
var
  NaturezaJuridica: TNaturezaJuridicaVo;
begin
    NaturezaJuridica:=EditsToObject(TNaturezaJuridicaVo.Create);
    try
      try
        if (NaturezaJuridica.ValidarCamposObrigatorios()) then
        begin
          if (StatusTela = stInserindo) then
          begin
            ControllerNaturezaJuridica.Inserir(NaturezaJuridica);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            NaturezaJuridica := ControllerNaturezaJuridica.ConsultarPorId(CDSGrid.FieldByName('IDNATUREZA')
              .AsInteger);
            NaturezaJuridica := EditsToObject(NaturezaJuridica);
            ControllerNaturezaJuridica.Alterar(NaturezaJuridica);
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

function TFTelaCadastroNaturezaJuridica.EditsToObject(NaturezaJuridica  : TNaturezaJuridicaVo): TNaturezaJuridicaVo;
begin
  NaturezaJuridica.codigoNatureza := LabelEditNatureza.Text;
  NaturezaJuridica.descricao := LabelEditDescricao.Text;
  Result := NaturezaJuridica;
end;

procedure TFTelaCadastroNaturezaJuridica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerNaturezaJuridica);
end;

procedure TFTelaCadastroNaturezaJuridica.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TNaturezaJuridicaVo;
  RadioButtonNaturezaJuridica.Checked := true;
  ControllerNaturezaJuridica := TNaturezaJuridicaController.Create;
  inherited;
end;

procedure TFTelaCadastroNaturezaJuridica.GridParaEdits;
var
  NaturezaJuridica: TNaturezaJuridicaVo;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    NaturezaJuridica := ControllerNaturezaJuridica.ConsultarPorId
      (CDSGrid.FieldByName('IDNATUREZA').AsInteger);

  if Assigned(NaturezaJuridica) then
  begin
    LabelEditNatureza.Text := NaturezaJuridica.codigoNatureza;
    LabelEditDescricao.Text := NaturezaJuridica.codigoNatureza;
  end;
end;

function TFTelaCadastroNaturezaJuridica.MontaFiltro: string;
begin
  Result := '';
  if (RadioButtonNaturezaJuridica.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(CODIGONATUREZA) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end
  else if (RadioButtonDescricao.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(DESCRICAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;

end.
