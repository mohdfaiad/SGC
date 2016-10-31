unit ULote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Generics.Collections, ULoteVO, ULoteController, UEmpresaTrab, ULancamentoContabilVO,
  UlancamentoCOntabilController, UPlanoContas,UPlanoContasController, UHistorico, UHistoricoController,
  UPlanoContasVO, UHistoricoVO, Data.DB, Datasnap.DBClient,
  ULancamentoPadrao, ULancamentoPadraoVO, ULancamentoPadraoController;

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
    Label9: TLabel;
    GridLcto: TDBGrid;
    CDSLcto: TClientDataSet;
    DSLcto: TDataSource;
    CDSLctoIDLCTO: TIntegerField;
    CDSLctoDTLCTO: TDateField;
    CDSLctoIDCONTADEBITO: TIntegerField;
    CDSLctoIDCONTACREDITO: TIntegerField;
    CDSLctoDSCONTADEBITO: TStringField;
    CDSLctoDSCONTACREDITO: TStringField;
    CDSLctoIDHISTORICO: TIntegerField;
    CDSLctoVALOR: TFloatField;
    CDSLctoDSCOMPLEMENTO: TStringField;
    CDSLctoDSHISTORICO: TStringField;
    PanelLcto: TPanel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
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
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    editidlcto: TEdit;
    editidlote: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoSalvarLcto : boolean;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    function DoExcluirLcto : boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure BitBtnCancelaClick(Sender: TObject);
    procedure LabeledEditContaExit(Sender: TObject);
    procedure LabeledEditContraPExit(Sender: TObject);
    procedure LabeledEditHistoricoExit(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CDSLctoAfterScroll(DataSet: TDataSet);
    procedure BitBtnExcluiClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);


  private
    { Private declarations }
    FStatusTela: TStatusTela;
  public
    { Public declarations }
    procedure GridParaEdits; override;
    procedure GridParaEditsLcto;
    function EditsToObject(Lote: TLoteVO): TLoteVO;
    function EditsToObjectLcto (Lcto : TLancamentoContabilVO) : TLancamentoContabilVO;
    procedure PopulaGridLcto;
    procedure VerificaBotoesLcto( StatusTela: TStatusTela);
    procedure VerificaBotoesLote(StatusTela: TStatusTela);
 //   function ConsultaLote (Lote:TLoteVO) : TLoteVO;


  end;

var
  FTelaCadastroLote: TFTelaCadastroLote;
  ControllerLote: TLoteController;
  ControllerLcto : TLancamentoContabilController;

implementation

{$R *.dfm}

procedure TFTelaCadastroLote.BitBtn1Click(Sender: TObject);
var
  FormLctoPadrao: TFTelaCadastroLancamentoPadrao;
begin
  FormLctoPadrao := TFTelaCadastroLancamentoPadrao.Create(nil);
  FormLctoPadrao.idCondominio:= strtoint(FormEmpresaTrab.LabeledEditCodigo.Text);
  FormLctoPadrao.FechaForm := true;
  FormLctoPadrao.ShowModal;
  if (FormLctoPadrao.ObjetoRetornoVO <> nil) then
  begin
    Edit2.Text := IntToStr(TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).idLctoPadrao);
    LabeledEditConta.Text := IntToStr(TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).COntaDebitoVO.idPlanoContas);
    LabeledEditDsConta.Text := TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).ContaDebitoVO.dsconta;
    LabeledEditContraP.Text := IntToStr(TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).ContaCreditoVO.idPlanoContas);
    LabeledEditDsContra.Text := TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).ContaCreditoVO.dsconta;
    LabeledEditHistorico.Text := IntToStr(TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).HistoricoVO.idHistorico);
    LabeledEditDsHist.text := TLancamentoPadraoVO(FormLctoPadrao.ObjetoRetornoVO).HistoricoVO.dsHistorico;
    Edit5.SetFocus;
  end;
  FormLctoPadrao.Release;
end;

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
  if CDSLcto.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    VerificaBotoesLcto(stEditando);
  end;

end;

