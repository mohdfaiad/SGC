unit UCnae;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, UCnaeVo, UController, Generics.Collections ;

type
  TFTelaCadastroCnae = class(TFTelaCadastro)
  LabelEditNome: TLabeledEdit;
  LabelEditDescricao: TLabeledEdit;
  function MontaFiltro:string;
  procedure FormCreate(Sender: TObject);
  function ValidarTela:boolean;
  function DoSalvar:boolean;override;
  function DoExcluir:boolean;override;
  procedure DoConsultar;override;

  private
    { Private declarations }
  public
    { Public declarations }
  procedure GridParaEdits; override;
  function EditsToObject(Cnae:TCnaeVo):TCnaeVo;
  end;

var
  FTelaCadastroCnae: TFTelaCadastroCnae;
  CnaeController: TController<TCnaeVO>;

implementation

{$R *.dfm}

{ TFTelaCadastroCnae }

procedure TFTelaCadastroCnae.DoConsultar;
var listaCnae:TObjectList<TCnaeVO>;
    filtro:string;
begin
  filtro:=MontaFiltro;
  listaCnae:= CnaeController.Consultar(filtro);
  PopulaGrid<TCnaeVO>(listaCnae);
end;

function TFTelaCadastroCnae.DoExcluir: boolean;
var Cnae:TCnaeVO;
begin
  try
    try
      Cnae := TCnaeVO.Create;
      Cnae.idCnae := CDSGrid.FieldByName('IDCNAE').AsInteger;
      CnaeController.Excluir(Cnae);
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

function TFTelaCadastroCnae.DoSalvar: boolean;
var Cnae:TCnaeVO;
begin
  if(ValidarTela)then
  begin
    try
      try
          if(StatusTela=stInserindo)then
          begin
            Cnae:=EditsToObject(TCnaeVO.Create);
            CnaeController.Inserir(Cnae);
            Result:=true;
          end
          else if(StatusTela=stEditando)then
          begin
            Cnae:=CnaeController.ConsultarPorId(CDSGrid.FieldByName('IDCNAE').AsInteger);
            Cnae:=EditsToObject(Cnae);
            CnaeController.Alterar(Cnae);
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

function TFTelaCadastroCnae.EditsToObject(Cnae: TCnaeVo): TCnaeVo;
begin
  Cnae.codigoCnae:=LabelEditNome.Text;
  Cnae.descricao:=LabelEditDescricao.Text;
  Result:=Cnae;
end;

procedure TFTelaCadastroCnae.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TCnaeVo;
  inherited;
end;

procedure TFTelaCadastroCnae.GridParaEdits;
var Cnae:TCnaeVO;
begin
  inherited;

  if not CDSGrid.IsEmpty then
    Cnae := CnaeController.ConsultarPorId(CDSGrid.FieldByName('IDCNAE').AsInteger);

  if Assigned(Cnae) then
  begin
    LabelEditNome.Text:=Cnae.codigoCnae;
    LabelEditDescricao.Text:=Cnae.codigoCnae;
  end;
end;

function TFTelaCadastroCnae.MontaFiltro: string;
begin
  result :='';
   if(editBusca.Text<>'')then
    result:='( UPPER(DESCRICAO) LIKE '+QuotedStr('%'+UpperCase(EditBusca.Text)+'%')+' ) ';
end;

function TFTelaCadastroCnae.ValidarTela: boolean;
begin
  Result:=true;
  if(labelEditNome.Text='') or (labelEditDescricao.Text='') then
  begin
    ShowMessage('O campo nome � obrigat�rio!');
    Result:=false;
  end;
end;

end.
