unit ULote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections, ULoteVO, ULoteController, UEmpresaTrab, ULancamentoContabilVO,
  UlancamentoCOntabilController, UPlanoContas, UHistorico, UPlanoContasVO, UHistoricoVO;

type
  TFTelaCadastroLote = class(TFTelaCadastro)
    BtnAlterarL: TBitBtn;
    BtnGravarL: TBitBtn;
    BtnExcluirL: TBitBtn;
    BtnCancelarC: TBitBtn;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    MaskEditDtInicio: TMaskEdit;
    EdtValor: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    BtnNovo: TBitBtn;
    MaskEdit2: TMaskEdit;
    Label1: TLabel;
    LabeledEditConta: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    LabeledEditContraP: TEdit;
    Label6: TLabel;
    LabeledEditHistorico: TEdit;
    Label7: TLabel;
    Edit5: TEdit;
    LabeledEditDsConta: TEdit;
    BtnConta: TBitBtn;
    BtnContra: TBitBtn;
    LabeledEditDsContra: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    BitBtn3: TBitBtn;
    LabeledEditDsHist: TEdit;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoSalvarLcto : boolean;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    function DoExcluirLcto : boolean;
  //  procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  //  procedure BitBtnGravaClick(Sender: TObject);
    procedure SetStatusTela(const Value: TStatusTela);
 //   procedure BitBtnAlteraClick(Sender: TObject);
 //   procedure BitBtnExcluiClick(Sender: TObject);
    procedure BitBtnIncluirCClick(Sender: TObject);
    procedure BtnCancelarCClick(Sender: TObject);
    procedure BtnContaClick(Sender: TObject);
    procedure BtnContraClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnAlterarLClick(Sender: TObject);
    procedure BtnGravarLClick(Sender: TObject);
    procedure BtnExcluirLClick(Sender: TObject);
    procedure BitBtnGravaClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure BitBtnAlteraClick(Sender: TObject);
    procedure BitBtnExcluiClick(Sender: TObject);
    procedure BitBtnCancelaClick(Sender: TObject);
//    procedure BitBtnCancelaClick(Sender: TObject);


  private
    { Private declarations }
    FStatusTela: TStatusTela;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Lote: TLoteVO): TLoteVO;
    function EditsToObjectLcto (Lcto : TLancamentoContabilVO) : TLancamentoContabilVO;
    property StatusTela: TStatusTela read FStatusTela write SetStatusTela;
 //   function ConsultaLote (Lote:TLoteVO) : TLoteVO;

  end;

var
  FTelaCadastroLote: TFTelaCadastroLote;
  ControllerLote: TLoteController;
  ControllerLcto : TLancamentoContabilController;

implementation

{$R *.dfm}

procedure TFTelaCadastroLote.BitBtn3Click(Sender: TObject);
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









procedure TFTelaCadastroLote.BitBtnAlteraClick(Sender: TObject);
begin
  if CDSGrid.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    StatusTela := stEditando;
  end;

end;

