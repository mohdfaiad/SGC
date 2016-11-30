unit UDiario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RDprint, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Bde.DBTables, Data.FMTBcd, Data.SqlExpr, Generics.Collections,
  ULancamentoContabilController, ULancamentoContabilVO,     MaskUtils,
  Datasnap.DBClient;

type
  TFTelaLivroDiario = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DataInicial: TMaskEdit;
    DataFinal: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RDprint1: TRDprint;
    CDDiariotESTE: TClientDataSet;
    CDDiariotESTEIDLCTO: TIntegerField;
    CDDiariotESTEIDCONTADEBITO: TIntegerField;
    CDDiariotESTEIDCONTACREDITO: TIntegerField;
    CDDiariotESTEDSCONTADEBITO: TStringField;
    CDDiariotESTEDSCONTACREDITO: TStringField;
    CDDiariotESTEVALOR: TCurrencyField;
    CDDiariotESTEIDHISTORICO: TIntegerField;
    CDDiariotESTEDTLCTO: TDateTimeField;
    CDDiariotESTECOMPLEMENTO: TStringField;
    CDDiario: TClientDataSet;
    CDDiarioIDLCTO: TIntegerField;
    CDDiarioIDCONTADEBITO: TIntegerField;
    CDDiarioIDCONTACREDITO: TIntegerField;
    CDDiarioDSCONTADEBITO: TStringField;
    CDDiarioDSCONTACREDITO: TStringField;
    CDDiarioVALOR: TCurrencyField;
    CDDiarioIDHISTORICO: TIntegerField;
    CDDiarioDTLCTO: TDateTimeField;
    CDDiarioCOMPLEMENTO: TStringField;
    CDDiarioDSHISTORICO: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure RDprint1NewPage(Sender: TObject; Pagina: Integer);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    contapaginas,PaginaInicial: Integer;
    Lin: Integer;
    UltimaPagina: Integer;
    ImprimeTermo: String;
    ColunaInicial: Integer;

  end;

var
  FTelaLivroDiario: TFTelaLivroDiario;

implementation

{$R *.dfm}

uses ConexaoBD, UEmpresaTrab;

function SomaLin(var Lin: Integer; RdPrint1: TRdPrint): Integer;
begin
  Result:=Lin+1;
  if Result>RdPrint1.TamanhoQteLinhas-3 then
  begin
    RdPrint1.Novapagina;
    Result:=6;
  end;
  Lin:=Result;
end;


procedure TFTelaLivroDiario.BitBtn1Click(Sender: TObject);
var     c,total, i: Integer;
        DiaI,MesI,AnoI,Mes,Ano,Dia,MesAnt,MesAtu,AnoAnt,AnoAtu: Word;
        DsHistorico,Conta,Historico,DataAnt: String;
        ValorDebito,ValorCredito,Codigo: currency;
        DebitosDia,CreditosDia,DebitosMes,CreditosMes: Double;
        path,caminho: string;
        LctoController : TLancamentoContabilController;
        Lcto : TObjectList<TLancamentoContabilVO>;
        datei, datef : TDateTime;
