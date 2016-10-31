unit UPrecoGas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UPrecoGasVO,
  Generics.Collections, UPrecoGasController,  UPessoa,  UPessoasVO, UPessoasController;

type
  TFTelaCadastroPrecoGas = class(TFTelaCadastro)
    MaskEditDtInicio: TMaskEdit;
    Label1: TLabel;
    EdtValor: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    LabeledEditPessoa: TEdit;
    LabeledEditNomePessoa: TEdit;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    function MontaFiltro: string;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure GridParaEdits; override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure LabeledEditPessoaExit(Sender: TObject);
    procedure CarregaObjetoSelecionado; override;
  private
    { Private declarations }
  public
    { Public declarations }
     function EditsToObject(PrecoGas: TPrecoGasVO): TPrecoGasVO;
  end;

var
  FTelaCadastroPrecoGas: TFTelaCadastroPrecoGas;
  ControllerPrecoGas : TPrecoGasController;

implementation

{$R *.dfm}

uses UEmpresaTrab;

{ TFTelaCadastro1 }



procedure TFTelaCadastroPrecoGas.BitBtn3Click(Sender: TObject);
var
  FormPessoaConsulta: TFTelaCadastroPessoa;
begin
  FormPessoaConsulta := TFTelaCadastroPessoa.Create(nil);
  FormPessoaConsulta.FechaForm := true;
  FormPessoaConsulta.ShowModal;
  if (FormPessoaConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditPessoa.Text := IntToStr(TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).idpessoa);
    LabeledEditNomePessoa.Text := TPessoasVO(FormPessoaConsulta.ObjetoRetornoVO).nome;
  end;
  FormPessoaConsulta.Release;
end;



procedure TFTelaCadastroPrecoGas.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  MaskEditDtInicio.SetFocus;
end;

procedure TFTelaCadastroPrecoGas.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := ControllerPrecoGas.ConsultarPorId(CDSGRID.FieldByName('IDPRECOGAS').AsInteger);
  end;
end;

procedure TFTelaCadastroPrecoGas.DoConsultar;
var
  listaPrecoGas: TObjectList<TPrecoGasVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaPrecoGas := ControllerPrecoGas.Consultar(filtro);
  PopulaGrid<TPrecoGasVo>(listaPrecoGas);
end;

function TFTelaCadastroPrecoGas.DoExcluir: boolean;
var
  PrecoGas : TPrecoGasVo;
begin
  try
    try
      PrecoGas := TPrecoGasVo.Create;
      PrecoGas.idPrecoGas := CDSGrid.FieldByName('IDPRECOGAS')
        .AsInteger;
      ControllerPrecoGas.Excluir(PrecoGas);
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


function TFTelaCadastroPrecoGas.DoSalvar: boolean;
var
  PrecoGas : TPrecoGasVo;
begin
  begin
    PrecoGas:=EditsToObject(TPrecoGasVo.Create);
    try
      try
        PrecoGas.ValidarCamposObrigatorios();
        if (StatusTela = stInserindo) then
           begin
              ControllerPrecoGas.Inserir(PrecoGas);
              Result := true;
           end
            else if (StatusTela = stEditando) then
             begin
            PrecoGas := ControllerPrecoGas.ConsultarPorId(CDSGrid.FieldByName('IDPRECOGAS')
              .AsInteger);
            PrecoGas := EditsToObject(PrecoGas);
            ControllerPrecoGas.Alterar(PrecoGas);
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

function TFTelaCadastroPrecoGas.EditsToObject(PrecoGas: TPrecoGasVO): TPrecoGasVO;
begin
  if EdtValor.Text <> '' then
    PrecoGas.vlGas := StrToFloat(EdtValor.Text);
  if MaskEditDtInicio.Text <> '' then
    PrecoGas.dtMesAno := StrToDateTime(MaskEditDtInicio.Text);
  if (LabeledEditPessoa.Text <> '') then
    PrecoGas.idPessoa := strtoint(LabeledEditPessoa.Text);

  Result := PrecoGas;
end;

procedure TFTelaCadastroPrecoGas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerPrecoGas);

end;

procedure TFTelaCadastroPrecoGas.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPrecoGasVO;
  ControllerPrecoGas := TPrecoGasController.Create;
  inherited;
end;

procedure TFTelaCadastroPrecoGas.GridParaEdits;
var
  PrecoGas: TPrecoGasVO;
begin
  inherited;
  if not CDSGrid.IsEmpty then
    PrecoGas := ControllerPrecoGas.ConsultarPorId
      (CDSGrid.FieldByName('IDPRECOGAS').AsInteger);

  if PrecoGas <> nil then
  begin
    if PrecoGas.PessoaVO <> nil then
    begin
      LabeledEditPessoa.Text := IntToStr(PrecoGas.PessoaVO.idPessoa);
      LabeledEditNomePessoa.Text := PrecoGas.PessoaVO.nome;
    end;
    EdtValor.Text := FloatToStr(PrecoGas.vlGas);
    MaskEditDtInicio.Text := DateTimeToStr(PrecoGas.dtMesAno);

  end;
end;

procedure TFTelaCadastroPrecoGas.LabeledEditPessoaExit(Sender: TObject);
var
  PessoaController:TPessoasController;
  PessoaVO: TPessoasVO;
begin
  if LabeledEditPessoa.Text <> '' then
  begin
  try
    PessoaController := TPessoasController.Create;
    PessoaVO := PessoaController.ConsultarPorId(StrToInt(LabeledEditPessoa.Text));
    labeledEditNomePessoa.Text := PessoaVO.nome;
    LabeledEditPessoa.Text := inttostr(PessoaVO.idPessoa);
    PessoaController.Free;
  except
    raise Exception.Create('C�digo Inv�lido');
    end;
  end;
end;

function TFTelaCadastroPrecoGas.MontaFiltro: string;
begin
    result := '';
end;

end.
