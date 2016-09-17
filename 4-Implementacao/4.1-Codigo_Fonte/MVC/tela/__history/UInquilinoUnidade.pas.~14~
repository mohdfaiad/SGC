unit UInquilinoUnidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,  UGenericVO, Generics.Collections,
  UInquilinoUnidadeController,  UPessoa, UPessoasVO,  UUnidadeVO, UPessoasController,
  UInquilinoUnidadeVO;

type
  TFTelaCadastroInquilino = class(TFTelaCadastro)
    LabelEditCodigo: TLabeledEdit;
    btnConsultaPessoa: TBitBtn;
    MaskEditDtInicio: TMaskEdit;
    Label1: TLabel;
    LabelNome: TLabel;

    procedure btnConsultaPessoaClick(Sender: TObject);
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function DoExcluir: boolean; override;
    procedure DoConsultar; override;
    procedure BitBtnNovoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Idunidade : integer;
    procedure GridParaEdits; override;
    function EditsToObject(InquilinoUnidade: TInquilinoUnidadeVO): TInquilinoUnidadeVO;
  end;
var
  FTelaCadastroInquilino: TFTelaCadastroInquilino;
  InquilinoUnidadeController :TInquilinoUnidadeController;

implementation

{$R *.dfm}
uses UUnidade;
{ TFTelaCadastroInquilino }

procedure TFTelaCadastroInquilino.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditCodigo.SetFocus;
end;

procedure TFTelaCadastroInquilino.btnConsultaPessoaClick(Sender: TObject);
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

procedure TFTelaCadastroInquilino.DoConsultar;
var
  listaInquilinoUnidade: TObjectList<TInquilinoUnidadeVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaInquilinoUnidade := InquilinoUnidadeController.Consultar(filtro);
  PopulaGrid<TInquilinoUnidadeVO>(listaInquilinoUnidade);
end;

function TFTelaCadastroInquilino.DoExcluir: boolean;
var
  InquilinoUnidade: TInquilinoUnidadeVO;
begin
  try
    try
      InquilinoUnidade := TInquilinoUnidadeVO.Create;
      InquilinoUnidade.idinquilino := CDSGrid.FieldByName('IDINQUILINO')
        .AsInteger;
      InquilinoUnidadeController.Excluir(InquilinoUnidade);
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


function TFTelaCadastroInquilino.DoSalvar: boolean;
var
  InquilinoUnidade: TInquilinoUnidadeVo;
begin
    InquilinoUnidade:=EditsToObject(TInquilinoUnidadeVo.Create);
    try
      try
       InquilinoUnidade.ValidarCampos();

          if (StatusTela = stInserindo) then
          begin
            InquilinoUnidade.idUnidade := idunidade;
            InquilinoUnidadeController.Inserir(InquilinoUnidade);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            InquilinoUnidade := InquilinoUnidadeController.ConsultarPorId(CDSGrid.FieldByName('IDINQUILINO')
              .AsInteger);
            InquilinoUnidade := EditsToObject(InquilinoUnidade);
            InquilinoUnidadeController.Alterar(InquilinoUnidade);
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


function TFTelaCadastroInquilino.EditsToObject(InquilinoUnidade: TInquilinoUnidadeVO): TInquilinoUnidadeVO;
var
  FormConsultaUnidade : TFTelaCadastroUnidade;

begin
  if(LabelEditCodigo.Text<>'')then
    InquilinoUnidade.idinquilino := StrToInt(LabelEditCodigo.text);

  InquilinoUnidade.IdUnidade := idunidade;

  if(MaskEditDtInicio.Text<> '  /  /    ' )then
    InquilinoUnidade.DtInicio := StrToDateTime(MaskEditDtInicio.Text);
  result := InquilinoUnidade;


end;

procedure TFTelaCadastroInquilino.FormCreate(Sender: TObject);
begin
    ClasseObjetoGridVO := TInquilinoUnidadeVo;
  inherited;
end;

procedure TFTelaCadastroInquilino.GridParaEdits;
var
  InquilinoUnidade: TInquilinoUnidadeVo;
  FormPessoaConsulta : TFTelaCadastroPessoa;
  pessoaController : TPessoasController;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    InquilinoUnidade := InquilinoUnidadeController.ConsultarPorId
      (CDSGrid.FieldByName('IDINQUILINO').AsInteger);

  if Assigned(InquilinoUnidade) then
  begin
    LabelEditCodigo.Text := IntToStr(InquilinoUnidade.idinquilino);
    LabelNome.Caption := InquilinoUnidade.PessoaVo.nome;
    MaskEditDtInicio.Text := DateTimeToStr(InquilinoUnidade.DtInicio);
  end;
end;

function TFTelaCadastroInquilino.MontaFiltro: string;
begin
 Result := ' (IDUNIDADE = '+inttostr(Idunidade)+')';
end;

end.
