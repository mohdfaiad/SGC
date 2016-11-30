unit UUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, UUnidadeVO, UGenericVO,
  Generics.Collections, UUnidadeController, UPessoa, UPessoasController, UPessoasVO,
  UProprietarioUnidade, UProprietarioUnidadeVO, UInquilinoUnidade, UInquilinoUnidadeVO,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompEdit, Biblioteca,
  IWDBStdCtrls;

type
  TFTelaCadastroUnidade = class(TFTelaCadastro)
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    LabelEditNumero: TLabeledEdit;
    LabeledEditDescricao: TLabeledEdit;
    EditAreaTotal: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    EditFracaoIdeal: TEdit;
    Label1: TLabel;
    EditQtdGas: TEdit;
    EditObservacao: TRichEdit;
    Label5: TLabel;
    BtnProprietario: TBitBtn;
    BtnInquilino: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure GridParaEdits; override;
    procedure BtnProprietarioClick(Sender: TObject);
    procedure BtnInquilinoClick(Sender: TObject);
    procedure BitBtnCancelaClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure BitBtnAlteraClick(Sender: TObject);
    procedure CarregaObjetoSelecionado; override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditAreaTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EditFracaoIdealKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
  public
    { Public declarations }
    CodigoUnidade : integer;
    function EditsToObject(Unidade: TUnidadeVO): TUnidadeVO;


  end;

var
  FTelaCadastroUnidade: TFTelaCadastroUnidade;
  ControllerUnidade: TUnidadeController;
 // FormPessoaConsulta : TFTelaCadastroPessoa;
// PessoaController : TPessoasController;

implementation

{$R *.dfm}

uses UEmpresaTrab;

{ TFTelaCadastroUnidade }



procedure TFTelaCadastroUnidade.BitBtnAlteraClick(Sender: TObject);
begin
  inherited;
  if (StatusTela = TStatusTela.stNavegandoGrid) then
  begin
    BtnProprietario.Enabled := true;
    BtnInquilino.Enabled := true;
  end
  else
    begin
    BtnProprietario.Enabled := false;
    BtnInquilino.Enabled := false;
    end;
end;

procedure TFTelaCadastroUnidade.BitBtnCancelaClick(Sender: TObject);
begin
  inherited;
  if (StatusTela = TStatusTela.stNavegandoGrid) then
  begin
    BtnProprietario.Enabled := true;
    BtnInquilino.Enabled := true;
  end
  else
    begin
    BtnProprietario.Enabled := false;
    BtnInquilino.Enabled := false;
    end;
end;

procedure TFTelaCadastroUnidade.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  EditObservacao.Clear;
  LabelEditNumero.SetFocus;
  if (StatusTela = TStatusTela.stNavegandoGrid) then
  begin
    BtnProprietario.Enabled := true;
    BtnInquilino.Enabled := true;
  end
  else
    begin
    BtnProprietario.Enabled := false;
    BtnInquilino.Enabled := false;
    end;
end;

procedure TFTelaCadastroUnidade.BtnInquilinoClick(Sender: TObject);
var
  FormInquilino: TFTelaCadastroInquilino;
begin
  FormInquilino := TFTelaCadastroInquilino.Create(nil);
  FormInquilino.FechaForm := true;
  FormInquilino.idunidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
  FormInquilino.ShowModal;
end;

procedure TFTelaCadastroUnidade.BtnProprietarioClick(Sender: TObject);
var
  FormProprietario: TFTelaCadastroProprietario;
begin
  FormProprietario := TFTelaCadastroProprietario.Create(nil);
  FormProprietario.FechaForm := true;
  FormProprietario.idunidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
  FormProprietario.ShowModal;
end;

procedure TFTelaCadastroUnidade.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := ControllerUnidade.ConsultarPorId(CDSGRID.FieldByName('IDUNIDADE').AsInteger);
  end;
end;

procedure TFTelaCadastroUnidade.DoConsultar;
var
  listaUnidade: TObjectList<TUnidadeVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaUnidade := ControllerUnidade.Consultar(filtro);
  PopulaGrid<TUnidadeVO>(listaUnidade);
end;


function TFTelaCadastroUnidade.DoExcluir: boolean;
var
  Unidade: TUnidadeVO;
