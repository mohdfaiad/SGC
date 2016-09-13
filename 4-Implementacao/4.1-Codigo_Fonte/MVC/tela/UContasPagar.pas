unit UContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, UContasPagarVO,
  UContasPagarController, Generics.Collections, UEmpresaTrab, UPessoa, UPessoasVO,
  UPlanoContas, UPlanoContasVO;

type
  TFTelaCadastroContasPagar = class(TFTelaCadastro)
    GroupBox2: TGroupBox;
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
    LabeledEditDsConta: TLabeledEdit;
    LabeledEditContraP: TLabeledEdit;
    LabeledEditDsContra: TLabeledEdit;
    LabeledEditHistorico: TLabeledEdit;
    LabeledEditDsHist: TLabeledEdit;
    EditValor: TEdit;
    Label4: TLabel;
    LabeledEditComp: TLabeledEdit;
    BtnConta: TSpeedButton;
    BtnContra: TSpeedButton;
    BtnHistorico: TSpeedButton;
    LabeledEditPessoa: TLabeledEdit;
    LabeledEditdsPessoa: TLabeledEdit;
    BtnPessoa: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    function DoSalvar: boolean; override;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;

    function MontaFiltro: string;
    procedure BtnPessoaClick(Sender: TObject);
    procedure BtnContaClick(Sender: TObject);
    procedure BtnContraClick(Sender: TObject);
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
  ContasPagar : TContasPagarVo;
begin
  begin
    ContasPagar:=EditsToObject(TContasPagarVo.Create);
    try
      try
        if (ContasPagar.ValidarCamposObrigatorios()) then
        begin
           if (StatusTela = stInserindo) then
           begin
              ContasPagar.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ContasPagarController.Inserir(ContasPagar);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            ContasPagar := ContasPagarController.ConsultarPorId(CDSGrid.FieldByName('IDCONTASPAGAR')
              .AsInteger);
            ContasPagar := EditsToObject(ContasPagar);
            ContasPagarController.Alterar(ContasPagar);
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

  {ContasPagar.DtCompetencia := StrToDateTime(MaskEditComp.Text);
  ContasPagar.DtEmissao := StrToDateTime(MaskEditEmissao.Text);
  ContasPagar.DtVencimento := StrToDateTime(MaskEditVenc.Text);}

  ContasPagar.NrDocumento := LabeledEditDoc.Text;
  ContasPagar.VlValor := StrToFloat(EditValor.Text);
  ContasPagar.DsComplemento := LabeledEditComp.Text;
  ContasPagar.IdContraPartida := StrToInt(LabeledEditContraP.Text);

  if(LabeledEditHistorico.Text<>'')then
    ContasPagar.IdHistorico := StrToInt(LabeledEditHistorico.Text);

  if(LabeledEditPessoa.Text<>'')then
    ContasPagar.IdPessoa := StrToInt(LabeledEditPessoa.Text);
  if(LabeledEditConta.Text<>'')then
    ContasPagar.IdConta := StrToInt(LabeledEditConta.Text);
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
    LabeledEditPessoa.Text := IntToStr(ContasPagar.PessoaVo.idPessoa);
    LabeledEditDsPessoa.Text := ContasPagar.PessoaVO.nome;
    LabeledEditConta.Text := IntToStr(ContasPagar.PlanoContasVO.idConta);
    LabeledEditDsConta.Text := ContasPagar.PlanoContasVO.dsConta;
    LabeledEditContraP.Text := IntToStr(ContasPagar.PlanoContasVO.idConta);
    LabeledEditDsContra.Text := ContasPagar.PlanoContasVO.dsConta;
 //   LabeledEditHistorico.Text := IntToStr(ContasPagar.HistoricoVO.idHistorico);
 //   LabeledEditDsHist.Text :=  ContasPagar.HistoricoVO.descricao;
    EditValor.Text := FloatToStr(ContasPagar.VlValor);
    LabeledEditComp.Text := ContasPagar.DsComplemento;
  end;
end;

function TFTelaCadastroContasPagar.MontaFiltro: string;
begin
  Result :='';
end;

end.
