unit UPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UPaisVo, UController, Generics.Collections, UPaisController;

type
  TFTelaCadastroPais = class(TFTelaCadastro)
    LabelEditNome: TLabeledEdit;
    GroupBox2: TGroupBox;
    RadioButtonNome: TRadioButton;
    function MontaFiltro: string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar: boolean; override;
    procedure DoConsultar; override;
    function DoExcluir: boolean; override;
    procedure CarregaObjetoSelecionado; override;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Pais: TPaisVo): TPaisVo;
  end;

var
  FTelaCadastroPais: TFTelaCadastroPais;
  ControllerPais: TPaisController;

implementation

{$R *.dfm}

procedure TFTelaCadastroPais.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  LabelEditNome.SetFocus;
end;

procedure TFTelaCadastroPais.CarregaObjetoSelecionado;
begin
  if not CDSGrid.IsEmpty then
  begin
    ObjetoRetornoVO := TPaisVo.Create;
    TPaisVo(ObjetoRetornoVO).idPais := CDSGrid.FieldByName('IDPAIS').AsInteger;
    TPaisVo(ObjetoRetornoVO).NomePais :=
      CDSGrid.FieldByName('NOMEPAIS').AsString;
  end;

end;

procedure TFTelaCadastroPais.DoConsultar;
var
  listaPais: TObjectList<TPaisVo>;
  filtro: string;
begin
  filtro := MontaFiltro;
  listaPais := ControllerPais.Consultar(filtro);
  PopulaGrid<TPaisVo>(listaPais);
end;

function TFTelaCadastroPais.DoExcluir: boolean;
var
  Pais: TPaisVo;
begin
  try
    try
      Pais := TPaisVo.Create;
      Pais.idPais := CDSGrid.FieldByName('IDPAIS').AsInteger;
      ControllerPais.Excluir(Pais);
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

function TFTelaCadastroPais.DoSalvar: boolean;
var
  Pais: TPaisVo;
begin
   Pais:=EditsToObject(TPaisVo.Create);
    try
      try
        if (Pais.ValidarCamposObrigatorios()) then
        begin
          if (StatusTela = stInserindo) then
          begin
            ControllerPais.Inserir(Pais);
            Result := true;
          end
          else if (StatusTela = stEditando) then
          begin
            Pais := ControllerPais.ConsultarPorId(CDSGrid.FieldByName('IDPAIS')
              .AsInteger);
            Pais := EditsToObject(Pais);
            ControllerPais.Alterar(Pais);
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

function TFTelaCadastroPais.EditsToObject(Pais: TPaisVo): TPaisVo;
begin
  Pais.NomePais := LabelEditNome.Text;
  Result := Pais;
end;

procedure TFTelaCadastroPais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(ControllerPais);
end;

procedure TFTelaCadastroPais.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPaisVo;
  RadioButtonNome.Checked := true;
  ControllerPais := TPaisCOntroller.Create;
  inherited;
end;

procedure TFTelaCadastroPais.GridParaEdits;
var
  Pais: TPaisVo;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    Pais := ControllerPais.ConsultarPorId(CDSGrid.FieldByName('IDPAIS')
      .AsInteger);

  if Assigned(Pais) then
  begin
    LabelEditNome.Text := Pais.NomePais;
  end;
end;

function TFTelaCadastroPais.MontaFiltro: string;
begin
  Result := '';
  if (editBusca.Text <> '') then
    Result := '(UPPER(NOMEPAIS) LIKE ' +
      QuotedStr('%' + UpperCase(editBusca.Text) + '%') + ' ) ';
end;



end.
