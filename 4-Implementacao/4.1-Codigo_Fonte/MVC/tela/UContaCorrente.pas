unit UContaCorrente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, UContaCorrenteController, UContasReceberController,
  ULancamentoContabilController, UPlanoContasVO, uPlanoContasController,UEmpresaTrab,
  UContaCorrenteVO, UContasReceberVO, ULancamentoContabilVO, UUnidadeVO, UUnidadeController, Generics.Collections;

type
  TFTelaCadastroContaCorrente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    MaskEditDtInicio: TMaskEdit;
    Label1: TLabel;
    BitBtnGrava: TBitBtn;
    DBGrid2: TDBGrid;
    DSContaCorrente: TDataSource;
    CDContaCorrente: TClientDataSet;
    CDContaCorrenteIDUNIDADE: TIntegerField;
    CDContaCorrenteIDCONTAPLANO: TIntegerField;
    CDContaCorrenteDSUNIDADE: TStringField;
    MaskEdit1: TMaskEdit;
    DBGrid1: TDBGrid;
    DSLcto: TDataSource;
    CDLcto: TClientDataSet;
    CDLctoIDLCTO: TIntegerField;
    CDLctoIDCONTADEBITO: TIntegerField;
    CDLctoIDCONTACREDITO: TIntegerField;
    CDLctoDSCONTA: TStringField;
    CDLctoDSCONTACREDITO: TStringField;
    CDLctoVALOR: TCurrencyField;
    CDLctoIDHISTORICO: TIntegerField;
    CDLctoDTLCTO: TDateTimeField;
    CDLctoCOMPLEMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CDContaCorrenteAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTelaCadastroContaCorrente: TFTelaCadastroContaCorrente;
  ControllerContaCorrente : TContaCorrenteController;

implementation

{$R *.dfm}

procedure TFTelaCadastroContaCorrente.CDContaCorrenteAfterScroll(DataSet: TDataSet);
var
  lcto : TObjectList<TLancamentoContabilVO>;
  LctoController : TLancamentoContabilController;
  datei,datef:TDatetime;
  i: Integer;
begin
  if not(CDContaCorrente.IsEmpty)then
  begin
    try
          StrToDate(maskedit1.Text);
      datei:= strtodate('01'+'/'+Copy(maskedit1.Text,4,7));
      datef:= IncMonth(dateI,1);

      LctoController := TLancamentoCOntabilController.Create;
      lcto := LctoController.Consultar(' idcontadebito = ' + intToStr(CDContaCorrenteIDCONTAPLANO.AsInteger) +
       ' or idcontacredito = '+ intToStr(CDContaCorrenteIDCONTAPLANO.AsInteger) +
       ' and ( dtlcto >= ' +QuotedSTr(StringREplace(datetostr(datei),'/','.',[rfReplaceAll]))+
        '      and dtlcto < '+QuotedSTr(StringREplace(datetostr(datef),'/','.',[rfReplaceAll]))+ ' ) ');
      CDLcto.EmptyDataSet;
        for i := 0 to Lcto.Count-1 do
        begin
        CDLcto.Append;
        CDLctoIDLCTO.AsInteger := Lcto[i].idLcto;
        CDLctoDTLCTO.AsDateTime := Lcto[i].dtLcto;
        CDLctoIDCONTADEBITO.AsInteger := Lcto[i].idcontadebito;
        CDLctoDSCONTA.AsString := lCTO[i].DsContaDebito;
        CDLctoIDCONTACREDITO.AsInteger := lcto[i].idContaCredito;
        CDLctoDSCONTACREDITO.AsString := Lcto[i].DsContaCredito;
        CDLctoVALOR.AsCurrency := Lcto[i].VlValor;
        CDLctoIDHISTORICO.AsInteger := Lcto[i].idHistorico;
        CDLctoCOMPLEMENTO.AsString := Lcto[i].complemento;
        CDLcto.Post;

        end;
    except
    end;
  end;
//  CDContaCorrenteIDCONTAPLANO.AsString :='';
end;

procedure TFTelaCadastroContaCorrente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ControllerContaCorrente);
end;

procedure TFTelaCadastroContaCorrente.FormCreate(Sender: TObject);
  var
  Contas : TObjectList<TPlanoContasVO>;
  Unidade : TObjectList<TUnidadeVO>;
  PlanoContasController : TPlanoContasController;
  UnidadeController : TUnidadeController;
  i : integer;
  l: Integer;

begin
  ControllerContaCorrente := TContaCorrenteController.Create;
  unidadeController := TUnidadeController.Create;
  PlanoContasCOntroller := TPlanoContasController.Create;
  MaskEditDtInicio.Text := '  /  /    ';
  MaskEdit1.Text := '  /  /    ';
  Unidade := UnidadeController.Consultar('idcondominio = ' +  intToStr(FormEmpresaTrab.CodigoEmpLogada));
  Contas := PlanoContasController.Consultar('idcondominio = ' + intToStr(FormEmpresaTrab.CodigoEmpLogada));

  CDContaCorrente.EmptyDataSet;

  for i := 0 to Contas.Count - 1 do
  begin
    for l := 0 to Unidade.Count - 1 do
    begin
      if unidade[l].idUnidade = Contas[i].idUnidade then
      begin
        CDContaCorrente.Append;
        CDContaCorrenteIDUNIDADE.AsInteger := unidade[l].idUnidade;
        CDContaCorrenteDSUNIDADE.AsString := unidade[l].DsUnidade;
        CDContaCorrenteIDCONTAPLANO.AsInteger := Contas[i].idPlanoContas;
        CDContaCorrente.Post;
      end;
    end;
  end;
  PlanoContasController.Free;
  UnidadeController.Free;
end;
end.
