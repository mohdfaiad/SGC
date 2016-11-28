
unit URazao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, RDprint, ULancamentoContabilController,
  ULancamentoContabilVO,  Generics.Collections, UPlanoContasController, UPlanoContasVO, UEmpresaTrab, MaskUtils;

type
  TFTelaLivroRazao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DataInicial: TMaskEdit;
    DataFinal: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CDRazao: TClientDataSet;
    CDRazaoIDLCTO: TIntegerField;
    CDRazaoIDCONTADEBITO: TIntegerField;
    CDRazaoIDCONTACREDITO: TIntegerField;
    CDRazaoDSCONTADEBITO: TStringField;
    CDRazaoDSCONTACREDITO: TStringField;
    CDRazaoVALOR: TCurrencyField;
    CDRazaoIDHISTORICO: TIntegerField;
    CDRazaoDTLCTO: TDateTimeField;
    CDRazaoCOMPLEMENTO: TStringField;
    CDRazaoSALDO: TCurrencyField;
    CDRazaoDSCLASSIFICACAODEBITO: TStringField;
    CDRazaoDSCLASSIFICACAOCREDITO: TStringField;
    Label3: TLabel;
    ClaIni: TMaskEdit;
    Label4: TLabel;
    ClaFim: TMaskEdit;
    Label5: TLabel;
    Conta: TMaskEdit;
    Label8: TLabel;
    PaginaInicio: TEdit;
    RDprint1: TRDprint;
    CDPlano: TClientDataSet;
    CDPlanoCODIGO: TIntegerField;
    CDPlanoDESCRICAO: TStringField;
    CDPlanoCLASSIFICACAO: TStringField;
    CDPlanoTIPO: TStringField;
    CDPlanoPESSOA: TIntegerField;
    CDPlanoUNIDADE: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Lin: Integer;
    Saldo: String;
    UltimaPagina: Integer;
    ColunaInicial: Integer;
    VerPagina: String;
    Empresas: String;
    contapaginas: integer;
    paginainicial: integer;
  end;

var
  FTelaLivroRazao: TFTelaLivroRazao;
  Function PontosExcedentesMascaraPlano(s:string): string;
  function SomaLin(var Lin: Integer; RdPrint1: TRdPrint): Integer;

implementation

{$R *.dfm}

procedure TFTelaLivroRazao.BitBtn1Click(Sender: TObject);
var     Historico: String;
        DiaI,MesI,AnoI,Mes,Ano,Dia: Word;
        SaldoAnterior: currency;
        ContaAnterior: String;
        Cla1, Cla2, DataAnterior, tmp,EntSai : String;
        c: integer;
        LctoController : TLancamentoContabilController;
        Lcto : TObjectList<TLancamentoContabilVO>;
        Plano : TObjectList<TPlanoContasVO>;
        PlanoController : TPlanoContasController;
        P, i: Integer;
        existeConta:boolean;
        descAux,contaAux,claAux:String;
        valorAux,saldo, totaldebito,totalcredito:double;
        t: Integer;
