unit UPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,UPaisVo, UController, Generics.Collections;

type
  TFTelaCadastroPais = class(TFTelaCadastro)
    LabelEditNome: TLabeledEdit;
    function MontaFiltro:string;
    procedure FormCreate(Sender: TObject);
    function DoSalvar:boolean;override;
    function ValidarTela:boolean;
    procedure DoConsultar;override;
    function DoExcluir: boolean;override;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure GridParaEdits; override;
    function EditsToObject(Pais:TPaisVo):TPaisVo;
  end;

var
  FTelaCadastroPais: TFTelaCadastroPais;
  PaisController: TController<TPaisVO>;

implementation

{$R *.dfm}


procedure TFTelaCadastroPais.DoConsultar;
var listaPais:TObjectList<TPaisVO>;
    filtro:string;
begin
  filtro:=MontaFiltro;
  listaPais:= PaisController.Consultar(filtro);
  PopulaGrid<TPaisVO>(listaPais);
end;

function TFTelaCadastroPais.DoExcluir: boolean;
var Pais:TPaisVO;
begin
  try
    try
      Pais := TPaisVO.Create;
      Pais.idPais := CDSGrid.FieldByName('IDPAIS').AsInteger;
      PaisController.Excluir(Pais);
      except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao excluir o registro: '+#13+#13+e.Message);
          Result:=false;
        end;
      end;
    finally
    end;
end;

function TFTelaCadastroPais.DoSalvar: boolean;
var Pais:TPaisVO;
begin
  if(ValidarTela)then
  begin
    try
      try
          if(StatusTela=stInserindo)then
          begin
            Pais:=EditsToObject(TPaisVO.Create);
            PaisController.Inserir(Pais);
            Result:=true;
          end
          else if(StatusTela=stEditando)then
          begin
            Pais:=PaisController.ConsultarPorId(CDSGrid.FieldByName('IDPAIS').AsInteger);
            Pais:=EditsToObject(Pais);
            PaisController.Alterar(Pais);
            Result:=true;
          end;
        except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro ao salvar o registro: '+#13+#13+e.Message);
          Result:=false;
        end;
      end;
    finally
    end;
  end
  else
    Result:=false;
end;

function TFTelaCadastroPais.EditsToObject(Pais: TPaisVo): TPaisVo;
begin
  Pais.Nome:=LabelEditNome.Text;
  Result:=Pais;
end;

procedure TFTelaCadastroPais.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TPaisVo;
  inherited;
end;

procedure TFTelaCadastroPais.GridParaEdits;
var Pais:TPaisVO;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    Pais := PaisController.ConsultarPorId(CDSGrid.FieldByName('IDPAIS').AsInteger);

  if Assigned(Pais) then
  begin
    LabelEditNome.Text:=Pais.Nome;
  end;
end;

function TFTelaCadastroPais.MontaFiltro: string;
begin
  result :='';
   if(editBusca.Text<>'')then
    result:='( NOME LIKE '+QuotedStr('%'+EditBusca.Text+'%')+' ) ';
end;

function TFTelaCadastroPais.ValidarTela: boolean;
begin
  Result:=true;
  if(labelEditNome.Text='')then
  begin
    ShowMessage('O campo nome é obrigatório!');
    Result:=false;
  end;
end;

end.
