unit UContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,UContasReceberVO,
  UContasReceberController, Generics.Collections, UEmpresaTrab, UUnidade, UUnidadeVO,
  UPlanoContas, UPlanoContasVO,UPlanoContasController, UHistoricoController, UUnidadeController,
  UGenericVO, UHistoricoVO, UHistorico, Vcl.Menus, Biblioteca;

type
  TFTelaCadastroContasReceber = class(TFTelaCadastro)
    MaskEditComp: TMaskEdit;
    MaskEditVenc: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    LabeledEditDoc: TLabeledEdit;
    LabeledEditPessoa: TLabeledEdit;
    LabeledEditConta: TLabeledEdit;
    LabeledEditContraP: TLabeledEdit;
    BtnContra: TBitBtn;
    BtnConta: TBitBtn;
    BtnPessoa: TBitBtn;
    LabeledEditHistorico: TLabeledEdit;
    BtnHistorico: TBitBtn;
    EditValor: TEdit;
    LabeledEditComp: TLabeledEdit;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox3: TGroupBox;
    RadioButtonValor: TRadioButton;
    RadioButtonDoc: TRadioButton;
    LabeledEditDsPessoa: TEdit;
    LabeledEditDsConta: TEdit;
    LabeledEditDsContra: TEdit;
    LabeledEditDsHist: TEdit;
    PopupMenu1: TPopupMenu;
    ProcessarBaixa1: TMenuItem;
    RadioButton1: TRadioButton;
    PanelBaixa: TPanel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BtnSair: TBitBtn;
    EditBxCredito: TEdit;
    EditBxValor: TEdit;
    EditBxJuros: TEdit;
    EditBxMulta: TEdit;
    EditBxDesc: TEdit;
    EditBxConta: TEdit;
    EditBxDsConta: TEdit;
    BtnBxConta: TBitBtn;
    BitBtn3: TBitBtn;
    EditBxHist: TEdit;
    EditBxDsHist: TEdit;
    BtnBxHist: TBitBtn;
    MaskEditBxEdit: TMaskEdit;
    EditBxDoc: TEdit;
    BitBtn1: TBitBtn;
    MaskEdit3: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    function DoSalvar: boolean; override;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    function MontaFiltro: string;
    procedure BtnPessoaClick(Sender: TObject);
    procedure BtnContaClick(Sender: TObject);
    procedure BtnContraClick(Sender: TObject);
    procedure LabeledEditPessoaExit(Sender: TObject);
    procedure BtnHistoricoClick(Sender: TObject);
    procedure LabeledEditContaExit(Sender: TObject);
    procedure LabeledEditContraPExit(Sender: TObject);
    procedure LabeledEditHistoricoExit(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnBxContaClick(Sender: TObject);
    procedure BtnBxHistClick(Sender: TObject);
    procedure ProcessarBaixa1Click(Sender: TObject);
    procedure BitBtn1Exit(Sender: TObject);
    procedure EditBxHistExit(Sender: TObject);
    procedure EditBxContaExit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure EditBxValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxMultaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxDescKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEditBxEditExit(Sender: TObject);
    procedure MaskEditCompExit(Sender: TObject);
    procedure MaskEditVencExit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(ContasReceber: TContasReceberVO): TContasReceberVO;
  end;

var
  FTelaCadastroContasReceber: TFTelaCadastroContasReceber;
  ControllerContasReceber : TContasReceberController;

implementation

{$R *.dfm}

{ TFTelaCadastroContasReceber }

procedure TFTelaCadastroContasReceber.BitBtn1Click(Sender: TObject);
var
  ContasReceber: TContasReceberVO;
begin
//  inherited;
  ContasReceber := nil;
  ContasReceber := ControllerContasReceber.ConsultarPorId(CDSGrid.FieldByName('IDCONTASRECEBER')
            .AsInteger);
  ContasReceber.DtBaixa := 0;
  ContasReceber.VlBaixa := 0;
  ContasReceber.VlJuros := 0;
  ContasReceber.VlMulta := 0;
  ContasReceber.VlDesconto := 0;
  ContasReceber.IdHistoricoBx := 0;
  ContasReceber.IdContaBaixa := 0;
  ContasReceber.VlPago := 0;
  ContasReceber.FlBaixa := 'P';
  if(MessageDlg('Confirma cancelamento',mterror,mbokcancel,0)=mrok)then
  begin
    ControllerContasReceber.Alterar(ContasReceber);
    DoConsultar;
    PanelBaixa.Visible := false;
    PageControl.Enabled:=true;
  end;

end;

procedure TFTelaCadastroContasReceber.BitBtn1Exit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if EditBxConta.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(EditBxConta.Text));
    EditBxDsConta.Text := PlanoContasVO.dsConta;
    PlanoController.Free;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    EditBxDsConta.Text := '';