procedure TFTelaCadastroLote.BitBtnCancelaClick(Sender: TObject);
begin
  VerificaBotoesLcto(TStatusTela.stNavegandoGrid);
  limparCampos;
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BitBtnExcluiClick(Sender: TObject);
begin
  if CDSLcto.IsEmpty then
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
        PopulaGridLcto;
        verificaBotoesLote(TStatusTela.stNavegandoGrid);
      end;
    end;
  end;
end;

procedure TFTelaCadastroLote.BitBtnGravaClick(Sender: TObject);
begin
  if (DoSalvarLcto) then
  begin
    populagridlcto;
    VerificaBotoesLcto(TStatusTela.stNavegandoGrid);
  end;


end;

procedure TFTelaCadastroLote.BitBtnIncluirCClick(Sender: TObject);
begin
  LimparCampos;
  VerificaBotoesLote(stInserindo);
  MaskEditDtInicio.SetFocus;

end;



procedure TFTelaCadastroLote.BitBtnNovoClick(Sender: TObject);
begin
  LimparCampos;
  VerificaBotoesLcto(stInserindo);
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
    VerificaBotoesLote(stEditando);
    GridParaEdits;
   end;
end;

procedure TFTelaCadastroLote.BtnCancelarCClick(Sender: TObject);
begin
  VerificaBotoesLote(stNavegandoGrid);
  DadosCadastrais.TabVisible := true;
  LimparCampos;

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
  if CDSGrid.IsEmpty then
    Application.MessageBox('N�o existe registro selecionado.', 'Erro',
      MB_OK + MB_ICONERROR)
  else
  begin
    if Application.MessageBox
      ('Deseja realmente excluir o registro selecionado?', 'Confirma��o',
      MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if (DoExcluir) then
      begin
        PageControl.ActivePage := Consulta;
        DoConsultar;
        verificaBotoesLote(TStatusTela.stNavegandoGrid);
      end;
    end;
  end;
  DadosCadastrais.TabVisible := true;
end;

procedure TFTelaCadastroLote.BtnGravarLClick(Sender: TObject);
begin
  if (DoSalvar) then
  begin
    PageControl.ActivePage := Consulta;
    DoConsultar;
    VerificaBotoesLote(TStatusTela.stNavegandoGrid);
    DadosCadastrais.TabVisible := true;
  end;
end;

procedure TFTelaCadastroLote.CDSLctoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  GridParaEditsLcto;
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
  query : string;
  listaLcto: TObjectList<TLancamentoContabilVO>;
begin
  try
    try
      Lote := TLoteVO.Create;
      Lote.idLote := CDSGrid.FieldByName('IDLOTE').AsInteger;
      Query:=' idlote = '+ CDSGRID.FieldByName('IDLOTE').AsString;
      listaLcto := ControllerLcto.Consultar(query);
      if ListaLcto.Count = 0  then
         ControllerLote.Excluir(Lote)
      else
      begin
        ShowMessage('Para excluir lote dever� excluir os lan�amentos do lote!');
        PageControl.ActivePage := Consulta;
      end;


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
      Lcto.idLcto := CDSLcto.FieldByName('IDLCTO').AsInteger;
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
           if editidlote.Text= '' then
           begin
              Lote.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerLote.Inserir(Lote);
              Result := true;
           end
            else
             begin
              Lote := ControllerLote.ConsultarPorId(strtoint(editidlote.Text));
              Lote := EditsToObject(Lote);
              ControllerLote.Alterar(Lote);
            Result := true;
          end
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
           if (editidlcto.text='') then
           begin
              ControllerLcto.Inserir(LctoContabil);
              Result := true;
           end
           else
             begin
              LctoContabil := ControllerLcto.ConsultarPorId(strtoint(editidlcto.Text));
              LctoContabil := EditsToObjectLcto(LctoContabil);
              ControllerLcto.Alterar(LctoContabil);
              Result := true;
            end
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

procedure TFTelaCadastroLote.Edit2Exit(Sender: TObject);
var
  LctoController :TLancamentoPadraoController;
  LctoVo: TLancamentoPadraoVO;
begin
  if Edit2.Text <> '' then
  begin
  try
    LctoController := TLancamentoPadraoController.Create;
    LctoVo := LctoController.ConsultarPorId(StrToInt(Edit2.Text));
    LabeledEditConta.Text := IntToStr(LctoVo.COntaDebitoVO.idPlanoContas);
    LabeledEditDsConta.Text := LctoVo.ContaDebitoVO.dsconta;
    LabeledEditContraP.Text := IntToStr(LctoVo.ContaCreditoVO.idPlanoContas);
    LabeledEditDsContra.Text := LctoVo.ContaCreditoVO.dsconta;
    LabeledEditHistorico.Text := IntToStr(LctoVo.HistoricoVO.idHistorico);
    LabeledEditDsHist.text := LctoVo.HistoricoVO.dsHistorico;
    Edit5.SetFocus;
    LctoController.Free;
  except
    raise Exception.Create('C�digo Inv�lido');
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

   if (editidlcto.Text<>'') then
   begin
     lcto.idLcto := strtoint(editidlcto.Text);
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
      lcto.Vlvalor := StrToFloat(Edit5.Text);
   end;
   if Edit8.Text <> '' then
   begin
      lcto.complemento := Edit8.Text;
   end;

   result:=lcto;
end;

procedure TFTelaCadastroLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
  FreeAndNil(ControllerLote);
  FreeAndNil(ControllerLcto);
end;

procedure TFTelaCadastroLote.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TLoteVO;
  ControllerLote := TLoteController.Create;
  ControllerLcto := TLancamentoContabilController.Create;
  RadioButton1.Checked := true;
  self.VerificaBotoesLote(TStatusTela.stNavegandoGrid);
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
    editidlote.Text:=inttostr(lote.idLote);
  end;
end;

procedure TFTelaCadastroLote.GridParaEditsLcto;
begin
  if not CDSLcto.IsEmpty then
  begin
      LimparCampos;
      if (CDSLctoIDCONTADEBITO.AsInteger>0) then
      begin
        LabeledEditConta.Text := CDSLctoIDCONTADEBITO.AsString;
        LabeledEditDsConta.Text := CDSLctoDSCONTADEBITO.AsString;
      end;
      if (CDSLctoIDCONTACREDITO.AsInteger>0) then
      begin
        LabeledEditContraP.Text := CDSLctoIDCONTACREDITO.AsString;
        LabeledEditDsContra.Text := CDSLctoDSCONTACREDITO.asstring;
      end;

      if (CDSLctoIDHISTORICO.AsInteger>0) then
      begin
        LabeledEditHistorico.Text := CDSLctoIDHISTORICO.AsString;
        LabeledEditDsHist.Text :=  CDSLctodsHistorico.asstring;
      end;



      Edit5.Text := FloatToStr(CDSLctoVALOR.AsFloat);
      Edit8.Text := CDSLctoDSCOMPLEMENTO.AsString;
      editidlcto.Text:=CDSLctoIDLCTO.AsString;

      if(not CDSLctoDTLCTO.IsNull)then
        MaskEdit2.Text := DateToStr(CDSLctoDTLCTO.AsDateTime);
    end;
end;


procedure TFTelaCadastroLote.LabeledEditContaExit(Sender: TObject);
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



procedure TFTelaCadastroLote.LabeledEditContraPExit(Sender: TObject);
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

procedure TFTelaCadastroLote.LabeledEditHistoricoExit(Sender: TObject);
var
  HistoricoController:THistoricoController;
  HistoricoVO: THistoricoVO;
begin
  if LabeledEditHistorico.Text <> '' then
  begin
  try
    HistoricoController := THistoricoController.Create;
    HistoricoVO := HistoricoController.ConsultarPorId(StrToInt(LabeledEditHistorico.Text));
    LabeledEditDsHist.Text := HistoricoVO.DsHistorico;
    HistoricoController.Free;
  Except
    raise Exception.Create('C�digo Inv�lido');
  end;
  end
  else
  begin
    LabeledEditDsHist.Text := '';
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

procedure TFTelaCadastroLote.PageControlChange(Sender: TObject);
var Lote : TLoteVo;
begin
   limparCampos;
   if not CDSGrid.IsEmpty then
   begin
    Lote := ControllerLote.ConsultarPorId
      (CDSGrid.FieldByName('IDLOTE').AsInteger);
       PopulaGridLcto;
    PanelEdits.Enabled:=true;
    self.VerificaBotoesLote(TStatusTela.stNavegandoGrid);
    self.VerificaBotoesLcto(TStatusTela.stNavegandoGrid);
    CDSLctoAfterScroll(nil);
   end;


end;

procedure TFTelaCadastroLote.PopulaGridLcto;
var
  Query:STring;
  listaLcto: TObjectList<TLancamentoContabilVO>;
  i:integer;
begin
   Query:=' idlote = '+ CDSGRID.FieldByName('IDLOTE').AsString;
   listaLcto := ControllerLcto.Consultar(query);
   CDSLcto.EmptyDataSet;
   for I := 0 to listaLcto.Count-1  do
   begin
      CDSLcto.Append;
      CDSLctoIDLCTO.AsInteger:= listaLcto[i].idLcto;
      CDSLctoDTLCTO.AsDateTime := listaLcto[i].dtLcto;
      CDSLctoIDCONTADEBITO.AsInteger := listaLcto[i].idcontadebito;
      CDSLctoDSCONTADEBITO.AsString := listaLcto[i].DsContaDebito;
      CDSLctoIDCONTACREDITO.AsInteger := listaLcto[i].idContaCredito;
      CDSLctoDSCONTACREDITO.AsString := listaLcto[i].DsContaCredito;
      CDSLctoIDHISTORICO.AsInteger:= listaLcto[i].idHistorico;
      CDSLctoDSHISTORICO.AsString := listaLcto[i].DsHistorico;
      CDSLctoDSCOMPLEMENTO.AsString:= listaLcto[i].complemento;
      CDSLctoVALOR.AsCurrency:= listaLcto[i].VlValor;
      CDSLcto.Post;
   end;
end;


procedure TFTelaCadastroLote.VerificaBotoesLote(StatusTela: TStatusTela);
begin
  BitBtnIncluirC.Enabled := True;
  BtnAlterarL.Enabled := True;
  BtnGravarL.Enabled := True;
  BtnExcluirL.Enabled := True;
  BtnCancelarC.Enabled := false;

  case StatusTela of
    stNavegandoGrid:
      begin
        BitBtnIncluirC.Enabled := True;
        BtnAlterarL.Enabled := True;
        BtnGravarL.Enabled := false;
        BtnExcluirL.Enabled := True;
        BtnCancelarC.Enabled := false;
      end;
    stInserindo, stEditando:
      begin
        BitBtnIncluirC.Enabled := false;
        BtnAlterarL.Enabled := false;
        BtnGravarL.Enabled := True;
        BtnExcluirL.Enabled := false;
        BtnCancelarC.Enabled := True;
      end;
  end;
end;

procedure TFTelaCadastroLote.VerificaBotoesLcto(StatusTela: TStatusTela);
begin
  BitBtnNovo.Enabled := True;
  BitBtnIncluirC.Enabled := True;
  BitBtnAltera.Enabled := True;
  BitBtnGrava.Enabled := True;
  BitBtnExclui.Enabled := True;
  BitBtnCancela.Enabled := false;

  PanelLcto.Enabled := True;
  GridLcto.Enabled:=true;
  case StatusTela of
    stNavegandoGrid:
      begin
        PanelLcto.Enabled := false;
        BitBtnNovo.Enabled := True;
        BitBtnIncluirC.Enabled := True;
        BitBtnAltera.Enabled := True;
        BitBtnGrava.Enabled := false;
        BitBtnExclui.Enabled := True;
        BitBtnCancela.Enabled := false;
      end;
    stInserindo, stEditando:
      begin
        GridLcto.Enabled:=false;
        PanelLcto.Enabled := True;
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
