unit ULancamentoPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,Generics.Collections,
  ULancamentoPadraoVO,ULancamentoPadraoController, UPlanoContas, UPlanoContasVO, UPlanoContasController, UHistorico, UHistoricoVO;

type
  TFTelaCadastroLancamentoPadrao = class(TFTelaCadastro)
    Label10: TLabel;
    editidlcto: TEdit;
    Label1: TLabel;
    LabeledEditConta: TEdit;
    BtnConta: TBitBtn;
    LabeledEditDsConta: TEdit;
    Label5: TLabel;
    LabeledEditContraP: TEdit;
    BtnContra: TBitBtn;
    LabeledEditDsContra: TEdit;
    Label6: TLabel;
    LabeledEditHistorico: TEdit;
    BitBtn3: TBitBtn;
    LabeledEditDsHist: TEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    function DoSalvar : boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function MontaFiltro : string;
    procedure BtnContaClick(Sender: TObject);
    procedure BtnContraClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure LabeledEditContaExit(Sender: TObject);
    procedure LabeledEditContraPExit(Sender: TObject);
    procedure CarregaObjetoSelecionado; override;


  private
    { Private declarations }
  public
    { Public declarations }
    idCondominio : Integer;
    procedure GridParaEdits; override;
    function EditsToObject(LctoPadrao : TLancamentoPadraoVO): TLancamentoPadraoVO;

var
  FTelaCadastroLancamentoPadrao: TFTelaCadastroLancamentoPadrao;
  ControllerLctoPadrao: TLancamentoPadraoController;
end;

implementation

{$R *.dfm}

{ TFTelaCadastroLancamentoPadrao }



procedure TFTelaCadastroLancamentoPadrao.BitBtn3Click(Sender: TObject);
var
  FormHistorico: TFTelaCadastroHistorico;
begin
  FormHistorico := TFTelaCadastroHistorico.Create(nil);
  FormHistorico.FechaForm := true;
  FormHistorico.ShowModal;
  if (FormHistorico.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditHistorico.Text := IntToStr(THistoricoVO(FormHistorico.ObjetoRetornoVO).idHistorico);
    LabeledEditDsHist.Text := THistoricoVO(FormHistorico.ObjetoRetornoVO).dsHistorico;
  end;
  FormHistorico.Release;
end;
procedure TFTelaCadastroLancamentoPadrao.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  EditIdLcto.SetFocus;
end;

procedure TFTelaCadastroLancamentoPadrao.BtnContaClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditConta.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    LabeledEditDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
  end;
  FormPlanoConsulta.Release;
end;
procedure TFTelaCadastroLancamentoPadrao.BtnContraClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditContraP.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    LabeledEditDsContra.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroLancamentoPadrao.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := controllerLctoPadrao.ConsultarPorId(CDSGRID.FieldByName('IDLCTOPADRAO').AsInteger);
  end;
end;

procedure TFTelaCadastroLancamentoPadrao.DoConsultar;
var
  listaLctoPadrao: TObjectList<TLancamentoPadraoVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaLctoPadrao := ControllerLctoPadrao.Consultar(filtro, 'ORDER BY OBSERVACAO');
  PopulaGrid<TLancamentoPadraoVO>(listaLctoPadrao);
end;

function TFTelaCadastroLancamentoPadrao.DoExcluir: boolean;
var
  LctoPadrao: TLancamentoPadraoVO;
begin
  try
    try
      LctoPadrao := TLancamentoPadraoVO.Create;
      LctoPadrao.idlctoPadrao := CDSGrid.FieldByName('IDLCTOPADRAO').AsInteger;
      ControllerLctoPadrao.Excluir(LctoPadrao);
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

function TFTelaCadastroLancamentoPadrao.DoSalvar: boolean;
var
  LctoPadrao: TLancamentoPadraoVO;
begin
    LctoPadrao:=EditsToObject(TLancamentoPadraoVO.Create);
    try
      try
        LctoPadrao.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
        begin
          LctoPadrao.idCondominio := idCondominio;
          ControllerLctoPadrao.Inserir(LctoPadrao);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          LctoPadrao := ControllerLctoPadrao.ConsultarPorId(CDSGrid.FieldByName('IDLCTOPADRAO')
            .AsInteger);
          LctoPadrao := EditsToObject(LctoPadrao);
          ControllerLctoPadrao.Alterar(LctoPadrao);
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

function TFTelaCadastroLancamentoPadrao.EditsToObject(LctoPadrao: TLancamentoPadraoVO): TLancamentoPadraoVO;
begin

  if (EditIdLcto.Text <> '') then
    LctoPadrao.observacao := EditIdLcto.Text;
  if LabeledEditConta.Text <> '' then
    LctoPadrao.idcontadebito :=  StrToInt(LabeledEditConta.Text);
  if LabeledEditContraP.Text <> '' then
    LctoPadrao.idContaCredito := StrToInt(LabeledEditContraP.Text);
  if LabeledEditHistorico.Text <> '' then
    LctoPadrao.idHistorico := StrToInt(LabeledEditHistorico.Text);
  Result := LctoPadrao;
end;




procedure TFTelaCadastroLancamentoPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerLctoPadrao);
end;