procedure TFTelaCadastroLote.BitBtnCancelaClick(Sender: TObject);
begin
  if (StatusTela = TStatusTela.stInserindo) then
    PageControl.ActivePage := Consulta;

  SetStatusTela(TStatusTela.stNavegandoGrid);
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BitBtnExcluiClick(Sender: TObject);
begin
 if CDSGrid.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox
      ('Deseja realmente excluir o registro selecionado?', 'Confirma��o',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if (DoExcluirLcto) then
      begin
        PageControl.ActivePage := Consulta;
        DoConsultar;
        SetStatusTela(TStatusTela.stNavegandoGrid);
      end;
    end;
  end;
end;

procedure TFTelaCadastroLote.BitBtnGravaClick(Sender: TObject);
begin
  if (DoSalvarLcto) then
  begin
    PageControl.ActivePage := Consulta;
    DoConsultar;
    SetStatusTela(TStatusTela.stNavegandoGrid);
  end;

end;

procedure TFTelaCadastroLote.BitBtnIncluirCClick(Sender: TObject);
begin
  LimparCampos;
  StatusTela := stInserindo;
  MaskEditDtInicio.SetFocus;
end;



procedure TFTelaCadastroLote.BitBtnNovoClick(Sender: TObject);
begin
  LimparCampos;
  StatusTela := stInserindo;
  PageControl.ActivePage := DadosCadastrais;
  BitBtnGrava.Enabled := True;
  MaskEdit2.SetFocus;
end;

procedure TFTelaCadastroLote.BtnAlterarLClick(Sender: TObject);
begin
 if CDSGrid.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    StatusTela := stEditando;
    GridParaEdits;
   end;
end;

procedure TFTelaCadastroLote.BtnCancelarCClick(Sender: TObject);
begin
  if (StatusTela = TStatusTela.stInserindo) then
    PageControl.ActivePage := Consulta;

  SetStatusTela(TStatusTela.stNavegandoGrid);
  DadosCadastrais.TabVisible := true;

end;

procedure TFTelaCadastroLote.BtnContaClick(Sender: TObject);
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

procedure TFTelaCadastroLote.BtnContraClick(Sender: TObject);
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

procedure TFTelaCadastroLote.BtnExcluirLClick(Sender: TObject);
begin
  inherited;
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BtnGravarLClick(Sender: TObject);
begin
  inherited;
  SetStatusTela(TStatusTela.stNavegandoGrid);
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.DoConsultar;
var
  listaLote: TObjectList<TLoteVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaLote := ControllerLote.Consultar(filtro);
  PopulaGrid<TLoteVO>(listaLote);
end;

function TFTelaCadastroLote.DoExcluir: boolean;
var
  Lote: TLoteVO;
begin
  try
    try
      Lote := TLoteVO.Create;
      Lote.idLote := CDSGrid.FieldByName('IDLOTE').AsInteger;
      ControllerLote.Excluir(Lote);
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

function TFTelaCadastroLote.DoExcluirLcto: boolean;
var
  Lcto: TLancamentoContabilVO;
begin
  try
    try
      Lcto := TLancamentoContabilVO.Create;
      Lcto.idLcto := CDSGrid.FieldByName('IDLCTO').AsInteger;
      ControllerLcto.Excluir(Lcto);
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

function TFTelaCadastroLote.DoSalvar: boolean;
var
   Lote: TLoteVO;
begin
  begin
    Lote:=EditsToObject(TLoteVO.Create);
    try
      try
       Lote.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
              Lote.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerLote.Inserir(Lote);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
              Lote := ControllerLote.ConsultarPorId(CDSGrid.FieldByName('IDLOTE')
              .AsInteger);
              Lote := EditsToObject(Lote);
              ControllerLote.Alterar(Lote);
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

function TFTelaCadastroLote.DoSalvarLcto: boolean;
var
    LctoContabil: TLancamentoContabilVO;

begin
  begin
    LctoContabil:=EditsToObjectLcto(TLancamentoContabilVO.Create);
    try
      try
       LctoContabil.ValidarCamposObrigatorios();
        begin
           if (StatusTela = stInserindo) then
           begin
         //     LctoContabil.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerLcto.Inserir(LctoContabil);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
              LctoContabil := ControllerLcto.ConsultarPorId(CDSGrid.FieldByName('IDLCTO')
              .AsInteger);
              LctoContabil := EditsToObjectLcto(LctoContabil);
              ControllerLcto.Alterar(LctoContabil);
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

function TFTelaCadastroLote.EditsToObject(Lote: TLoteVO): TLoteVO;
begin
  if Edit1.Text <> '' then
  begin
    Lote.dsLote := Edit1.Text;
  end;
  if EdtValor.Text <> '' then
  begin
    Lote.nrLote := EdtValor.Text;
  end;
  if(MaskEditDtInicio.Text<> '  /  /    ' )then
  begin
    Lote.dtLote := StrToDateTime(MaskEditDtInicio.Text);
  end;
  Result := Lote;
end;

function TFTelaCadastroLote.EditsToObjectLcto(
  Lcto: TLancamentoContabilVO): TLancamentoContabilVO;
begin
   if not CDSGrid.IsEmpty then
   begin
    lcto.idLote := CDSGrid.FieldByName('IDLOTE').AsInteger;
   end;
   if (maskEdit2.Text <> '  /  /    ' ) then
   begin
     lcto.dtLcto := StrToDateTime(maskEdit2.Text);
   end;
   if LabeledEditConta.Text <> ''  then
   begin
      lcto.idcontadebito := StrToInt(LabeledEditConta.Text);
   end;
   if LabeledEditContraP.Text <> '' then
   begin
     lcto.idContaCredito := StrToInt (LabeledEditContraP.Text);
   end;
   if LabeledEditHistorico.Text <> ''  then
   begin
      lcto.idHistorico := strtoint(LabeledEditHistorico.Text);
   end;
   if (Edit5.Text <> '') then
   begin
      lcto.valor := StrToFloat(Edit5.Text);
   end;
   if Edit8.Text <> '' then
   begin
      lcto.complemento := Edit8.Text;
   end;
end;

procedure TFTelaCadastroLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
  FreeAndNil(ControllerLote);
end;

procedure TFTelaCadastroLote.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TLoteVO;
  ControllerLote := TLoteController.Create;
  RadioButton1.Checked := true;
  inherited;

end;

procedure TFTelaCadastroLote.GridParaEdits;
var
  Lote: TLoteVO;
begin
  inherited;
  Lote := nil;

  if not CDSGrid.IsEmpty then
    Lote := ControllerLote.ConsultarPorId
      (CDSGrid.FieldByName('IDLOTE').AsInteger);

  if Lote <> nil then
  begin
    MaskEditDtInicio.Text := DateTimeToStr(Lote.dtLote);
    EdtValor.Text := Lote.nrLote;
    Edit1.Text := Lote.dsLote;
  end;
end;

function TFTelaCadastroLote.MontaFiltro: string;
begin

 Result := ' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  if (RadioButton2.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(NRLOTE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButton1.Checked = true) then
  begin
      if (editBusca.Text <> '') then
      begin
        Result := '( UPPER(DSLOTE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
      end;
  end;

end;

procedure TFTelaCadastroLote.SetStatusTela(const Value: TStatusTela);
begin
  FStatusTela := Value;
  BtnNovo.Enabled := True;
  BtnAlterarL.Enabled := True;
  BtnGravarL.Enabled := True;
  BtnExcluirL.Enabled := True;
  BtnCancelarC.Enabled := false;

  PanelEdits.Enabled := True;
  case Value of
    stNavegandoGrid:
      begin
        PanelEdits.Enabled := false;
        BtnNovo.Enabled := True;
        BtnAlterarL.Enabled := True;
        BtnGravarL.Enabled := false;
        BtnExcluirL.Enabled := True;
        BtnCancelarC.Enabled := false;
      end;
    stInserindo, stEditando:
      begin
        DadosCadastrais.TabVisible := false;
        PanelEdits.Enabled := True;
        BtnNovo.Enabled := false;
        BtnAlterarL.Enabled := false;
        BtnGravarL.Enabled := True;
        BtnExcluirL.Enabled := false;
        BtnCancelarC.Enabled := True;
      end;
  end;

end;

end.