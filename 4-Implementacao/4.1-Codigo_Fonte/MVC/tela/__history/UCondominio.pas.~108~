unit UCondominio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UCnaeVO, UCnae, UCidade, UEstado, UPais, UCidadeVO, UEstadoVO, UPaisVO,
  UNaturezaJuridicaVO, UNaturezaJuridica, UCondominioVO, Generics.Collections,
  UCondominioController, UContador, UResponsavel, UPrecoGas, UPrecoGasController, UPrecoGasVO, Biblioteca,
  UPlanoContasController, UPlanoContasVO;

type
  TFTelaCadastroCondominio = class(TFTelaCadastro)
    LabelEditNome: TLabeledEdit;
    MaskEditCNPJCPF: TMaskEdit;
    MaskEditCep: TMaskEdit;
    LabelEditRua: TLabeledEdit;
    LabelEditNumero: TLabeledEdit;
    LabelEditComplemento: TLabeledEdit;
    Cep: TLabel;
    LabelCnpj: TLabel;
    LabelEditBairro: TLabeledEdit;
    MaskEditTelefone: TMaskEdit;
    MaskEditTelefone2: TMaskEdit;
    Telefone_2: TLabel;
    Telefone_1: TLabel;
    LabelEditEmail: TLabeledEdit;
    LabelEditCnae: TMaskEdit;
    Label1: TLabel;
    LabelEditDescCnae: TLabeledEdit;
    btnConsultaCnae: TBitBtn;
    LabelEditCodCnae: TLabeledEdit;
    Label2: TLabel;
    LabelEditNatureza: TMaskEdit;
    LabelEditDescNatureza: TLabeledEdit;
    btnConsultaNatureza: TBitBtn;
    LabelEditCodNatureza: TLabeledEdit;
    GroupBox2: TGroupBox;
    RadioButtonCnpj: TRadioButton;
    RadioButtonNome: TRadioButton;
    LabeledEditDescCidade: TLabeledEdit;
    btnConsultaCidade: TBitBtn;
    LabeledEditDescEstado: TLabeledEdit;
    BtnConsultaEstado: TBitBtn;
    LabeledEditDescPais: TLabeledEdit;
    BtnConsultaPais: TBitBtn;
    LabeledEditCidade: TLabeledEdit;
    LabeledEditEstado: TLabeledEdit;
    LabeledEditPais: TLabeledEdit;
    LabeledEditMetragem: TLabeledEdit;
    LabeledEditInsMunicipal: TLabeledEdit;
    LabeledEditNomeFantasia: TLabeledEdit;
    LabeledEditRegimeTrib: TLabeledEdit;
    MaskEditDtInicioAtividade: TMaskEdit;
    Label3: TLabel;
    BtnContador: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Edit3: TEdit;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Juros: TEdit;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Multa: TEdit;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    DescConc: TEdit;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    DescObt: TEdit;
    BitBtn7: TBitBtn;
    Label8: TLabel;
    JurosRec: TEdit;
    BitBtn8: TBitBtn;
    Label9: TLabel;
    MultaRec: TEdit;
    BitBtn9: TBitBtn;
    Label10: TLabel;
    LeituraGas: TEdit;
    BitBtn10: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
//    function ValidarTela: boolean;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure btnConsultaCnaeClick(Sender: TObject);
    procedure btnConsultaNaturezaClick(Sender: TObject);
    procedure GridParaEdits; override;
    procedure btnConsultaCidadeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnContadorClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure MaskEditDtInicioAtividadeExit(Sender: TObject);
    procedure JurosExit(Sender: TObject);
    procedure MultaExit(Sender: TObject);
    procedure DescConcExit(Sender: TObject);
    procedure DescObtExit(Sender: TObject);
    procedure JurosRecExit(Sender: TObject);
    procedure MultaRecExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure JurosChange(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure LeituraGasExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function EditsToObject(Condominio: TCondominioVO): TCondominioVO;
    procedure SetStatusTela(const Value: TStatusTela); override;

  end;

var
  FTelaCadastroCondominio: TFTelaCadastroCondominio;
  ControllerCondominio: TCondominioController;

implementation

uses UPlanoCOntas;

{$R *.dfm}
{ TFTelaCadastroCondominio }

procedure TFTelaCadastroCondominio.BitBtn10Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      LeituraGas.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);
    end
    else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;
procedure TFTelaCadastroCondominio.BitBtn1Click(Sender: TObject);
var
  FormResponsavel: TFTelaCadastroResponsavel;
