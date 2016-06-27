unit UCondominio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UCnaeVO, UCnae, UCidade, UEstado, UPais, UCidadeVO, UEstadoVO, UPaisVO,
  UNaturezaJuridicaVO, UNaturezaJuridica, UCondominioVO, Generics.Collections,
  UCondominioController;

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

  private
    { Private declarations }
  public
    { Public declarations }
    function EditsToObject(Condominio: TCondominioVO): TCondominioVO;
  end;

var
  FTelaCadastroCondominio: TFTelaCadastroCondominio;
  CondominioController: TCondominioController;

implementation

{$R *.dfm}
{ TFTelaCadastroCondominio }

procedure TFTelaCadastroCondominio.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditNome.SetFocus;
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

procedure TFTelaCadastroCondominio.DoConsultar;
var
  listaCondominio: TObjectList<TCondominioVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaCondominio := CondominioController.Consultar(filtro);
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
      CondominioController.Excluir(Condominio);
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
            CondominioController.Inserir(Condominio);
            Result := true;
         end
         else if (StatusTela = stEditando) then
           begin
          Condominio := CondominioController.ConsultarPorId(CDSGrid.FieldByName('IDCONDOMINIO')
            .AsInteger);
          Condominio := EditsToObject(Condominio);
          CondominioController.Alterar(Condominio);
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
  Result := Condominio;

end;

procedure TFTelaCadastroCondominio.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCondominioVO;
  RadioButtonNome.Checked := true;
  inherited;
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

procedure TFTelaCadastroCondominio.GridParaEdits;
var
  Condominio: TCondominioVO;
begin
  inherited;

  Condominio := nil;
  if not CDSGrid.IsEmpty then
    Condominio := CondominioController.ConsultarPorId(CDSGrid.FieldByName('IDCONDOMINIO')
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
   if (Condominio.idCidade > 0) then
    begin
      LabeledEditCidade.Text := IntToStr(Condominio.CidadeVO.idCidade);
      LabeledEditDescCidade.Text := Condominio.CidadeVO.NomeCidade;
    end;
    if (Condominio.idEstado > 0) then
    begin
      LabeledEditEstado.Text := IntToStr(Condominio.CidadeVO.EstadoVO.idEstado);
      LabeledEditDescEstado.Text := Condominio.CidadeVO.EstadoVO.NomeEstado;
    end;
     if (Condominio.idPais > 0) then
    begin
      LabeledEditPais.Text := IntToStr(Condominio.CidadeVO.PaisVO.idPais);
      LabeledEditDescPais.Text := Condominio.CidadeVO.PaisVO.NomePais;
    end;
  end;
end;
end.
