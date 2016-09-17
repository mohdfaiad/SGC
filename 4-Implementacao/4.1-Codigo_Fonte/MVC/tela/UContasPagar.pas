unit UContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, UContasPagarVO,
  UContasPagarController, Generics.Collections, UEmpresaTrab, UPessoa, UPessoasVO,
  UPlanoContas, UPlanoContasVO,UPlanoContasController, UHistoricoController, UPessoasController,UGenericVO, UHistoricoVO, UHistorico;

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
    function EditsToObject(ContasPagar: TContasPagarVO): TContasPagarVO;
  end;

var
  FTelaCadastroContasPagar: TFTelaCadastroContasPagar;
  ContasPagarController : TContasPagarController;

implementation

{$R *.dfm}

{ TFTelaCadastroContasPagar }

procedure TFTelaCadastroContasPagar.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  MaskEditComp.SetFocus
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
    LabeledEditConta.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    LabeledEditDsConta.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
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
    LabeledEditContraP.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    LabeledEditDsContra.Text := TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).dsConta;
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
  end;
  FormPessoaConsulta.Release;
end;

procedure TFTelaCadastroContasPagar.DoConsultar;
var
  listaContasPagar: TObjectList<TContasPagarVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaContasPagar := ContasPagarController.Consultar(filtro);
  PopulaGrid<TContasPagarVo>(listaContasPagar);
end;

function TFTelaCadastroContasPagar.DoExcluir: boolean;
var
  ContasPagar : TContasPagarVo;
begin
  try
    try
      ContasPagar := TContasPagarVo.Create;
      ContasPagar.idContasPagar := CDSGrid.FieldByName('IDCONTASPAGAR')
        .AsInteger;
      ContasPagarController.Excluir(ContasPagar);
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
          ContasPagarController.Inserir(ContasPagar);
          result := true;
        end
        else if (StatusTela = stEditando) then
        begin
          ContasPagar := ContasPagarController.ConsultarPorId(CDSGrid.FieldByName('IDCONTASPAGAR')
            .AsInteger);
          ContasPagar := EditsToObject(ContasPagar);
          ContasPagarController.Alterar(ContasPagar);
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
    ContasPagar.VlValor := StrToFloat(EditValor.Text);
  if (LabeledEditComp.Text <> '') then
    ContasPagar.DsComplemento := LabeledEditComp.Text;
  if(LabeledEditHistorico.Text<>'')then
    ContasPagar.IdHistorico := StrToInt(LabeledEditHistorico.Text);

  if(LabeledEditPessoa.Text<>'')then
    ContasPagar.IdPessoa := StrToInt(LabeledEditPessoa.Text);

  if(LabeledEditConta.Text<>'')then
    ContasPagar.IdConta := StrToInt(LabeledEditConta.Text);

  if (LabeledEditContraP.Text<>'') then
    ContasPagar.IdContraPartida := StrToInt(LabeledEditContraP.Text);

  Result := ContasPagar;
end;

procedure TFTelaCadastroContasPagar.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TContasPagarVO;
  inherited;
end;

procedure TFTelaCadastroContasPagar.GridParaEdits;
var
  ContasPagar: TContasPagarVO;
begin
  inherited;
  ContasPagar := nil;

  if not CDSGrid.IsEmpty then
    ContasPagar := ContasPagarController.ConsultarPorId
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
    LabeledEditDsConta.Text := PlanoContasVO.dsConta;
    PlanoController.Free;
    LabeledEditPessoa.Enabled := false;
    BtnPessoa.Enabled := false;
  except
    raise Exception.Create('C�digo Inv�lido');
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
    raise Exception.Create('C�digo Inv�lido');
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
    BtnConta.Enabled := false;
  except
    raise Exception.Create('C�digo Inv�lido');
  end;
  end
  else
  begin
    labeledEditDsPessoa.Text := '';
    labeledEditConta.Enabled := true;
    BtnConta.Enabled := true;
  end;
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

end.