begin
  FormResponsavel := TFTelaCadastroResponsavel.Create(nil);
  FormResponsavel.FechaForm := true;
  FormResponsavel.idCondominio := CDSGrid.FieldByName('IDCONDOMINIO').AsInteger;
  FormResponsavel.ShowModal;
end;


procedure TFTelaCadastroCondominio.BitBtn3Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      Juros.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtn4Click(Sender: TObject);
var
  FormPrecoGas: TFTelaCadastroPrecoGas;
begin
  FormPrecoGas := TFTelaCadastroPrecoGas.Create(nil);
  FormPrecoGas.FechaForm := true;
  FormPrecoGas.ShowModal;
  if (FormPrecoGas.ObjetoRetornoVO <> nil) then
  begin
    edit1.Text := IntToStr(TPrecoGasVO(FormPrecoGas.ObjetoRetornoVO).idPrecoGas);
    Edit2.Text := TPrecoGasVO(FormPrecoGas.ObjetoRetornoVO).PessoaVo.nome;
  end;
  FormPrecoGas.Release;
end;
procedure TFTelaCadastroCondominio.BitBtn5Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
        Multa.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    Else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtn6Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
     DescConc.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    Else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtn7Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      DescObt.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    Else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtn8Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      JurosRec.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtn9Click(Sender: TObject);
var
  FormPlanoConsulta: TFTelaCadastroPlano;
begin
  FormPlanoConsulta := TFTelaCadastroPlano.Create(nil);
  FormPlanoConsulta.FechaForm := true;
  FormPlanoConsulta.ShowModal;
  if (FormPlanoConsulta.ObjetoRetornoVO <> nil) then
  begin
    if TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).flTipo <> 'S' then
    begin
      MultaRec.Text := IntToStr(TPlanoContasVO(FormPlanoConsulta.ObjetoRetornoVO).idPlanoContas);

    end
    else
      ShowMessage('Conta Sintética');
  end;
  FormPlanoConsulta.Release;
end;

procedure TFTelaCadastroCondominio.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
   PageControlEdit.ActivePage := DadosPrincipais;
   LabelEditNome.SetFocus;

end;

procedure TFTelaCadastroCondominio.SetStatusTela(const Value: TStatusTela);
begin
  FStatusTela := Value;
  BitBtnNovo.Enabled := True;
  BitBtnIncluirC.Enabled := True;
  BitBtnAltera.Enabled := True;
  BitBtnGrava.Enabled := True;
  BitBtnExclui.Enabled := True;
  BitBtnCancela.Enabled := false;

  PanelEdits.Enabled := True;
  Panel1.Enabled := True;
  case Value of
    stNavegandoGrid:
      begin
        PanelEdits.Enabled := false;
        Panel1.Enabled := false;
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
        Panel1.Enabled := true;
        BitBtnNovo.Enabled := false;
        BitBtnIncluirC.Enabled := false;
        BitBtnAltera.Enabled := false;
        BitBtnGrava.Enabled := True;
        BitBtnExclui.Enabled := false;
        BitBtnCancela.Enabled := True;
      end;
  end;

end;

procedure TFTelaCadastroCondominio.btnConsultaCidadeClick(Sender: TObject);
var
  FormCidadeConsulta: TTFTelaCadastroCidade;
begin
  FormCidadeConsulta := TTFTelaCadastroCidade.Create(nil);
  FormCidadeConsulta.FechaForm := true;
  FormCidadeConsulta.ShowModal;
  if (FormCidadeConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditCidade.Text := IntToStr(TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).idCidade);
    LabeledEditDescCidade.Text := TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).NomeCidade;
    LabeledEditEstado.Text:=IntToStr(TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).EstadoVO.idEstado);
    LabeledEditDescEstado.Text:=TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).EstadoVO.NomeEstado;
    LabeledEditPais.Text:=IntToStr(TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).PaisVO.idPais);
    LabeledEditDescPais.Text:=TCidadeVO(FormCidadeConsulta.ObjetoRetornoVO).PaisVO.NomePais;
  end;
  FormCidadeConsulta.Release;
end;

procedure TFTelaCadastroCondominio.btnConsultaCnaeClick(Sender: TObject);
var
  FormCnaeConsulta: TFTelaCadastroCnae;