begin

        contapaginas:=0;
        paginainicial:=StrToInt(PaginaInicio.text);
        Lin:= 0;
        Historico:='';
        Empresas:='';
        Cla1:='';
        Cla2:='';
        SaldoAnterior:=0;
        ColunaInicial:=0;
        colunaInicial:=10;

        Cla1:=PontosExcedentesMascaraPlano(ClaIni.Text);
        Cla2:=PontosExcedentesMascaraPlano(ClaFim.Text);
        Cla2:=Cla2+'9';

        rdprint1.Acentuacao:=Transliterate;
        rdprint1.TamanhoQteLinhas      := 66;
        Rdprint1.FonteTamanhoPadrao    := s20cpp;
        Rdprint1.TamanhoQteColunas     := 155;
        Rdprint1.NumerodeCopias := 1;
        Rdprint1.OpcoesPreview.PreviewZoom:=-1;
        RDprint1.OpcoesPreview.Preview := true;
        empresas:=','+empresas;

        PlanoController := TPlanoContasController.Create;
        if Conta.Text<>'' then
        begin
          Plano := PlanoController.Consultar('idcondominio = ' + IntToStr( FormEmpresaTrab.CodigoEmpLogada) +
                   ' and idPlanoContas = ' + conta.Text + ' and fltipo <> '+QuotedStr('S')+ ' order by nrclassificacao' );
        end
        else
        begin
          Plano := PlanoController.Consultar(' idcondominio = ' + IntToStr( FormEmpresaTrab.CodigoEmpLogada) +
                   ' and (nrclassificacao >= '+QuotedStr(Cla1)+' and nrclassificacao <='+QuotedStr(Cla2)+' ) '+ ' and fltipo <> '+QuotedStr('S') + ' order by nrclassificacao' );
        end;

        LctoController := TLancamentoCOntabilController.Create;

        RdPrint1.Abrir;
                                Lin:=0;
        for T:= 0 to Plano.Count - 1  do
        begin
          lcto := LctoController.Consultar('idcontadebito = '+ IntToStr(Plano[T].idPlanoContas) + ' or idcontacredito = ' + IntToStr(Plano[T].idPlanoContas), ' ORDER BY DTLCTO ');

          existeconta:=false;
          CDRazao.Open;
          CDRazao.EmptyDataSet;
          for I := 0  to Lcto.Count - 1 do
          begin
            CDRazao.Append;
            CDRazaoIDLCTO.AsInteger := Lcto[i].idLcto;
            CDRazaoDTLCTO.AsDateTime := Lcto[i].dtLcto;
            CDRazaoIDCONTADEBITO.AsInteger := Lcto[i].idcontadebito;
            CDRazaoDSCONTADEBITO.AsString := lCTO[i].DsContaDebito;
            CDRazaoIDCONTACREDITO.AsInteger := lcto[i].idContaCredito;
            CDRazaoDSCONTACREDITO.AsString := Lcto[i].DsContaCredito;
            CDRazaoVALOR.AsCurrency := Lcto[i].VlValor;
            CDRazaoIDHISTORICO.AsInteger := Lcto[i].idHistorico;
            CDRazaoDSCLASSIFICACAODEBITO.AsString := Lcto[i].DsHistorico;
            CDRazaoCOMPLEMENTO.AsString := Lcto[i].complemento;
            CDRazao.Post;
          end;


          If (not CDRazao.IsEmpty) then
          begin
            if Lin<=1 then
              RDprint1NewPage(Nil,1);

            saldo:= LctoController.SaldoContaData(plano[t].idPlanoContas, strtodatetime(DataInicial.Text));

            descAux:= Plano[t].dsConta;
            claAux:= Plano[t].nrClassificacao;
            contaAux:= IntToStr(Plano[t].idPlanoContas);
            RdPrint1.ImpF(Lin,01+colunainicial,'CONTA:',[]);
            RdPrint1.ImpF(Lin,10+colunainicial,copy(claAux+' '+descAux,1,55)+' ('+contaAux+')',[]);
            RdPrint1.ImpF(Lin,75+colunainicial,'Saldo Anterior....',[]);
            RdPrint1.ImpD(Lin,RdPrint1.TamanhoQteColunas+1,FormatFloat('###,###,##0.00',saldo),[]);
            existeConta:=true;
            Lin:=SomaLin(Lin,RdPrint1);

            CDRazao.First;
            while not CDRazao.Eof do
            begin
              if Lin<=1 then
                RDprint1NewPage(Nil,1);

              RdPrint1.Impf(Lin,01+colunainicial,CDRazaoDTLCTO.AsString,[]);
              if CDRazaoIDCONTADEBITO.AsInteger=Plano[t].idPlanoContas then
              begin
                if(CDRazaoIDCONTACREDITO.AsInteger>0)then
                   RdPrint1.ImpD(Lin,30+colunainicial,CDRazaoIDCONTACREDITO.AsString,[]);
                RdPrint1.ImpD(Lin,RdPrint1.TamanhoQteColunas-34,FormatFloat('###,###,##0.00',CDRazaoVALOR.AsFloat),[]);
                saldo:=saldo+CDRazaoVALOR.AsCurrency;
              end;

              if CDRazaoIDCONTACREDITO.AsInteger=Plano[t].idPlanoContas then
              begin
                if(CDRazaoIDCONTADEBITO.AsInteger>0)then
                  RdPrint1.ImpD(Lin,30+colunainicial,CDRazaoIDCONTADEBITO.AsString,[]);
                RdPrint1.ImpD(Lin,RdPrint1.TamanhoQteColunas-17,FormatFloat('###,###,##0.00',CDRazaoVALOR.AsFloat),[]);
                saldo:=saldo-CDRazaoVALOR.AsCurrency;
              end;

              Historico:=CDRazaoDSCLASSIFICACAODEBITO.AsString;
              if CDRazaoCOMPLEMENTO.AsString<>'' then
              begin
                  if Historico<>'' then
                    Historico:=Historico+' ';
                  Historico:=Historico+CDRazaoCOMPLEMENTO.AsString;
              end;
              RdPrint1.Impf(Lin,38+colunainicial,Copy(Historico,1,62),[]);

              RdPrint1.ImpD(Lin,RdPrint1.TamanhoQteColunas+1,FormatFloat('###,###,##0.00',saldo),[]);


              Lin:=SomaLin(Lin,RdPrint1);
              CDRazao.Next;
            end;
        end;
        if Lin<=1 then
          RDprint1NewPage(Nil,1);
      end;
      RdPrint1.Fechar;
