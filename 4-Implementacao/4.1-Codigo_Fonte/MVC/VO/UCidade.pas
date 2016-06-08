unit UCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,Generics.Collections,UController,UEstadoVO, UEstadoController;

type
  TFTelaCadastroEstado = class(TFTelaCadastro)
    LabelEditNome: TLabeledEdit;
    LabelEditNomePais: TLabeledEdit;
    btnConsultaEstado: TBitBtn;
    LabelEditPais: TLabeledEdit;
    procedure DoConsultar;override;
    function DoSalvar:boolean;override;
    function DoExcluir:boolean;override;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    function MontaFiltro:string;
    function ValidarTela:boolean;
    procedure btnConsultaEstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EditsToObject(Estado:TEstadoVO):TEstadoVO;
    procedure GridParaEdits; override;
  end;

var
  FTelaCadastroEstado: TFTelaCadastroEstado;

implementation
uses UPais, UPaisVO;
var
  //EstadoController: TController<TEstadoVO>;
   EstadoController: TEstadoController;

{$R *.dfm}

{ TFTelaCadastroEstado }

procedure TFTelaCadastroEstado.BitBtnNovoClick(Sender: TObject);
begin
  inherited;
  labelEditNome.SetFocus;
end;

procedure TFTelaCadastroEstado.btnConsultaEstadoClick(Sender: TObject);
var FormPaisConsulta : TFTelaCadastroPais;
begin
  FormPaisConsulta := TFTelaCadastroPais.Create(nil);
  FormPaisConsulta.FechaForm:=true;
  FormPaisConsulta.ShowModal;
  if(FormPaisConsulta.ObjetoRetornoVO<>nil)then
  begin
    LabelEditPais.Text := IntToStr(TPaisVO(FormPaisConsulta.ObjetoRetornoVO).idPais);
    LabelEditNomePais.Text := TPaisVO(FormPaisConsulta.ObjetoRetornoVO).NomePais;
  end;
  FormPaisConsulta.Release;
end;

procedure TFTelaCadastroEstado.DoConsultar;
var listaEstado:TObjectList<TEstadoVO>;
    filtro:string;
begin
  filtro:=MontaFiltro;
  listaEstado:= EstadoController.Consultar(filtro);
  PopulaGrid<TEstadoVO>(listaEstado);
end;

function TFTelaCadastroEstado.DoExcluir: boolean;
var Estado:TEstadoVO;
begin
  try
    try
      Estado := TEstadoVO.Create;
      Estado.idEstado := CDSGrid.FieldByName('IDESTADO').AsInteger;
      EstadoController.Excluir(Estado);
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

function TFTelaCadastroEstado.DoSalvar: boolean;
var Estado:TEstadoVO;
begin
  if(ValidarTela)then
  begin
    try
      try
          if(StatusTela=stInserindo)then
          begin
            Estado:=EditsToObject(TEstadoVO.Create);
            EstadoController.Inserir(Estado);
            Result:=true;
          end
          else if(StatusTela=stEditando)then
          begin
            Estado:=EstadoController.ConsultarPorId(CDSGrid.FieldByName('IDESTADO').AsInteger);
            Estado:=EditsToObject(Estado);
            EstadoController.Alterar(Estado);
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

function TFTelaCadastroEstado.EditsToObject(Estado:TEstadoVO): TEstadoVO;
begin
  Estado.NomeEstado:=LabelEditNome.Text;

  if(LabelEditPais.Text<>'')then
    Estado.idPais := strtoint(LabelEditPais.Text);
  Result:=Estado;
end;

procedure TFTelaCadastroEstado.FormCreate(Sender: TObject);
begin
  ClasseObjetoGridVO := TEstadoVO;
  //RadioButtonNome.Checked := true;
  inherited;
end;

procedure TFTelaCadastroEstado.GridParaEdits;
var Estado:TEstadoVO;
begin
  inherited;

  Estado:=nil;
  if not CDSGrid.IsEmpty then
    Estado := EstadoController.ConsultarPorId(CDSGrid.FieldByName('IDESTADO').AsInteger);

  if Estado<>nil then
  begin
    LabelEditNome.Text:=Estado.NomeEstado;
    if(Estado.idPais>0)then
    begin
      LabelEditPais.Text:=inttostr(Estado.PaisVO.idPais);
      LabelEditNomePais.Text:=Estado.PaisVO.nomePais;
    end;
  end;
end;

function TFTelaCadastroEstado.MontaFiltro: string;
begin
  result :='';
   if(editBusca.Text<>'')then
    result:='( NOME LIKE '+QuotedStr('%'+EditBusca.Text+'%')+' ) ';
end;

function TFTelaCadastroEstado.ValidarTela: boolean;
begin
  Result:=true;
  if(labelEditNome.Text='')then
  begin
    ShowMessage('O campo nome � obrigat�rio!');
    Result:=false;
  end;
end;

end.