begin
  FormCnaeConsulta := TFTelaCadastroCnae.Create(nil);
  FormCnaeConsulta.FechaForm := true;
  FormCnaeConsulta.ShowModal;
  if (FormCnaeConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabelEditCodCnae.Text :=
      IntToStr(TCnaeVO(FormCnaeConsulta.ObjetoRetornoVO).idCnae);
    LabelEditDescCnae.Text := TCnaeVO(FormCnaeConsulta.ObjetoRetornoVO)
      .descricao;
    LabelEditCnae.Text := TCnaeVO(FormCnaeConsulta.ObjetoRetornoVO).codigoCnae;
  end;
  FormCnaeConsulta.Release;
end;

procedure TFTelaCadastroCondominio.btnConsultaNaturezaClick(Sender: TObject);
var
  FormNaturezaConsulta: TFTelaCadastroNaturezaJuridica;
begin
  FormNaturezaConsulta := TFTelaCadastroNaturezaJuridica.Create(nil);
  FormNaturezaConsulta.FechaForm := true;
  FormNaturezaConsulta.ShowModal;
  if (FormNaturezaConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabelEditCodNatureza.Text :=
      IntToStr(TNaturezaJuridicaVO(FormNaturezaConsulta.ObjetoRetornoVO)
      .idNatureza);
    LabelEditDescNatureza.Text := TNaturezaJuridicaVO
      (FormNaturezaConsulta.ObjetoRetornoVO).descricao;
    LabelEditNatureza.Text := TNaturezaJuridicaVO
      (FormNaturezaConsulta.ObjetoRetornoVO).codigoNatureza;
  end;
  FormNaturezaConsulta.Release;

end;

procedure TFTelaCadastroCondominio.BtnContadorClick(Sender: TObject);
var
  FormContador: TFTelaCadastroContador;
begin
  FormContador := TFTelaCadastroContador.Create(nil);
  FormContador.FechaForm := true;
  FormContador.idCondominio := CDSGrid.FieldByName('IDCONDOMINIO').AsInteger;
  FormContador.ShowModal;
end;

procedure TFTelaCadastroCondominio.DescConcExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if DescConc.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(DescConc.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    DescConc.Text := '';
end;

procedure TFTelaCadastroCondominio.DescObtExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if DescObt.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(DescObt.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    DescObt.Text := '';
end;

procedure TFTelaCadastroCondominio.DoConsultar;
var
  listaCondominio: TObjectList<TCondominioVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaCondominio := ControllerCondominio.Consultar(filtro);
  PopulaGrid<TCondominioVO>(listaCondominio);
end;

function TFTelaCadastroCondominio.DoExcluir: boolean;
var
  Condominio: TCondominioVO;
begin
  try
    try
      Condominio := TCondominioVO.Create;
      Condominio.idCondominio := CDSGrid.FieldByName('IDCONDOMINIO').AsInteger;
      ControllerCondominio.Excluir(Condominio);
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

function TFTelaCadastroCondominio.DoSalvar: boolean;
var
  Condominio: TCondominioVO;
begin
  begin
    Condominio:=EditsToObject(TCondominioVO.Create);
    try
      try
        Condominio.ValidarCampos();
         if (StatusTela = stInserindo) then
         begin
            ControllerCondominio.Inserir(Condominio);
            Result := true;
         end
         else if (StatusTela = stEditando) then
           begin
          Condominio := ControllerCondominio.ConsultarPorId(CDSGrid.FieldByName('IDCONDOMINIO')
            .AsInteger);
          Condominio := EditsToObject(Condominio);
          ControllerCondominio.Alterar(Condominio);
          Result := true;
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


procedure TFTelaCadastroCondominio.Edit1Exit(Sender: TObject);
var
  PrecoGasController:TPrecoGasController;
  PrecoGasVO: TPrecoGasVO;
begin
  if Edit1.Text <> '' then
  begin
  try
    PrecoGasController := TPrecoGasController.Create;
    PrecoGasVO := PrecoGasController.ConsultarPorId(StrToInt(Edit1.Text));
    Edit1.Text := PrecoGasVO.nome;
    Edit1.Text := inttostr(PrecoGasVO.idPessoa);
    PrecoGasController.Free;
  except
    raise Exception.Create('Código Inválido');
    end;
  end
  else
  begin
    Edit1.Text := '';
    Edit2.Text := '';
  end;

end;

procedure TFTelaCadastroCondominio.JurosChange(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if Juros.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(Juros.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end
    else
      ShowMessage('Conta Sintética');
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    Juros.Text := '';
end;

procedure TFTelaCadastroCondominio.JurosExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if Juros.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(Juros.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end
    else
      ShowMessage('Conta Sintética');
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    Juros.Text := '';
end;

procedure TFTelaCadastroCondominio.JurosRecExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if JurosRec.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(JurosRec.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    JurosRec.Text := '';
end;

procedure TFTelaCadastroCondominio.LeituraGasExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if LeituraGas.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(LeituraGas.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    LeituraGas.Text := '';
end;
function TFTelaCadastroCondominio.EditsToObject(Condominio: TCondominioVO)
  : TCondominioVO;
begin
  Condominio.CnpjCpf := MaskEditCNPJCPF.Text;
  Condominio.Nome := LabelEditNome.Text;
  Condominio.Endereco := LabelEditRua.Text;
  Condominio.Bairro := LabelEditBairro.Text;
  Condominio.Cep := MaskEditCep.Text;
  Condominio.Numero := LabelEditNumero.Text;
  Condominio.Complemento := LabelEditComplemento.Text;
  Condominio.Email := LabelEditEmail.Text;
  Condominio.TelefoneI := MaskEditTelefone.Text;
  Condominio.TelefoneII := MaskEditTelefone2.Text;
  Condominio.Metragem := LabeledEditMetragem.Text;
  Condominio.regimeTributario := LabeledEditRegimeTrib.Text;
  Condominio.nomeFantasia := LabeledEditNomeFantasia.Text;
  if(maskeditdtinicioatividade.Text<>'  /  /    ')then
    Condominio.DtInicioAtividade := StrToDate(MaskEditDtInicioAtividade.Text)
  else
    condominio.DtInicioAtividade:=0;
  Condominio.inscricaoMunicipal := LabeledEditInsMunicipal.Text;
  if (LabelEditCodCnae.Text <> '') then
    Condominio.idCnae := strtoint(LabelEditCodCnae.Text);
  if (LabelEditCodNatureza.Text <> '') then
    Condominio.idNaturezaJuridica := strtoint(LabelEditCodNatureza.Text);
  if (LabeledEditCidade.Text <> '') then
    Condominio.IdCidade := strtoint(LabeledEditCidade.Text);
  if (LabeledEditEstado.Text<> '') then
    Condominio.idEstado := strtoint(LabeledEditEstado.Text);
  if (LabeledEditPais.Text<>'') then
    Condominio.idPais := strtoint(LabeledEditPais.Text);
  if Edit1.Text <> '' then
    Condominio.idPrecoGas := StrToInt(Edit1.Text)
  else
    Condominio.idPrecoGas := 0;
 // if Edit3.Text <> '' then
  //  Condominio.parametroDRE := Edit3.Text;

  if Juros.Text <> '' then
    Condominio.idCtjurosP := StrToInt(Juros.Text);
  if JurosRec.Text <> '' then
    Condominio.idCtjuros := StrToInt(JurosRec.Text);
  if Multa.Text <> '' then
    Condominio.idCtMultaP := StrToInt(Multa.Text);
  if MultaRec.Text <> '' then
    Condominio.idCtMulta := StrToInt(MultaRec.Text);
  if DescConc.Text <> '' then
    Condominio.idCtDesconto := StrToInt(DescConc.Text);
  if DescObt.Text <> '' then
    Condominio.idCtDescontoObt := StrToInt(DescObt.Text);
  if LeituraGas.Text <> '' then
    Condominio.idctLeituraGas := StrTOInt(LeituraGas.Text);


  Result := Condominio;

end;

procedure TFTelaCadastroCondominio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerCondominio);
end;

procedure TFTelaCadastroCondominio.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCondominioVO;
  RadioButtonNome.Checked := true;
  ControllerCondominio := TCondominioController.Create;
  inherited;
end;

procedure TFTelaCadastroCondominio.MaskEditDtInicioAtividadeExit(
  Sender: TObject);
begin
  EventoValidaData(sender);
end;

function TFTelaCadastroCondominio.MontaFiltro: string;
begin
  Result := '';
  if (RadioButtonCnpj.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result := '( UPPER(CNPJ) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else if (RadioButtonNome.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '( UPPER(NOME) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;



procedure TFTelaCadastroCondominio.MultaExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if Multa.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(Multa.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    Multa.Text := '';
end;

procedure TFTelaCadastroCondominio.MultaRecExit(Sender: TObject);
var
  PlanoController:TPlanoContasController;
  PlanoContasVO: TPlanoContasVO;
begin
  if MultaRec.Text <> '' then
  begin
  try
    PlanoController := TPlanoContasController.Create;
    PlanoContasVO := PlanoController.ConsultarPorId(StrToInt(MultaRec.Text));
    if PlanoContasVO.flTipo <> 'S' then
    begin

      PlanoController.Free;
    end;
  except
    raise Exception.Create('Código Inválido');
  end;
  end
  else
    MultaRec.Text := '';
end;

procedure TFTelaCadastroCondominio.GridParaEdits;
var
  Condominio: TCondominioVO;
begin
  inherited;

  Condominio := nil;
  if not CDSGrid.IsEmpty then
    Condominio := ControllerCondominio.ConsultarPorId(CDSGrid.FieldByName('IDCONDOMINIO')
      .AsInteger);

  if Condominio <> nil then
  begin
    LabelEditNome.Text := Condominio.Nome;
    LabelEditRua.Text := Condominio.Endereco;
    LabelEditBairro.Text := Condominio.Bairro;
    MaskEditCep.Text := Condominio.Cep;
    LabelEditNumero.Text := Condominio.Numero;
    LabelEditComplemento.Text := Condominio.Complemento;
    MaskEditCNPJCPF.Text := Condominio.CnpjCpf;
    LabelEditEmail.Text := Condominio.Email;
    MaskEditTelefone.Text := Condominio.TelefoneI;
    MaskEditTelefone2.Text := Condominio.TelefoneII;
    MaskEditDtInicioAtividade.Text := DateToStr(Condominio.DtInicioAtividade);
    if(MaskEditDtInicioAtividade.Text='30/12/1899')then
      MaskEditDtInicioAtividade.Text:='';
    LabeledEditRegimeTrib.Text := Condominio.regimeTributario;
    LabeledEditInsMunicipal.Text := Condominio.inscricaoMunicipal;
    LabeledEditNomeFantasia.Text := Condominio.nomeFantasia;
    LabeledEditMetragem.Text := Condominio.metragem;
   if (condominio.CnaeVO <> nil) then
   begin
    LabelEditCodCnae.Text := IntToStr(Condominio.CnaeVO.idCnae);
    LabelEditDescCnae.Text := Condominio.CnaeVO.descricao;
    LabelEditCnae.Text := Condominio.CnaeVO.codigoCnae;
   end;
   if (Condominio.NaturezaVO <> nil) then
   begin
     LabelEditCodNatureza.Text := IntToStr(Condominio.NaturezaVO.idNatureza);
     LabelEditDescNatureza.Text := condominio.NaturezaVO.descricao;
     LabelEditNatureza.Text := condominio.NaturezaVO.codigoNatureza;
   end;
   if (Condominio.CidadeVO <> nil) then
    begin
      LabeledEditCidade.Text := IntToStr(Condominio.CidadeVO.idCidade);
      LabeledEditDescCidade.Text := Condominio.CidadeVO.NomeCidade;
    end;
    if (Condominio.EstadoVO <> nil) then
    begin
      LabeledEditEstado.Text := IntToStr(Condominio.CidadeVO.EstadoVO.idEstado);
      LabeledEditDescEstado.Text := Condominio.CidadeVO.EstadoVO.NomeEstado;
    end;
     if (Condominio.PaisVO <> nil) then
    begin
      LabeledEditPais.Text := IntToStr(Condominio.CidadeVO.PaisVO.idPais);
      LabeledEditDescPais.Text := Condominio.CidadeVO.PaisVO.NomePais;
    end;
    if Condominio.PrecoGasVo <> nil  then
    begin
      Edit1.Text := IntToStr(Condominio.PrecoGasVo.idPrecoGas);
      Edit2.Text := Condominio.PrecoGasVo.PessoaVo.nome;
    end;
  // if Condominio.parametroDRE <> '' then
    //  Edit3.Text := Condominio.parametroDRE;

   if Condominio.idCtJurosP <> 0 then
   begin
      Juros.Text := IntToStr(COndominio.idCtjurosP);
   //   Edit5.Text := Condominio.PlanoVO.dsConta;
   end;

   if Condominio.idCtJuros <> 0 then
      JurosRec.Text := IntToStr(COndominio.idCtjuros);
   if Condominio.idCtMultaP <> 0 then
      Multa.Text := IntToStr(COndominio.idCtMultaP);
   if Condominio.idCtMulta <> 0 then
      MultaRec.Text := IntToStr(COndominio.idCtMulta);
   if Condominio.idCtDesconto <> 0 then
      DescConc.Text := IntToStr(COndominio.idCtDesconto);
   if Condominio.idCtDescontoObt <> 0 then
      DescObt.Text := IntToStr(COndominio.idCtDescontoObt);
   if COndominio.idctLeituraGas <> 0 then
      LeituraGas.Text := IntTOStr(Condominio.idctLeituraGas);

  end;
end;
end.