end;

function SomaLin(var Lin: Integer; RdPrint1: TRdPrint): Integer;
begin
    Result:=Lin+1;
    if Result>RdPrint1.TamanhoQteLinhas-4 then
    begin
      RdPrint1.Novapagina;
      Result:=8;
    end;
    Lin:=Result;
end;


function PontosExcedentesMascaraPlano(s:string): string;
var     c,Ult: Integer;
        tmp: String;
begin
        Tmp:=s;
        Ult:=0;
        for c:=1 to Length(Tmp) do begin
                if (Tmp[c]>='0') and (Tmp[c]<='9') then Ult:=c;
        end;
        Result:=Copy(Tmp,1,Ult);
end;

procedure TFTelaLivroRazao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFTelaLivroRazao.RDprint1NewPage(Sender: TObject; Pagina: Integer);
var contapagina: integer;
begin
    colunainicial:=0;
    if contapaginas<>0 then begin
        if contapaginas+1=pagina then begin
            paginainicial:=paginainicial+contapaginas;
            RDPrint1.Fechar;
            pagina:=1;
            RDPrint1.Abrir;
        end;
    end;
    ultimapagina:=Pagina+paginainicial;

    with rdprint1 do begin
        Lin:=1;
        Impf(Lin,01+colunainicial,FormEmpresaTrab.DescricaoEmpLogada+' ('+inttostr(FormEmpresaTrab.CodigoEmpLogada)+')',[]);
        Inc(Lin);
        Impf(Lin,01+colunainicial,'CNPJ: '+(formatmasktext('99.999.999/9999-99;0; ',FormEmpresaTrab.cnpjEmpLogada)),[]);
        Impc(Lin,((TamanhoQteColunas+colunainicial) div 2),'Raz�o',[]);
        Impd(lin,TamanhoQteColunas+1,'    Folha '+IntToStr(Pagina+PaginaInicial-1),[]);

        Inc(Lin);
        Impf(Lin,01+colunainicial,'----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',[]);
        Inc(Lin);
        Impf(Lin,01+colunainicial,'Data',[]);
        ImpD(Lin,30+colunainicial,'Conta',[]);
        Impf(Lin,38+colunainicial,'Hist�rico',[]);
        ImpD(Lin,TamanhoQteColunas-34,'Debito',[]);
        ImpD(Lin,TamanhoQteColunas-17,'Credito',[]);
        ImpD(Lin,TamanhoQteColunas+1,'Saldo',[]);
        Inc(Lin);
        Impf(Lin,01+colunainicial,'----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------',[]);
        Inc(Lin);
    end;
end;

end.