begin
  try
    try
      Unidade := TUnidadeVO.Create;
      Unidade.idUnidade := CDSGrid.FieldByName('IDUNIDADE').AsInteger;
      ControllerUnidade.Excluir(Unidade);
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

function TFTelaCadastroUnidade.DoSalvar: boolean;
var
  Unidade: TUnidadeVO;
begin
  begin
    Unidade:=EditsToObject(TUnidadeVO.Create);

    try
      try
       Unidade.ValidarCampos();
        if (StatusTela = stInserindo) then
           begin
              Unidade.idcondominio := FormEmpresaTrab.CodigoEmpLogada;
              ControllerUnidade.Inserir(Unidade);
              Result := true;
              CodigoUnidade := Unidade.idUnidade;
           end
            else if (StatusTela = stEditando) then
            begin
              Unidade := ControllerUnidade.ConsultarPorId(CDSGrid.FieldByName('IDUNIDADE')
              .AsInteger);
              Unidade := EditsToObject(Unidade);
              ControllerUnidade.Alterar(Unidade);
              Result := true;
              CodigoUnidade := Unidade.idUnidade;
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

procedure TFTelaCadastroUnidade.EditAreaTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

procedure TFTelaCadastroUnidade.EditFracaoIdealKeyPress(Sender: TObject;
  var Key: Char);
begin
  EventoFormataCurrency(Sender,key);
end;

function TFTelaCadastroUnidade.EditsToObject(Unidade: TUnidadeVO): TUnidadeVO;
begin
  if(LabelEditNumero.Text<>'')then
    Unidade.numero := StrToInt(LabelEditNumero.Text);
  if(EditQtdGas.Text<>'')then
    Unidade.vlgasinicial := StrToFloat(EditQtdGas.Text);
  if(editareatotal.Text<>'')then
    Unidade.vlareatotal := StrToFloat(EditAreaTotal.Text);
  if(EditFracaoIdeal.Text<>'')then
    Unidade.vlfracaoideal := StrToFloat(EditFracaoIdeal.Text);
  if (LabeledEditDescricao.Text <> '') then
    Unidade.DsUnidade := LabeledEditDescricao.Text;

  Unidade.observacao := EditObservacao.Text;
  Result := Unidade;

end;



procedure TFTelaCadastroUnidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerUnidade);

end;

procedure TFTelaCadastroUnidade.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TUnidadeVO;
  RadioButton1.Checked := true;
  ControllerUnidade := TUnidadeController.Create;
  CodigoUnidade := 0;

  inherited;
end;

procedure TFTelaCadastroUnidade.GridParaEdits;
var
  Unidade: TUnidadeVO;
begin
  inherited;

  Unidade := nil;
  if not CDSGrid.IsEmpty then
    Unidade := ControllerUnidade.ConsultarPorId(CDSGrid.FieldByName('IDUNIDADE')
      .AsInteger);

  if Unidade <> nil then
  begin

    LabelEditNumero.Text := IntToStr(Unidade.Numero);
    EditQtdGas.Text := FloatToStr(Unidade.vlgasinicial);
    EditAreaTotal.Text := FloatToStr(Unidade.vlareatotal);
    EditFracaoIdeal.Text := FloatToStr(Unidade.vlfracaoideal);
    EditObservacao.Text := Unidade.observacao;
    LabeledEditDescricao.Text := Unidade.DsUnidade;
  end;
end;

function TFTelaCadastroUnidade.MontaFiltro: string;
begin
  Result := ' ( IDCONDOMINIO = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+ ' ) ';
  {if (RadioButton2.Checked = true) then
  begin
    if (editBusca.Text <> '') then
    begin
      Result :=  '  ( UPPER(NUMERO) LIKE '       +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
    end;
  end
  else} if (RadioButton1.Checked = true) then
  begin
    if (editBusca.Text <> '') then
      Result := '  ( UPPER(DSUNIDADE) LIKE ' +
        QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
  end;
end;


procedure TFTelaCadastroUnidade.PageControlChange(Sender: TObject);
begin
  inherited;
  if (PageControl.ActivePage = DadosCadastrais) then
  begin
    BtnProprietario.Enabled := true;
    BtnInquilino.Enabled := true;
  end
  else
    begin
    BtnProprietario.Enabled := false ;
    BtnInquilino.Enabled :=false;
    end;
end;


end.