procedure TFTelaCadastroLancamentoPadrao.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TLancamentoPadraoVO;
  RadioButton1.Checked := true;
  ControllerLctoPadrao := TLancamentoPadraoController.Create;
  inherited;

end;

procedure TFTelaCadastroLancamentoPadrao.GridParaEdits;
var
  LctoPadrao: TLancamentoPadraoVO;
begin
  inherited;

  LctoPadrao := nil;
  if not CDSGrid.IsEmpty then
    LctoPadrao := ControllerLctoPadrao.ConsultarPorId(CDSGrid.FieldByName('IDLCTOPADRAO')
      .AsInteger);

  if LctoPadrao <> nil then
  begin
    if LctoPadrao.ContaDebitoVo <> nil then
    begin
      LabeledEditConta.Text := IntToStr(LctoPadrao.ContaDebitoVo.idPlanoContas);
      LabeledEditDsConta.Text := LctoPadrao.ContaDebitoVo.dsConta;
    end;
    if LctoPadrao.ContaCreditoVO <> nil then
    begin
      LabeledEditContraP.Text := IntToStr(LctoPadrao.ContaCreditoVO.idPlanoContas);
      LabeledEditDsContra.Text := LctoPadrao.ContaCreditoVO.dsConta;
    end;
    if LctoPadrao.HistoricoVO <> nil then
    begin
      LabeledEditHistorico.Text := IntToStr(LctoPadrao.HistoricoVO.idHistorico);
      LabeledEditDsHist.Text := LctoPadrao.HistoricoVO.DsHistorico;
    end;
    EditIdLcto.Text := LctoPadrao.observacao;
  end;

end;

procedure TFTelaCadastroLancamentoPadrao.LabeledEditContaExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if LabeledEditConta.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(LabeledEditConta.Text));
    LabeledEditDsConta.Text := PlanoContasVO.dsConta;
    PlanoController.Free;
  except
    raise Exception.Create('C�digo Inv�lido');
  end;
  end;
end;

procedure TFTelaCadastroLancamentoPadrao.LabeledEditContraPExit(
  Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if LabeledEditContraP.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(LabeledEditContraP.Text));
    LabeledEditDsContra.Text := PlanoContasVO.dsConta;
    PlanoController.Free;
  except
    raise Exception.Create('C�digo Inv�lido');
  end;
  end
  else
  begin
    LabeledEditDsContra.Text := '';
  end;
end;

function TFTelaCadastroLancamentoPadrao.MontaFiltro: string;
begin
  Result := ' (LANCAMENTOPADRAO.IDCONDOMINIO = '+inttostr(IDCONDOMINIO)+')';

  if (RadioButton1.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := result +  ' and ( UPPER(LANCAMENTOPADRAO.OBSERVACAO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ') ';
    end;
  end;
end;

end.
