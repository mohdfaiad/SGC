unit UCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UCidadeVo, UCidadeController, UController,
  UEstado, UEstadoVO, UPaisVO, Generics.Collections, UPais;

type
  TTFTelaCadastroCidade = class(TFTelaCadastro)
    LabelEditNome: TLabeledEdit;
    LabelEditNomeEstado: TLabeledEdit;
    LabelEditEstado: TLabeledEdit;
    btnConsultaEstado: TBitBtn;
    LabelEditNomePais: TLabeledEdit;
    btnConsultaPais: TBitBtn;
    LabelEditPais: TLabeledEdit;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure btnConsultaEstadoClick(Sender: TObject);
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    function DoSalvar: boolean; override;
    procedure FormCreate(Sender: TObject);
    function MontaFiltro: string;
    procedure btnConsultaPaisClick(Sender: TObject);
    procedure CarregaObjetoSelecionado; override;

  private
    { Private declarations }
  public
    { Public declarations }
    function EditsToObject(Cidade: TCidadeVO): TCidadeVO;
    procedure GridParaEdits; override;
  end;

var
  TFTelaCadastroCidade: TTFTelaCadastroCidade;
  CidadeController: TCidadeController;

implementation

{$R *.dfm}
{ TTFTelaCadastroCidade }

procedure TTFTelaCadastroCidade.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditNome.SetFocus;
end;

procedure TTFTelaCadastroCidade.btnConsultaEstadoClick(Sender: TObject);
var
  FormEstadoConsulta: TFTelaCadastroEstado;
begin
  FormEstadoConsulta := TFTelaCadastroEstado.Create(nil);
  FormEstadoConsulta.FechaForm := true;
  FormEstadoConsulta.ShowModal;
  if (FormEstadoConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabelEditEstado.Text :=
      IntToStr(TEstadoVO(FormEstadoConsulta.ObjetoRetornoVO).idEstado);
    LabelEditNomeEstado.Text := TEstadoVO(FormEstadoConsulta.ObjetoRetornoVO)
      .NomeEstado;
    LabelEditPais.Text := TEstadoVO(FormEstadoConsulta.ObjetoRetornoVO)
      .PaisVO.NomePais;
    LabelEditPais.Text := IntToStr(TEstadoVO(FormEstadoConsulta.ObjetoRetornoVO)
      .PaisVO.idPais);
  end;
  FormEstadoConsulta.Release;

end;

procedure TTFTelaCadastroCidade.btnConsultaPaisClick(Sender: TObject);
var
  FormPaisConsulta: TFTelaCadastroPais;
begin
  FormPaisConsulta := TFTelaCadastroPais.Create(nil);
  FormPaisConsulta.FechaForm := true;
  FormPaisConsulta.ShowModal;
  if (FormPaisConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabelEditPais.Text :=
      IntToStr(TPaisVO(FormPaisConsulta.ObjetoRetornoVO).idPais);
    LabelEditNomePais.Text := TPaisVO(FormPaisConsulta.ObjetoRetornoVO)
      .NomePais;
  end;
  FormPaisConsulta.Release;
end;

procedure TTFTelaCadastroCidade.CarregaObjetoSelecionado;
begin
  inherited;
  if (not CDSGrid.IsEmpty) then
  begin
    ObjetoRetornoVO := CidadeController.ConsultarPorId(CDSGRID.FieldByName('IDCIDADE').AsInteger);
  end;
end;

procedure TTFTelaCadastroCidade.DoConsultar;
var
  listaCidade: TObjectList<TCidadeVO>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaCidade := CidadeController.Consultar(filtro);
  PopulaGrid<TCidadeVO>(listaCidade);
end;

function TTFTelaCadastroCidade.DoExcluir: boolean;
var
  Cidade: TCidadeVO;
begin
  try
    try
      Cidade := TCidadeVO.Create;
      Cidade.idCidade := CDSGrid.FieldByName('IDCIDADE').AsInteger;
      CidadeController.Excluir(Cidade);
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

function TTFTelaCadastroCidade.DoSalvar: boolean;
var
  Cidade : TCidadeVO;
begin
 begin
   Cidade:=EditsToObject(TCidadeVO.Create);
    try
      try
        if (Cidade.ValidarCamposObrigatorios()) then
        begin
          if (StatusTela = stInserindo) then
          begin
            CidadeController.Inserir(Cidade);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            Cidade := CidadeController.ConsultarPorId(CDSGrid.FieldByName('IDCIDADE')
              .AsInteger);
            Cidade := EditsToObject(Cidade);
            CidadeController.Alterar(Cidade);
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

function TTFTelaCadastroCidade.EditsToObject(Cidade: TCidadeVO): TCidadeVO;
begin
  Cidade.NomeCidade := LabelEditNome.Text;

  if (LabelEditPais.Text <> '') then
    Cidade.idPais := strtoint(LabelEditPais.Text);
  if (LabelEditEstado.Text <> '') then
    Cidade.idEstado := strtoint(LabelEditEstado.Text);

  Result := Cidade;
end;

procedure TTFTelaCadastroCidade.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCidadeVO;
  inherited;
end;

procedure TTFTelaCadastroCidade.GridParaEdits;
var
  Cidade: TCidadeVO;
begin
  inherited;

  Cidade := nil;
  if not CDSGrid.IsEmpty then
    Cidade := CidadeController.ConsultarPorId(CDSGrid.FieldByName('IDCIDADE')
      .AsInteger);

  if Cidade <> nil then
  begin
    LabelEditNome.Text := Cidade.NomeCidade;
    if (Cidade.idEstado > 0) then
    begin
      LabelEditEstado.Text := IntToStr(Cidade.EstadoVO.idEstado);
      LabelEditNomeEstado.Text := Cidade.EstadoVO.NomeEstado;
      LabelEditPais.Text := Cidade.PaisVo.NomePais;
    end;
   { if (Cidade.idPais > 0) then
    begin
      LabelEditPais.Text := IntToStr(Cidade.PaisVO.idPais);
      LabelEditNomePais.Text := Cidade.PaisVO.NomePais;
    end;}

  end;
end;

function TTFTelaCadastroCidade.MontaFiltro: string;
begin
  Result := '';
  if (editBusca.Text <> '') then
    Result := '( NOME LIKE ' + QuotedStr('%' + editBusca.Text + '%') + ' ) ';
end;


end.
