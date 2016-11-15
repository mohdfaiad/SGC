unit UContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, UContasPagarVO,
  UContasPagarController, Generics.Collections, UEmpresaTrab, UPessoa, UPessoasVO,
  UPlanoContas, UPlanoContasVO,UPlanoContasController, UHistoricoController, UPessoasController,UGenericVO, UHistoricoVO, UHistorico,
  Vcl.Menus, biblioteca;

type
  TFTelaCadastroContasPagar = class(TFTelaCadastro)
    Vencimento: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEditComp: TMaskEdit;
    MaskEditEmissao: TMaskEdit;
    MaskEditVenc: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEditDoc: TLabeledEdit;
    LabeledEditConta: TLabeledEdit;
    LabeledEditContraP: TLabeledEdit;
    LabeledEditHistorico: TLabeledEdit;
    EditValor: TEdit;
    Label4: TLabel;
    LabeledEditComp: TLabeledEdit;
    LabeledEditPessoa: TLabeledEdit;
    BtnPessoa: TBitBtn;
    BtnConta: TBitBtn;
    BtnContra: TBitBtn;
    BtnHistorico: TBitBtn;
    GroupBox3: TGroupBox;
    RadioButtonValor: TRadioButton;
    RadioButtonPessoa: TRadioButton;
    RadioButtonDoc: TRadioButton;
    LabeledEditdsPessoa: TEdit;
    LabeledEditDsConta: TEdit;
    LabeledEditDsContra: TEdit;
    LabeledEditDsHist: TEdit;
    PopupMenu1: TPopupMenu;
    ProcessarBaixa1: TMenuItem;
    PanelBaixa: TPanel;
    GroupBox2: TGroupBox;
    BtnSair: TBitBtn;
    EditBxCredito: TEdit;
    Label5: TLabel;
    EditBxValor: TEdit;
    Label6: TLabel;
    EditBxJuros: TEdit;
    Label7: TLabel;
    EditBxMulta: TEdit;
    Label8: TLabel;
    EditBxDesc: TEdit;
    Label9: TLabel;
    EditBxConta: TEdit;
    Label10: TLabel;
    EditBxDsConta: TEdit;
    BtnBxConta: TBitBtn;
    BitBtn3: TBitBtn;
    EditBxHist: TEdit;
    EditBxDsHist: TEdit;
    BtnBxHist: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    MaskEditBxEdit: TMaskEdit;
    EditBxDoc: TEdit;
    BitBtn1: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label13: TLabel;
    Edit1: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Edit2: TEdit;
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
    procedure ProcessarBaixa1Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnBxContaClick(Sender: TObject);
    procedure BtnBxHistClick(Sender: TObject);
    procedure EditBxContaExit(Sender: TObject);
    procedure EditBxHistExit(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  //  procedure EditBxValorExit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEditBxEditExit(Sender: TObject);
    procedure MaskEditCompExit(Sender: TObject);
    procedure MaskEditEmissaoExit(Sender: TObject);
    procedure MaskEditVencExit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure EditBxValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxMultaKeyPress(Sender: TObject; var Key: Char);
    procedure EditBxDescKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(ContasPagar: TContasPagarVO): TContasPagarVO;
  end;

var
  FTelaCadastroContasPagar: TFTelaCadastroContasPagar;
  ControllerContasPagar : TContasPagarController;

implementation

{$R *.dfm}

{ TFTelaCadastroContasPagar }

procedure TFTelaCadastroContasPagar.BtnSairClick(Sender: TObject);
begin
  inherited;
  PanelBaixa.Visible:=false;
  PageControl.Enabled:=true;
  DoConsultar;
end;

procedure TFTelaCadastroContasPagar.BitBtn1Click(Sender: TObject);
var
  ContasPagar: TContasPagarVO;
begin
  if(MessageDlg('Confirma cancelamento',mterror,mbokcancel,0)=mrok)then
  begin
    ControllerContasPagar.RemoverBaixa(CDSGrid.FieldByName('IDCONTASPAGAR').AsInteger);
    DoConsultar;
    PanelBaixa.Visible := false;
    PageControl.Enabled:=true;
  end;

end;

procedure TFTelaCadastroContasPagar.BitBtn3Click(Sender: TObject);
var
  ContasPagar: TContasPagarVO;
begin
//  inherited;
  ContasPagar := nil;
  ContasPagar := ControllerContasPagar.ConsultarPorId(CDSGrid.FieldByName('IDCONTASPAGAR')
            .AsInteger);
  if (MaskEditBxEdit.Text<> '  /  /    ' ) then
    ContasPagar.DtBaixa := StrToDateTime(MaskEditBxEdit.Text);

  if (EditBxValor.Text <> '') then
  begin
    try
      ContasPagar.VlBaixa := StrToFloat(EditBxValor.Text);
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
      ContasPagar.VlJuros := StrToFloat(EditBxJuros.Text);
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
      ContasPagar.VlMulta := StrToFloat(EditBxMulta.Text);
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
      ContasPagar.VlDesconto := StrToFloat(EditBxDesc.Text);
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
      ContasPagar.VlPago := StrToFloat(Edit1.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor Pago não é válido!';
        raise;
      end;
    end;
  end;

  if EditBxHist.Text <> '' then
    ContasPagar.IdHistoricoBx := StrToInt (EditBxHist.Text);
  if EditBxConta.Text <> '' then
    ContasPagar.IdContaBaixa := StrToInt(EditBxConta.Text);


  ContasPagar.FlBaixa := 'B';
  try
  ContasPagar.ValidarBaixa();
  ControllerContasPagar.InserirBaixa(ContasPagar);
  DoConsultar;
  PanelBaixa.Visible := false;
  PageControl.Enabled:=true;
  finally
  end;
end;

procedure TFTelaCadastroContasPagar.BitBtnNovoClick(Sender: TObject);
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

procedure TFTelaCadastroContasPagar.BtnBxContaClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoCOnsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      EditBxConta.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
      EditBxDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
    end
    else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroContasPagar.BtnBxHistClick(Sender: TObject);
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

procedure TFTelaCadastroContasPagar.BtnContaClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoCOnsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
       LabeledEditConta.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
       LabeledEditDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
       LabeledEditPessoa.Enabled := false;
       LabeledEditDsPessoa.Enabled := false;
       BtnPessoa.Enabled := false;
    end
    else
      ShowMessage('Conta Sintética');
    end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroContasPagar.BtnContraClick(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoCOnsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      LabeledEditContraP.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
      LabeledEditDsContra.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
    end
    Else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroContasPagar.BtnHistoricoClick(Sender: TObject);
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

procedure TFTelaCadastroContasPagar.BtnPessoaClick(Sender: TObject);
var
  FormPessoaConsulta: TFTelaCadastroPessoa;
begin
  FormPessoaConsulta := TFTelaCadastroPessoa.Create(nil);
  FormPessoaConsulta.FechaForm := true;
  FormPessoaConsulta.ShowModal;
  if (FormPessoaConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditPessoa.Text := IntToStr(TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).idpessoa);
    LabeledEditDsPessoa.Text := TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).nome;
    LabeledEditConta.Enabled := false;
    LabeledEditDsConta.Enabled := false;
    BtnConta.Enabled := false;
  end;
  FormPessoaConsulta.Release;
end;

procedure TFTelaCadastroContasPagar.DoConsultar;
var
  listaContasPagar: TObjectList<TContasPagarVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaContasPagar := ControllerContasPagar.Consultar(filtro);
  PopulaGrid<TContasPagarVo>(listaContasPagar);
end;

function TFTelaCadastroContasPagar.DoExcluir: boolean;
var
  ContasPagar : TContasPagarVo;
begin
  try
    try
      ContasPagar := TContasPagarVo.Create;
      ContasPagar := ControllerContasPagar.ConsultarPorId(CDSGrid.FieldByName('IDCONTASPAGAR')
            .AsInteger);
   //   ContasPagar.idContasPagar := CDSGrid.FieldByName('IDCONTASPAGAR')
   //     .AsInteger;
      if ContasPagar.FlBaixa <> 'B' then
         ControllerContasPagar.Excluir(ContasPagar)
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

function TFTelaCadastroContasPagar.DoSalvar: boolean;
var
  ContasPagar: TContasPagarVO;
begin
    ContasPagar:=EditsToObject(TContasPagarVO.Create);
    try
      try
        ContasPagar.ValidarCampos();
        if (StatusTela = stInserindo) then
        begin
          ContasPagar.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
          ContasPagar.FlBaixa :='P';
          ControllerContasPagar.Inserir(ContasPagar);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          ContasPagar := ControllerContasPagar.ConsultarPorId(CDSGrid.FieldByName('IDCONTASPAGAR')
            .AsInteger);
          ContasPagar := EditsToObject(ContasPagar);
          if ContasPagar.FlBaixa <> 'B' then
          begin
            ControllerContasPagar.Alterar(ContasPagar);
            Result := true;
          end
          Else
          begin
            ShowMessage('Para alterar deverá cancelar a baixa!');
            PageControl.ActivePage := Consulta;
          end;
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

procedure TFTelaCadastroContasPagar.Edit1Exit(Sender: TObject);
var
  ContasPagar: TContasPagarVO;
begin
  inherited;
  ContasPagar := nil;
  if not CDSGrid.IsEmpty then
    ContasPagar := ControllerContasPagar.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASPAGAR').AsInteger);

  if Edit1.Text <> '' then
  begin
  try
    if (StrToFloat(Edit1.Text) > ContasPagar.VlValor)  then
    begin
        if(MessageDlg('Deseja Considerar a diferença como juros?',mterror,mbokcancel,0)=mrok)then
        begin
          EditBxValor.Text := FloatToStr(ContasPagar.VlValor);
          EditBxJuros.Text := FloatToStr((StrToFloat(Edit1.Text) - ContasPagar.VlValor));
        end;
    end;
    if (StrToFloat(Edit1.Text) < ContasPagar.VlValor) then
    begin
        if(MessageDlg('Deseja Considerar a diferença como Desconto?',mterror,mbokcancel,0)=mrok)then
        begin
          EditBxValor.Text := FloatToStr(ContasPagar.VlValor);
          EditBxDesc.Text := FloatToStr(ContasPagar.VlValor - (StrToFloat(Edit1.Text) ));
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

procedure TFTelaCadastroContasPagar.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.EditBxContaExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if EditBxConta.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(EditBxConta.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin
      EditBxDsConta.Text := PlanoContasVO.dsConta;
      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    EditBxDsConta.Text := '';
end;

procedure TFTelaCadastroContasPagar.EditBxDescKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.EditBxHistExit(Sender: TObject);
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

procedure TFTelaCadastroContasPagar.EditBxJurosKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.EditBxMultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.EditBxValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

function TFTelaCadastroContasPagar.EditsToObject(
  ContasPagar: TContasPagarVO): TContasPagarVO;

begin

  if(MaskEditComp.Text<> '  /  /    ' )then
    ContasPagar.DtCompetencia := StrToDateTime(MaskEditComp.Text);
  if(MaskEditEmissao.Text<> '  /  /    ' )then
    ContasPagar.DtEmissao := StrToDateTime(MaskEditEmissao.Text);
  if(MaskEditVenc.Text<> '  /  /    ' )then
    ContasPagar.DtVencimento := StrToDateTime(MaskEditVenc.Text);
  if (LabeledEditDoc.Text <> '') then
    ContasPagar.NrDocumento := LabeledEditDoc.Text;

  if (EditValor.Text <> '') then
  begin
    try
      ContasPagar.VlValor := StrToFloat(EditValor.Text);
    except
      on E:Exception do
      begin
        E.Message := 'Valor digitado não é válido!';
        raise;
      end;
    end;
  end;

  if (LabeledEditComp.Text <> '') then
    ContasPagar.DsComplemento := LabeledEditComp.Text;
  if(LabeledEditHistorico.Text<>'')then
    ContasPagar.IdHistorico := StrToInt(LabeledEditHistorico.Text);

  if(LabeledEditPessoa.Text<>'')then
    ContasPagar.IdPessoa := StrToInt(LabeledEditPessoa.Text)
  else
    ContasPagar.IdPessoa := 0;

  if(LabeledEditConta.Text<>'')then
    ContasPagar.IdConta := StrToInt(LabeledEditConta.Text)
  else
    ContasPagar.IdConta := 0;


  if (LabeledEditContraP.Text<>'') then
    ContasPagar.IdContraPartida := StrToInt(LabeledEditContraP.Text)
  else
    ContasPagar.IdContraPartida :=0;

  Result := ContasPagar;
end;

procedure TFTelaCadastroContasPagar.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerContasPagar);
end;

procedure TFTelaCadastroContasPagar.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContasPagarVO;
  ControllerContasPagar := TContasPagarController.Create;
  inherited;
end;

procedure TFTelaCadastroContasPagar.GridParaEdits;
var
  ContasPagar: TContasPagarVO;
begin
  inherited;
  ContasPagar := nil;

  if not CDSGrid.IsEmpty then
    ContasPagar := ControllerContasPagar.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASPAGAR').AsInteger);

  if ContasPagar <> nil then
  begin

        if ContasPagar.PessoaVO <> nil then
        begin
          LabeledEditPessoa.Text := IntToStr(ContasPagar.PessoaVo.idPessoa);
          LabeledEditDsPessoa.Text := ContasPagar.PessoaVO.nome;
        end;
        if (ContasPagar.PlanoContasContaVO <> nil ) then
        begin
          LabeledEditConta.Text := IntToStr(ContasPagar.PlanoContasContaVO.idPlanoContas);
          LabeledEditDsConta.Text := ContasPagar.PlanoContasContaVO.dsConta;
        end;
        if ContasPagar.PlanoContasContraPartidaVO <> nil then
        begin
          LabeledEditContraP.Text := IntToStr(ContasPagar.PlanoContasContraPartidaVO.idPlanoContas);
          LabeledEditDsContra.Text := ContasPagar.PlanoContasContraPartidaVO.dsConta;
        end;

        if ContasPagar.HistoricoVO <> nil then
        begin
          LabeledEditHistorico.Text := IntToStr(ContasPagar.HistoricoVO.idHistorico);
          LabeledEditDsHist.Text :=  ContasPagar.HistoricoVO.DsHistorico;
        end;

        EditValor.Text := FloatToStr(ContasPagar.VlValor);
        LabeledEditComp.Text := ContasPagar.DsComplemento;
        LabeledEditDoc.Text := ContasPagar.NrDocumento;
        MaskEditComp.Text := DateToStr(ContasPagar.DtCompetencia);
        MaskEditEmissao.Text := DateToStr(ContasPagar.DtEmissao);
        MaskEditVenc.Text := DateToStr(ContasPagar.DtVencimento);

    end;

end;

procedure TFTelaCadastroContasPagar.GroupBox2Click(Sender: TObject);
begin
  inherited;
  MaskEditBxEdit.SetFocus;

end;

procedure TFTelaCadastroContasPagar.LabeledEditContaExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if LabeledEditConta.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(LabeledEditConta.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin
      LabeledEditDsConta.Text := PlanoContasVO.dsConta;
      PlanoController.Free;
      LabeledEditPessoa.Enabled := false;
      LabeledEditDsPessoa.Enabled := false;
      BtnPessoa.Enabled := false;
    end;
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

procedure TFTelaCadastroContasPagar.LabeledEditContraPExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if LabeledEditContraP.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(LabeledEditContraP.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin
      LabeledEditDsContra.Text := PlanoContasVO.dsConta;
      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    LabeledEditDsContra.Text := '';
  end;
end;

procedure TFTelaCadastroContasPagar.LabeledEditHistoricoExit(Sender: TObject);
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

procedure TFTelaCadastroContasPagar.LabeledEditPessoaExit(Sender: TObject);
var
  PessoaController:TPessoasController;
  PessoaVO: TPessoasVO;
begin
  if LabeledEditPessoa.Text <> '' then
  begin
  try
    PessoaController := TPessoasController.Create;
    PessoaVO := PessoaController.ConsultarPorId(StrToInt(LabeledEditPessoa.Text));
    labeledEditDsPessoa.Text := PessoaVO.nome;
    LabeledEditPessoa.Text := inttostr(PessoaVO.idPessoa);
    PessoaController.Free;
    LabeledEditConta.Enabled := false;
    LabeledEditDsConta.Enabled := false;
    BtnConta.Enabled := false;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    labeledEditDsPessoa.Text := '';
    labeledEditConta.Enabled := true;
    labeledEditDsConta.Enabled := true;
    BtnConta.Enabled := true;
  end;
end;

procedure TFTelaCadastroContasPagar.MaskEdit1Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasPagar.MaskEdit2Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasPagar.MaskEdit3Exit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasPagar.MaskEditBxEditExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasPagar.MaskEditCompExit(Sender: TObject);
begin
  EventoValidaData(sender);
end;

procedure TFTelaCadastroContasPagar.MaskEditEmissaoExit(Sender: TObject);
begin
  EventoValidaData(sender);

end;

procedure TFTelaCadastroContasPagar.MaskEditVencExit(Sender: TObject);
begin
  EventoValidaData(sender);

end;

function TFTelaCadastroContasPagar.MontaFiltro: string;
var dataini,datafim:string;
begin
  dataini:='01.01.0001';
  datafim:='31.12.2999';
  if(MaskEdit1.Text<>'  /  /    ')then
    dataini:=  StringReplace(MaskEdit1.Text,'/','.',[rfReplaceAll]);
  if(MaskEdit2.Text<>'  /  /    ')then
    datafim:=  StringReplace(MaskEdit2.Text,'/','.',[rfReplaceAll]);

  Result :=' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  Result := Result+ ' AND ( DtVencimento >='+QuotedStr(dataini)+
                            ' AND DTVENCIMENTO <= '+QuotedStr(datafim)+' ) ';
 if (RadioButtonPessoa.Checked = true) then
 begin
  if(editbusca.Text<>'')then
    Result:= result+ ' AND Upper(Nome) like '+QuotedStr('%'+Uppercase(EditBusca.Text)+'%')
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

procedure TFTelaCadastroContasPagar.ProcessarBaixa1Click(Sender: TObject);
var
  ContasPagar: TContasPagarVO;
  PessoaController:TPessoasController;
  PlanoController :TPlanoContasController;
  PlanoDController : TPlanoContasController;
  PlanoDVo : TPlanoContasVO;
  HistoricoController : THistoricoController;
  HistoricoVO : THistoricoVO;
  PlanoVO : TPlanoContasVO;
  PessoaVO: TPessoasVO;

begin
  inherited;
  ContasPagar := nil;


  if not CDSGrid.IsEmpty then
    ContasPagar := ControllerContasPagar.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASPAGAR').AsInteger);

    Edit2.Text := FloatToStr(ContasPagar.VlValor);
    MaskEdit3.Text := DateToStr(ContasPagar.DtEmissao);
    EditBxDoc.Text := (ContasPagar.NrDocumento);
    PessoaController := TPessoasController.Create;
    PlanoDController := TPlanoContasController.Create;
    if ContasPagar.IdPessoa <> 0 then
    begin
      PessoaVO := PessoaController.ConsultarPorId(ContasPagar.IdPessoa);
      EditBxCredito.Text := PessoaVO.nome;
    end;
    if ContasPagar.IdConta <> 0 then
    begin
      PlanoDVO := PlanoDController.ConsultarPorId(ContasPagar.IdConta);
      EditBxCredito.Text := PlanoDVo.dsConta;
    end;

    if ContasPagar.DtBaixa <> 0 then
      MaskEditBxEdit.Text := DateTimeToStr(ContasPagar.DtBaixa)
    else
      MaskEditBxEdit.Text := '  /  /    ';

    if ContasPagar.VlPago <> 0 then
      Edit1.Text := FloatToStr(ContasPagar.VlPago)
    else
      Edit1.Text := '';

    if ContasPagar.VlBaixa <> 0 then
      EditBxValor.Text := FloatToStr(ContasPagar.VlBaixa)
    else
      EditBxValor.Text := '';

    if ContasPagar.VlJuros <> 0 then
      EditBxJuros.Text := FloatToStr(ContasPagar.VlJuros)
    else
      EditBxJuros.Text :='';
    if ContasPagar.VlMulta <> 0 then
      EditBxMulta.Text := FloatToStr(ContasPagar.VlMulta)
    else
      EditBxMulta.Text :='';

    if ContasPagar.VlDesconto <> 0 then
      EditBxDesc.Text := FloatToStr(ContasPagar.VlDesconto)
    else
      EditBxDesc.Text :='';

    if ContasPagar.IdContaBaixa <> 0 then
    begin
      EditBxConta.Text := IntToStr(ContasPagar.IdContaBaixa);
      PlanoController := TPlanoContasController.Create;
      PlanoVO := PlanoController.ConsultarPorId(ContasPagar.IdContaBaixa);
      EditBxDsConta.Text := PlanoVO.dsConta;
    end
    else
    begin
      EditBxConta.Text :='';
      EditBxDsConta.Text :='';
    end;

    if ContasPagar.IdHistoricoBx <> 0 then
    begin
      EditBxHist.Text := IntToStr(ContasPagar.IdHistoricoBx);
      HistoricoController := THistoricoController.Create;
      HistoricoVO := HistoricoController.ConsultarPorId(ContasPagar.IdHistoricoBx);
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
