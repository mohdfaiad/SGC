unit UProprietarioUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPessoa, UPessoasVO, UtelaCadastro,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, UProprietarioUnidadeVO, UProprietarioUnidadeController,
  UGenericVO, Generics.Collections, UPessoasController, biblioteca;


type
  TFTelaCadastroProprietario = class(TFTelaCadastro)
    LabelEditCodigo: TLabeledEdit;

    btnConsultaPessoa: TBitBtn;
    MaskEditDtInicio: TMaskEdit;
    LabelNome: TLabel;
    Label1: TLabel;
    procedure btnConsultaPessoaClick(Sender: TObject);
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoExcluir: boolean; override;
    procedure DoConsultar; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEditDtInicioExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    Idunidade : integer;
    procedure GridParaEdits; override;
    function EditsToObject(ProprietarioUndiade: TProprietarioUnidadeVo): TProprietarioUnidadeVo;


  end;

var
  FTelaCadastroProprietario: TFTelaCadastroProprietario;
  ControllerProprietarioUnidade :TProprietarioUnidadeController;



implementation

{$R *.dfm}
uses UUnidade, UUnidadeController, UUnidadeVO;
procedure TFTelaCadastroProprietario.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroProprietario.btnConsultaPessoaClick(Sender: TObject);
var
  FormPessoaConsulta: TFTelaCadastroPessoa;
begin
  FormPessoaConsulta := TFTelaCadastroPessoa.Create(nil);
  FormPessoaConsulta.FechaForm := true;
  FormPessoaConsulta.ShowModal;
  if (FormPessoaConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabelEditCodigo.Text := IntToStr(TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).idpessoa);
    LabelNome.Caption := TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).nome;
  end;
  FormPessoaConsulta.Release;
end;


procedure TFTelaCadastroProprietario.DoConsultar;
var
  listaProprietarioUnidade: TObjectList<TProprietarioUnidadeVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaProprietarioUnidade := ControllerProprietarioUnidade.Consultar(filtro, 'ORDER BY DTINICIO DESC');
  PopulaGrid<TProprietarioUnidadeVo>(listaProprietarioUnidade);
end;
function TFTelaCadastroProprietario.DoExcluir: boolean;
var
  ProprietarioUnidade: TProprietarioUnidadeVo;
begin
  try
    try
      ProprietarioUnidade := TProprietarioUnidadeVo.Create;
      ProprietarioUnidade.idproprietarioUnidade := CDSGrid.FieldByName('IDPROPRIETARIOUNIDADE')
        .AsInteger;
      ControllerProprietarioUnidade.Excluir(ProprietarioUnidade);
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

function TFTelaCadastroProprietario.DoSalvar: boolean;
var
  ProprietarioUnidade: TProprietarioUnidadeVo;
begin
    ProprietarioUnidade:=EditsToObject(TProprietarioUnidadeVo.Create);
    try
      Try
        ProprietarioUnidade.ValidarCamposObrigatorios();
          if (StatusTela = stInserindo) then
          begin
            ProprietarioUnidade.idUnidade := idunidade;
            ControllerProprietarioUnidade.Inserir(ProprietarioUnidade);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            ProprietarioUnidade := ControllerProprietarioUnidade.ConsultarPorId(CDSGrid.FieldByName('IDPROPRIETARIOUNIDADE')
              .AsInteger);
            ProprietarioUnidade := EditsToObject(ProprietarioUnidade);
            ControllerProprietarioUnidade.Alterar(ProprietarioUnidade);
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

function TFTelaCadastroProprietario.EditsToObject(  ProprietarioUndiade: TProprietarioUnidadeVo): TProprietarioUnidadeVo;
var
  FormConsultaUnidade : TFTelaCadastroUnidade;

begin
  if(LabelEditCodigo.Text<>'')then
    ProprietarioUndiade.idPessoa := StrToInt(LabelEditCodigo.text);
  if(MaskEditDtInicio.Text<> '  /  /    ' )then
   ProprietarioUndiade.DtInicio := StrToDateTime(MaskEditDtInicio.Text);
  result := ProprietarioUndiade;

end;

procedure TFTelaCadastroProprietario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerProprietarioUnidade);
end;

procedure TFTelaCadastroProprietario.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TProprietarioUnidadeVo;
  ControllerProprietarioUnidade := TProprietarioUnidadeController.Create;
  inherited;

end;

procedure TFTelaCadastroProprietario.GridParaEdits;
var
  ProprietarioUnidade: TProprietarioUnidadeVo;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    ProprietarioUnidade := ControllerProprietarioUnidade.ConsultarPorId
      (CDSGrid.FieldByName('IDPROPRIETARIOUNIDADE').AsInteger);

  if Assigned(ProprietarioUnidade) then
  begin
    LabelEditCodigo.Text := IntToStr(ProprietarioUnidade.idPessoa);
    LabelNome.Caption := ProprietarioUnidade.PessoaVo.nome;
    MaskEditDtInicio.Text := datetostr(ProprietarioUnidade.DtInicio);
  end;
end;

procedure TFTelaCadastroProprietario.MaskEditDtInicioExit(Sender: TObject);
begin
    EventoValidaData(sender);
end;

function TFTelaCadastroProprietario.MontaFiltro: string;
begin
 Result := ' (IDUNIDADE = '+inttostr(Idunidade)+')';

 if (editBusca.Text <> '') then
     Result:= result+ ' AND Upper(Nome) like '+QuotedStr('%'+Uppercase(EditBusca.Text)+'%')
end;
end.
