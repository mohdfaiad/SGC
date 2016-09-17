unit UContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,UContasReceberVO,
  UContasReceberController, Generics.Collections, UEmpresaTrab, UUnidade, UUnidadeVO,
  UPlanoContas, UPlanoContasVO,UPlanoContasController, UHistoricoController, UUnidadeController,
  UGenericVO, UHistoricoVO, UHistorico;

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


  private
    { Private declarations }
  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(ContasReceber: TContasReceberVO): TContasReceberVO;
  end;

var
  FTelaCadastroContasReceber: TFTelaCadastroContasReceber;
  ContasReceberController : TContasReceberController;

implementation

{$R *.dfm}

{ TFTelaCadastroContasReceber }

procedure TFTelaCadastroContasReceber.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  MaskEditComp.SetFocus
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
    LabeledEditPessoa.Text := IntToStr(TUnidadeVO(FormPessoaConsulta.ObjetoRetornoVO).idUnidade);
    LabeledEditDsPessoa.Text := TUnidadeVO(FormPessoaConsulta.ObjetoRetornoVO).DsUnidade;
  end;
  FormUnidadeConsulta.Release;
end;

procedure TFTelaCadastroContasReceber.DoConsultar;
var
  listaContasReceber: TObjectList<TContasReceberVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaContasReceber := ContasReceberController.Consultar(filtro);
  PopulaGrid<TContasReceberVo>(listaContasReceber);
end;

function TFTelaCadastroContasReceber.DoExcluir: boolean;
var
  ContasReceber : TContasReceberVo;
begin
  try
    try
      ContasReceber := TContasReceberVo.Create;
      ContasReceber.idContasReceber := CDSGrid.FieldByName('IDCONTASRECEBER')
        .AsInteger;
      ContasReceberController.Excluir(ContasReceber);
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
        ContasReceber.ValidarCamposObrigatorios();
           if (StatusTela = stInserindo) then
           begin
              ContasReceber.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ContasReceberController.Inserir(ContasReceber);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            ContasReceber := ContasReceberController.ConsultarPorId(CDSGrid.FieldByName('IDCONTASRECEBER')
              .AsInteger);
            ContasReceber := EditsToObject(ContasReceber);
            ContasReceberController.Alterar(ContasReceber);
            Result := true;
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
    ContasReceber.VlValor := StrToFloat(EditValor.Text);

  if (LabeledEditComp.Text <> '') then
    ContasReceber.DsComplemento := LabeledEditComp.Text;

  if(LabeledEditHistorico.Text<>'')then
    ContasReceber.IdHistorico := StrToInt(LabeledEditHistorico.Text);

  if(LabeledEditPessoa.Text<>'')then
    ContasReceber.IdUnidade := StrToInt(LabeledEditPessoa.Text);

  if(LabeledEditConta.Text<>'')then
    ContasReceber.IdConta := StrToInt(LabeledEditConta.Text);

  if (LabeledEditContraP.Text<>'') then
    ContasReceber.IdContraPartida := StrToInt(LabeledEditContraP.Text);

  Result := ContasReceber;

end;

procedure TFTelaCadastroContasReceber.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContasReceberVO;
  inherited;
end;

procedure TFTelaCadastroContasReceber.GridParaEdits;
var
  ContasReceber: TContasReceberVO;
begin
  inherited;
  ContasReceber := nil;

  if not CDSGrid.IsEmpty then
    ContasReceber := ContasReceberController.ConsultarPorId
      (CDSGrid.FieldByName('IDCONTASRECEBER').AsInteger);

  if ContasReceber <> nil then
  begin
    if ContasReceber.UnidadeVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(ContasReceber.UnidadeVO.idUnidade);
     // LabeledEditDsPessoa.Text := ContasPagar.PessoaVO.nome;
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

function TFTelaCadastroContasReceber.MontaFiltro: string;
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
 { if(editbusca.Text<>'')then
    Result:= result+ ' AND Upper(Nome) like '+QuotedStr('%'+Uppercase(EditBusca.Text)+'%');
if (RadioButtonPessoa.Checked = true) then
 begin
  if(editbusca.Text<>'')then
    Result:= result+ ' AND Upper(Nome) like '+QuotedStr('%'+Uppercase(EditBusca.Text)+'%')
 end     }
 if  (RadioButtonValor.Checked = true) then
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

end.