begin
  colunaInicial:=0;
  rdprint1.Acentuacao:=Transliterate;
  rdprint1.TamanhoQteLinhas      := 70;
  rdprint1.FonteTamanhoPadrao    := s17cpp;
  rdprint1.TamanhoQteColunas     := 132;
  rdPrint1.OpcoesPreview.PreviewZoom := -1;
  rdPrint1.NumerodeCopias := 1;
  rdprint1.OpcoesPreview.Preview:=true;

  datei := StrToDate(DataInicial.Text);
  datef := StrToDate(DataFinal.Text);

  LctoController := TLancamentoCOntabilController.Create;
  lcto := LctoController.Consultar( ' ( (PlanoDebito.idcondominio = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+') OR (PlanoCredito.idcondominio = '+inttostr(FormEmpresaTrab.CodigoEmpLogada)+') ) '+
                                    '  AND  ( DTLCTO >= '+QuotedSTr(StringReplace(datainicial.Text, '/','.', [rfReplaceAll]))+
                                       ' AND DTLCTO <= ' +QuotedStr(StringReplace(DataFinal.Text, '/','.', [rfReplaceAll]))+ ')',
                                       ' ORDER BY DTLCTO, IDLCTO ' );

  CDDiario.Open;
  CDDiario.EmptyDataSet;

  for I := 0  to Lcto.Count - 1 do
  begin
    CDDiario.Append;
    CDDiarioIDLCTO.AsInteger := Lcto[i].idLcto;
    CDDiarioDTLCTO.AsDateTime := Lcto[i].dtLcto;
    CDDiarioIDCONTADEBITO.AsInteger := Lcto[i].idcontadebito;
    CDDiarioDSCONTADEBITO.AsString := lCTO[i].DsContaDebito;
    CDDiarioIDCONTACREDITO.AsInteger := lcto[i].idContaCredito;
    CDDiarioDSCONTACREDITO.AsString := Lcto[i].DsContaCredito;
    CDDiarioVALOR.AsCurrency := Lcto[i].VlValor;
    CDDiarioIDHISTORICO.AsInteger := Lcto[i].idHistorico;
    CDDiarioDSHISTORICO.AsString := Lcto[i].DsHistorico;
    CDDiarioCOMPLEMENTO.AsString := Lcto[i].complemento;
    CDDiario.Post;
  end;

  CDDiario.First;

    try
      RdPrint1.Abrir;
      Lin:=0;
      DebitosDia:=0;CreditosDia:=0;DebitosMes:=0;CreditosMes:=0;

      While not CDDiario.Eof do begin

        for c:=1 to 2 do begin

          if Lin<=1 then RDprint1NewPage(Nil,1);

          ValorDebito:=0; ValorCredito:=0;

          if c=1 then begin
            Codigo:=CDDiarioIDCONTADEBITO.AsInteger;
            Conta:=CDDiarioIDCONTADEBITO.AsString+'-'+CDDiarioDSCONTADEBITO.AsString;
            ValorDebito:=CDDiarioVALOR.AsCurrency ;
          end
          else begin
            Codigo:=CDDiarioIDCONTACREDITO.AsInteger;
            Conta:=CDDiarioIDCONTACREDITO.AsString+'-'+CDDiarioDSCONTACREDITO.AsString;
            ValorCredito:=CDDiarioVALOR.AsCurrency;
          end;

          if (Codigo<>0) and (CDDiarioVALOR.AsCurrency>0) then begin

            DebitosDia:=DebitosDia+ValorDebito;
            DebitosMes:=DebitosMes+ValorDebito;
            CreditosDia:=CreditosDia+ValorCredito;
            CreditosMes:=CreditosMes+ValorCredito;

            RdPrint1.Impf(Lin,01+colunaInicial, CDDiarioDTLCTO.AsString,[]);
            RdPrint1.Impf(Lin,18+colunainicial,Copy(Conta,1,37),[]);
            Historico:= CDDiarioIDHISTORICO.AsString;
            DsHistorico := CDDiarioDSHISTORICO.AsString;
            if CDDiarioCOMPLEMENTO.AsString<>'' then begin
              if Historico<>'' then
                Historico:=Historico+ ' ' + dshistorico + ' ';
              Historico:=Historico+CDDiarioCOMPLEMENTO.AsString;
            end;
            RdPrint1.Impf(Lin,58,Copy(Historico,1,42),[]);

            if (c=1) then
              RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1)-16,FormatFloat('###,###,##0.00',CDDiarioVALOR.AsFloat),[])
            else
              RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1),FormatFloat('###,###,##0.00',CDDiarioVALOR.AsFloat),[]);

              Lin:=SomaLin(Lin,RdPrint1);
          end;
        end;

        DataAnt:= CDDiarioDTLCTO.AsString;

        CDDiario.Next;
         if (DataAnt<>CDDiarioDTLCTO.AsString) or (CDDiario.Eof) then begin

          RdPrint1.ImpF(Lin,10+colunainicial,'* TOTAL DO DIA '+DataAnt+' *',[]);
          RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1)-16,FormatFloat('###,###,##0.00',DebitosDia),[]);
          RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1),FormatFloat('###,###,##0.00',CreditosDia),[]);

          DebitosDia:=0;
          CreditosDia:=0;
          Lin:=SomaLin(Lin,RdPrint1);
          Lin:=SomaLin(Lin,RdPrint1);
          DecodeDate(StrToDate(DataAnt),AnoANt,MesAnt,Dia);
          DecodeDate(CDDiarioDTLCTO.AsDateTime,AnoAtu,MesAtu,Dia);

          if ((MesAnt<>MesAtu) or (AnoAnt<>AnoAtu)) or (CDDiario.Eof) then begin

            RdPrint1.ImpF(Lin,10+colunainicial,'* TOTAL DO MES '+IntToStr(MesAnt)+' *',[]);
            RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1)-16,FormatFloat('###,###,##0.00',DebitosMes),[]);
            RdPrint1.ImpD(Lin,(RdPrint1.TamanhoQteColunas+1),FormatFloat('###,###,##0.00',CreditosMes),[]);
            DebitosDia:=0;
            CreditosDia:=0;
            DebitosMes:=0;
            CreditosMes:=0;
            If not CDDiario.Eof then  RdPrint1.Novapagina;
          end;
        end;
        end;

    finally
      RdPrint1.Fechar;
    end;
end;

procedure TFTelaLivroDiario.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFTelaLivroDiario.RDprint1NewPage(Sender: TObject; Pagina: Integer);
begin
  if contapaginas<>0 then begin
    if contapaginas+1=pagina then begin
      paginainicial:=paginainicial+contapaginas;
      RDPrint1.Fechar;
      pagina:=1;
      RDPrint1.Abrir;
    end;
  end;

  ultimapagina:=Pagina+PaginaInicial;

  with rdprint1 do begin
    Lin:=1;
    Impf(Lin,01+colunainicial,FormEmpresaTrab.DescricaoEmpLogada+' ('+inttostr(FormEmpresaTrab.CodigoEmpLogada)+')',[]);
    Inc(Lin);
    Impf(Lin,01+colunainicial,'CNPJ: '+(formatmasktext('99.999.999/9999-99;0; ',FormEmpresaTrab.cnpjEmpLogada)),[]);
    Impc(Lin,((TamanhoQteColunas+colunainicial) div 2),'DI�RIO',[]);
    Impd(lin,TamanhoQteColunas+1,'    Folha '+IntToStr(Pagina+PaginaInicial-1),[]);

    Inc(Lin);
    Impf(Lin,01+colunainicial,'----------------------------------------------------------------------------------------------------------------------------------------------------------------------',[]);
    Inc(Lin);
    Impf(Lin,01+colunainicial,'Data',[]);
  //  ImpD(Lin,16+colunainicial,'Lote',[]);
    Impf(Lin,18+colunainicial,'Descricao da Conta',[]);
    Impf(Lin,58,'Historico',[]);
    ImpD(Lin,(TamanhoQteColunas+1)-(16*1),'Debito',[]);
    ImpD(Lin,(TamanhoQteColunas+1)-(16*0),'Credito',[]);
    Inc(Lin);
    Impf(Lin,01+colunainicial, '----------------------------------------------------------------------------------------------------------------------------------------------------------------------',[]);
    Inc(Lin);
  end;
end;

end.