end;

procedure TFTelaCadastroContasReceber.BitBtn3Click(Sender: TObject);
var
  ContasReceber: TContasReceberVO;
begin
//  inherited;
  ContasReceber := nil;
  ContasReceber := ControllerContasReceber.ConsultarPorId(CDSGrid.FieldByName('IDCONTASRECEBER')
            .AsInteger);
  if (MaskEditBxEdit.Text<> '  /  /    ' ) then
    ContasReceber.DtBaixa := StrToDateTime(MaskEditBxEdit.Text);
  if (EditBxValor.Text <> '') then
  begin
    try
      ContasReceber.VlBaixa := StrToFloat(EditBxValor.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Baixa não é válido!';
        raise;
      end;
    end;
  end;
  if (EditBxJuros.Text <> '') then
  begin
    try
      ContasReceber.VlJuros := StrToFloat(EditBxJuros.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Juros não é válido!';
        raise;
      end;
    end;
  end;
  if (EditBxMulta.Text <> '') then
  begin
    try
      ContasReceber.VlMulta := StrToFloat(EditBxMulta.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Multa não é válido!';
        raise;
      end;
    end;
  end;
  if (EditBxDesc.Text <> '') then
  begin
    try
      ContasReceber.VlDesconto := StrToFloat(EditBxDesc.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Desconto não é válido!';
        raise;
      end;
    end;
  end;

 if (Edit1.Text <> '') then
  begin
    try
      ContasReceber.VlPago := StrToFloat(Edit1.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Pago não é válido!';
        raise;
      end;
    end;
  end;
  if EditBxHist.Text <> '' then
    ContasReceber.IdHistoricoBx := StrToInt (EditBxHist.Text);
  if EditBxConta.Text <> '' then
    ContasReceber.IdContaBaixa := StrToInt(EditBxConta.Text);


  ContasReceber.FlBaixa := 'B';
  try
  ContasReceber.ValidarBaixa();
  ControllerContasReceber.Alterar(ContasReceber);
  DoConsultar;
  PanelBaixa.Visible := false;
  PageControl.Enabled:=true;
  finally
  end;
end;

procedure TFTelaCadastroContasReceber.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  MaskEditComp.SetFocus;
  LabeledEditPessoa.Enabled := true;
  LabeledEditDsPessoa.Enabled := true;
  BtnPessoa.Enabled := true;
  LabeledEditConta.Enabled := true;
  LabeledEditDsConta.Enabled := true;
  BtnConta.Enabled := true;
end;

procedure TFTelaCadastroContasReceber.BtnBxContaClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    EditBxConta.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    EditBxDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroContasReceber.BtnBxHistClick(Sender: TObject);
var
  FormHistorico: TFTelaCadastroHistorico;
begin
  FormHistorico := TFTelaCadastroHistorico.Create(nil);
  FormHistorico.FechaForm := true;
  FormHistorico.ShowModal;
  if (FormHistorico.ObjetoRetornoVO <> nil) then
  begin
    EditBxHist.Text := IntToStr(THistoricoVO(FormHistorico.ObjetoRetornoVO).idHistorico);
    EditBxDsHist.Text := THistoricoVO(FormHistorico.ObjetoRetornoVO).dsHistorico;
  end;
  FormHistorico.Release;
end;

procedure TFTelaCadastroContasReceber.BtnContaClick(Sender: TObject);
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
    LabeledEditPessoa.Enabled := false;
    LabeledEditDsPessoa.Enabled := false;
    BtnPessoa.Enabled := false;
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroContasReceber.BtnContraClick(Sender: TObject);
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

procedure TFTelaCadastroContasReceber.BtnHistoricoClick(Sender: TObject);
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

procedure TFTelaCadastroContasReceber.BtnPessoaClick(Sender: TObject);
var
  FormUnidadeConsulta: TFTelaCadastroUnidade;
begin
  FormUnidadeConsulta := TFTelaCadastroUnidade.Create(nil);
  FormUnidadeConsulta.FechaForm := true;
  FormUnidadeConsulta.ShowModal;
  if (FormUnidadeConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditPessoa.Text := IntToStr(TUnidadeVO(FormUnidadeConsulta.ObjetoRetornoVO).idUnidade);
    LabeledEditDsPessoa.Text := TUnidadeVO(FormUnidadeConsulta.ObjetoRetornoVO).DsUnidade;
    LabeledEditConta.Enabled := false;
    LabeledEditDsConta.Enabled := false;
    BtnConta.Enabled := false;
  end;
  FormUnidadeConsulta.Release;
end;

procedure TFTelaCadastroContasReceber.BtnSairClick(Sender: TObject);
Begin
  inherited;
  PanelBaixa.Visible:=false;
  PageControl.Enabled:=true;
  DoConsultar;
end;

procedure TFTelaCadastroContasReceber.DoConsultar;
var
  listaContasReceber: TObjectList<TContasReceberVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaContasReceber := ControllerContasReceber.Consultar(filtro);
  PopulaGrid<TContasReceberVo>(listaContasReceber);
end;

function TFTelaCadastroContasReceber.DoExcluir: boolean;
var
  ContasReceber : TContasReceberVo;
begin
  try
    try
       ContasReceber := TContasReceberVo.Create;
      ContasReceber := ControllerContasReceber.ConsultarPorId(CDSGrid.FieldByName('IDCONTASRECEBER')
            .AsInteger);
   //   ContasPagar.idContasPagar := CDSGrid.FieldByName('IDCONTASPAGAR')
   //     .AsInteger;
      if ContasReceber.FlBaixa <> 'B' then
         ControllerContasReceber.Excluir(ContasReceber)
      else
      begin
        ShowMessage('Para excluir deverá cancelar a baixa!');
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

function TFTelaCadastroContasReceber.DoSalvar: boolean;
var
  ContasReceber : TContasReceberVo;
begin
  begin
    ContasReceber:=EditsToObject(TContasReceberVo.Create);
    try
      try
        ContasReceber.ValidarCampos();
           if (StatusTela = stInserindo) then
           begin
              ContasReceber.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ContasReceber.FlBaixa := 'P';
              ControllerContasReceber.Inserir(ContasReceber);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            ContasReceber := ControllerContasReceber.ConsultarPorId(CDSGrid.FieldByName('IDCONTASRECEBER')
              .AsInteger);
            ContasReceber := EditsToObject(ContasReceber);
            if ContasReceber.FlBaixa <> 'B' then
          begin
            ControllerContasReceber.Alterar(ContasReceber);
            Result := true;
          end
          Else
          begin
            ShowMessage('Para alterar deverá cancelar a baixa!');
            PageControl.ActivePage := Consulta;
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

procedure TFTelaCadastroContasReceber.Edit1Exit(Sender: TObject);
var
  ContasReceber: TContasReceberVO;
begin
  inherited;
  ContasReceber := nil;
  if not CDSGrid.IsEmpty then
    ContasReceber := ControllerContasReceber.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASRECEBER').AsInteger);

  if Edit1.Text <> '' then
  begin
    try
    if (StrToFloat(Edit1.Text) > ContasReceber.VlValor)  then
    begin
        if(MessageDlg('Deseja Considerar a diferença como juros?',mterror,mbokcancel,0)=mrok)then
        begin
          EditBxValor.Text := FloatToStr(ContasReceber.VlValor);
          EditBxJuros.Text := FloatToStr((StrToFloat(Edit1.Text) - ContasReceber.VlValor));
        end;
    end;
    if (StrToFloat(Edit1.Text) < ContasReceber.VlValor) then
    begin
        if(MessageDlg('Deseja Considerar a diferença como Desconto?',mterror,mbokcancel,0)=mrok)then
        begin
          EditBxValor.Text := FloatToStr(ContasReceber.VlValor);
          EditBxDesc.Text := FloatToStr(ContasReceber.VlValor - (StrToFloat(Edit1.Text) ));
        end;
    end;
    except
      on E:Exception do
      begin
        E.Message := 'Valor não é válido!';
        raise;
      end;

    end;
  end;
end;

procedure TFTelaCadastroContasReceber.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.EditBxContaExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if EditBxConta.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(EditBxConta.Text));
    EditBxDsConta.Text := PlanoContasVO.dsConta;
    PlanoController.Free;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    EditBxDsConta.Text := '';
end;


procedure TFTelaCadastroContasReceber.EditBxDescKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.EditBxHistExit(Sender: TObject);
var
  HistoricoController:THistoricoController;
  HistoricoVO: THistoricoVO;
begin
  if EditBxHist.Text <> '' then
  begin
  try
    HistoricoController := THistoricoController.Create;
    HistoricoVO := HistoricoController.ConsultarPorId(StrToInt(EditBxHist.Text));
    EditBxDsHist.Text := HistoricoVO.DsHistorico;
    HistoricoController.Free;
  Except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    EditBxDsHist.Text := '';
  end;
end;

procedure TFTelaCadastroContasReceber.EditBxJurosKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.EditBxMultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.EditBxValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

function TFTelaCadastroContasReceber.EditsToObject(
  ContasReceber: TContasReceberVO): TContasReceberVO;
begin

  if(MaskEditComp.Text<> '  /  /    ' )then
    ContasReceber.DtCompetencia := StrToDateTime(MaskEditComp.Text);

  if(MaskEditVenc.Text<> '  /  /    ' )then
    ContasReceber.DtVencimento := StrToDateTime(MaskEditVenc.Text);

  if (LabeledEditDoc.Text <> '') then
    ContasReceber.NrDocumento := LabeledEditDoc.Text;
  if (EditValor.Text <> '') then
  begin
    try
      ContasReceber.VlValor := StrToFloat(EditValor.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor digitado não é válido!';
        raise;
      end;
    end;
  end;

  if (LabeledEditComp.Text <> '') then
    ContasReceber.DsComplemento := LabeledEditComp.Text;

  if(LabeledEditHistorico.Text<>'')then
    ContasReceber.IdHistorico := StrToInt(LabeledEditHistorico.Text);

  if(LabeledEditPessoa.Text<>'')then
    ContasReceber.IdUnidade := StrToInt(LabeledEditPessoa.Text)
  else
    ContasReceber.IdUnidade :=0;

  if(LabeledEditConta.Text<>'')then
    ContasReceber.IdConta := StrToInt(LabeledEditConta.Text)
  else
    ContasReceber.IdConta := 0;

  if (LabeledEditContraP.Text<>'') then
    ContasReceber.IdContraPartida := StrToInt(LabeledEditContraP.Text)
  else
    ContasReceber.IdContraPartida := 0;

  Result := ContasReceber;

end;

procedure TFTelaCadastroContasReceber.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerContasReceber);
end;

procedure TFTelaCadastroContasReceber.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContasReceberVO;
  ControllerContasReceber := TContasReceberController.Create;
  inherited;
end;

procedure TFTelaCadastroContasReceber.GridParaEdits;
var
  ContasReceber: TContasReceberVO;
begin
  inherited;
  ContasReceber := nil;

  if not CDSGrid.IsEmpty then
    ContasReceber := ControllerContasReceber.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASRECEBER').AsInteger);

  if ContasReceber <> nil then
  begin
    if ContasReceber.UnidadeVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(ContasReceber.UnidadeVO.idUnidade);
      LabeledEditDsPessoa.Text := ContasReceber.UnidadeVO.DsUnidade;
    end;
    if (ContasReceber.PlanoContasContaVO <> nil ) then
    begin
      LabeledEditConta.Text := IntToStr(ContasReceber.PlanoContasContaVO.idPlanoContas);
      LabeledEditDsConta.Text := ContasReceber.PlanoContasContaVO.dsConta;
    end;
    if ContasReceber.PlanoContasContraPartidaVO <> nil then
    begin
      LabeledEditContraP.Text := IntToStr(ContasReceber.PlanoContasContraPartidaVO.idPlanoContas);
      LabeledEditDsContra.Text := ContasReceber.PlanoContasContraPartidaVO.dsConta;
    end;
    if ContasReceber.HistoricoVO <> nil then
    begin
      LabeledEditHistorico.Text := IntToStr(ContasReceber.HistoricoVO.idHistorico);
      LabeledEditDsHist.Text :=  ContasReceber.HistoricoVO.DsHistorico;
    end;

    EditValor.Text := FloatToStr(ContasReceber.VlValor);
    LabeledEditComp.Text := ContasReceber.DsComplemento;
    LabeledEditDoc.Text := ContasReceber.NrDocumento;
    MaskEditComp.Text := DateToStr(ContasReceber.DtCompetencia);
    MaskEditVenc.Text := DateToStr(ContasReceber.DtVencimento);
  end;
end;

procedure TFTelaCadastroContasReceber.LabeledEditContaExit(Sender: TObject);
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
    LabeledEditPessoa.Enabled := false;
    BtnPessoa.Enabled := false;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    LabeledEditDsConta.Text := '';
    LabeledEditPessoa.Enabled := true;
    BtnPessoa.Enabled := true;
  end;
end;

procedure TFTelaCadastroContasReceber.LabeledEditContraPExit(Sender: TObject);
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
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    LabeledEditDsContra.Text := '';
  end;
end;

procedure TFTelaCadastroContasReceber.LabeledEditHistoricoExit(Sender: TObject);
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
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    LabeledEditDsHist.Text := '';
  end;
end;

procedure TFTelaCadastroContasReceber.LabeledEditPessoaExit(Sender: TObject);
var
  UnidadeController:TUnidadeController;
  UnidadeVO: TUnidadeVO;
begin
  if LabeledEditPessoa.Text <> '' then
  begin
  try
    UnidadeController := TUnidadeController.Create;
    UnidadeVO := UnidadeController.ConsultarPorId(StrToInt(LabeledEditPessoa.Text));
    labeledEditDsPessoa.Text := UnidadeVO.DsUnidade;
    LabeledEditPessoa.Text := inttostr(UnidadeVO.idUnidade);
    UnidadeController.Free;
    LabeledEditConta.Enabled := false;
    BtnConta.Enabled := false;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    labeledEditDsPessoa.Text := '';
    LabeledEditConta.Enabled := true;
    BtnConta.Enabled := true;
  end;
end;

procedure TFTelaCadastroContasReceber.MaskEdit1Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasReceber.MaskEdit2Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasReceber.MaskEdit3Exit(Sender: TObject);
begin
 EventoValidaData(sender);
end;

procedure TFTelaCadastroContasReceber.MaskEditBxEditExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasReceber.MaskEditCompExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasReceber.MaskEditVencExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

function TFTelaCadastroContasReceber.MontaFiltro: string;
var dataini,datafim:string;
begin
  dataini:='01.01.0001';
  datafim:='31.12.2999';
  if(MaskEdit1.Text<>'  /  /    ')then
    dataini:=  StringReplace(MaskEdit1.Text,'/','.',[rfReplaceAll]);
  if(MaskEdit2.Text<>'  /  /    ')then
    datafim:=  StringReplace(MaskEdit2.Text,'/','.',[rfReplaceAll]);

  Result :=' ( CONTASRECEBER.IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  Result := Result+ ' AND ( DtVencimento >='+QuotedStr(dataini)+
                            ' AND DTVENCIMENTO <= '+QuotedStr(datafim)+' ) ';
 if (RadioButton1.Checked = true) then
 begin
  if(editbusca.Text<>'')then
    Result:= result+ ' AND Upper(DSUNIDADE) like '+QuotedStr('%'+Uppercase(EditBusca.Text)+'%')
 end
 else if  (RadioButtonValor.Checked = true) then
 begin
  if (editBusca.Text <> '') then
      Result := result + ' and ( UPPER(VLVALOR) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
 end
 else if (RadioButtonDoc.Checked = true) then
 begin
  if (editBusca.Text <> '') then
      Result := result + ' AND ( UPPER(NRDOCUMENTO) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;

procedure TFTelaCadastroContasReceber.ProcessarBaixa1Click(Sender: TObject);
var
  ContasReceber: TContasReceberVO;
  UnidadeController:TUnidadeController;
  Unidade2Controller:TUnidadeController;
  PlanoController :TPlanoContasController;
  PlanoDController : TPlanoContasController;
  PlanoDVo : TPlanoContasVO;
  HistoricoController : THistoricoController;
  HistoricoVO : THistoricoVO;
  PlanoVO : TPlanoContasVO;
  UnidadeVO: TUnidadeVO;
  UnidadeVO2 : TUnidadeVO;
begin
  inherited;
  ContasReceber := nil;


  if not CDSGrid.IsEmpty then
    ContasReceber := ControllerContasReceber.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASRECEBER').AsInteger);

    Edit2.Text := FloatToStr(ContasReceber.VlValor);
    MaskEdit3.Text := DateToStr(ContasReceber.DtCompetencia);
    EditBxDoc.Text := (ContasReceber.NrDocumento);
    UnidadeController := TUnidadeController.Create;
    unidade2Controller := TUnidadeController.Create;
    PlanoDController := TPlanoContasController.Create;

    if ContasReceber.IdConta <> 0 then
    begin
      PlanoDVO := PlanoDController.ConsultarPorId(ContasReceber.IdConta);
      EditBxCredito.Text := PlanoDVo.dsConta;
    end;
    if ContasReceber.IdUnidade <> 0 then
    begin
      UnidadeVO2 := UnidadeController.ConsultarPorId(ContasReceber.IdUnidade);
      EditBxCredito.Text := UnidadeVO2.DsUnidade;
    end;

    if ContasReceber.DtBaixa <> 0 then
      MaskEditBxEdit.Text := DateTimeToStr(ContasReceber.DtBaixa)
    else
      MaskEditBxEdit.Text := '  /  /    ';

    if ContasReceber.VlPago <> 0 then
      Edit1.Text := FloatToStr(ContasReceber.VlPago)
    else
      Edit1.Text := '' ;

    if ContasReceber.VlBaixa <> 0 then
      EditBxValor.Text := FloatToStr(ContasReceber.VlBaixa)
    else
      EditBxValor.Text := '';

    if ContasReceber.VlJuros <> 0 then
      EditBxJuros.Text := FloatToStr(ContasReceber.VlJuros)
    else
      EditBxJuros.Text :='';
    if ContasReceber.VlMulta <> 0 then
      EditBxMulta.Text := FloatToStr(ContasReceber.VlMulta)
    else
      EditBxMulta.Text :='';

    if ContasReceber.VlDesconto <> 0 then
      EditBxDesc.Text := FloatToStr(ContasReceber.VlDesconto)
    else
      EditBxDesc.Text :='';




    if ContasReceber.IdContaBaixa <> 0 then
    begin
      EditBxConta.Text := IntToStr(ContasReceber.IdContaBaixa);
      PlanoController := TPlanoContasController.Create;
      PlanoVO := PlanoController.ConsultarPorId(ContasReceber.IdContaBaixa);
      EditBxDsConta.Text := PlanoVO.dsConta;
    end
    else
    begin
      EditBxConta.Text :='';
      EditBxDsConta.Text :='';
    end;

    if ContasReceber.IdHistoricoBx <> 0 then
    begin
      EditBxHist.Text := IntToStr(ContasReceber.IdHistoricoBx);
      HistoricoController := THistoricoController.Create;
      HistoricoVO := HistoricoController.ConsultarPorId(ContasReceber.IdHistoricoBx);
      EditBxDsHist.Text := HistoricoVo.DsHistorico;
    end
    else
    begin
      EditBxHist.Text :='';
      EditBxDsHist.Text :='';
    end;

  PanelBaixa.Visible:=true;
  PageControl.Enabled:=false;
end;

end.
