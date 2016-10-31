unit UtelaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UTela, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Rtti;

type
  TStatusTela = (stNavegandoGrid, stInserindo, stEditando);

  TFTelaCadastro = class(TFTela)
    DadosCadastrais: TTabSheet;
    PanelBotoes: TPanel;
    BitBtnNovo: TBitBtn;
    BitBtnAltera: TBitBtn;
    BitBtnGrava: TBitBtn;
    BitBtnExclui: TBitBtn;
    BitBtnCancela: TBitBtn;
    PageControlEdit: TPageControl;
    DadosPrincipais: TTabSheet;
    PanelEdits: TPanel;
    BitBtnIncluirC: TBitBtn;
    procedure PageControlChange(Sender: TObject);
    procedure SetStatusTela(const Value: TStatusTela); virtual;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnAlteraClick(Sender: TObject);
    procedure BitBtnCancelaClick(Sender: TObject);
    procedure BitBtnExcluiClick(Sender: TObject);
    procedure BitBtnGravaClick(Sender: TObject);
  private
    FStatusTela: TStatusTela;
  public
    { Public declarations }
    function DoInserir: Boolean; virtual;
    function DoEditar: Boolean; virtual;
    function DoExcluir: Boolean; virtual;
    function DoCancelar: Boolean; virtual;
    function DoSalvar: Boolean; virtual;

    property StatusTela: TStatusTela read FStatusTela write SetStatusTela;
  end;

var
  FTelaCadastro: TFTelaCadastro;

implementation

{$R *.dfm}
{ TFTelaCadastro }

procedure TFTelaCadastro.BitBtnAlteraClick(Sender: TObject);
begin
  DoEditar;
end;

procedure TFTelaCadastro.BitBtnCancelaClick(Sender: TObject);
begin
  DoCancelar;
end;

procedure TFTelaCadastro.BitBtnExcluiClick(Sender: TObject);
begin
  if CDSGrid.IsEmpty then
    Application.MessageBox('Não existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox
      ('Deseja realmente excluir o registro selecionado?', 'Confirmação',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if (DoExcluir) then
      begin
        PageControl.ActivePage := Consulta;
        DoConsultar;
        SetStatusTela(TStatusTela.stNavegandoGrid);
      end;
    end;
  end;
end;

procedure TFTelaCadastro.BitBtnGravaClick(Sender: TObject);
begin
  inherited;
  if (DoSalvar) then
  begin
    PageControl.ActivePage := Consulta;
    DoConsultar;
    SetStatusTela(TStatusTela.stNavegandoGrid);
  end;
end;

procedure TFTelaCadastro.BitBtnNovoClick(Sender: TObject);
begin
  DoInserir;
end;

function TFTelaCadastro.DoCancelar: Boolean;
begin
  if (StatusTela = TStatusTela.stInserindo) then
    PageControl.ActivePage := Consulta;

  SetStatusTela(TStatusTela.stNavegandoGrid);
  Result := True;
end;

function TFTelaCadastro.DoEditar: Boolean;
begin
  Result := false;
  if CDSGrid.IsEmpty then
    Application.MessageBox('Não existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    StatusTela := stEditando;
    Result := True;
  end;
end;

function TFTelaCadastro.DoExcluir: Boolean;
begin
  Result := True;
end;

function TFTelaCadastro.DoInserir: Boolean;
begin
  LimparCampos;
  StatusTela := stInserindo;
  PageControl.ActivePage := DadosCadastrais;
  Result := True;
end;

function TFTelaCadastro.DoSalvar: Boolean;
begin
  Result := True;
end;

procedure TFTelaCadastro.PageControlChange(Sender: TObject);
begin
  inherited;
  if (PageControl.ActivePage = DadosCadastrais) then
  begin
    if (not CDSGrid.IsEmpty) then
    begin
      LimparCampos;
      GridParaEdits;
    end;
  end;
  StatusTela := stNavegandoGrid;
end;

procedure TFTelaCadastro.SetStatusTela(const Value: TStatusTela);
begin

  FStatusTela := Value;
  BitBtnNovo.Enabled := True;
  BitBtnIncluirC.Enabled := True;
  BitBtnAltera.Enabled := True;
  BitBtnGrava.Enabled := True;
  BitBtnExclui.Enabled := True;
  BitBtnCancela.Enabled := false;

  PanelEdits.Enabled := True;
  case Value of
    stNavegandoGrid:
      begin
        PanelEdits.Enabled := false;
        BitBtnNovo.Enabled := True;
        BitBtnIncluirC.Enabled := True;
        BitBtnAltera.Enabled := True;
        BitBtnGrava.Enabled := false;
        BitBtnExclui.Enabled := True;
        BitBtnCancela.Enabled := false;
      end;
    stInserindo, stEditando:
      begin
        PanelEdits.Enabled := True;
        BitBtnNovo.Enabled := false;
        BitBtnIncluirC.Enabled := false;
        BitBtnAltera.Enabled := false;
        BitBtnGrava.Enabled := True;
        BitBtnExclui.Enabled := false;
        BitBtnCancela.Enabled := True;
      end;
  end;
end;

end.
