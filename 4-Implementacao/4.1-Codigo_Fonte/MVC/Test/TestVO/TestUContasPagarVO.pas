unit TestUContasPagarVO;


interface

uses
  TestFramework, SysUtils, Atributos, UCondominioVO, Generics.Collections, UGenericVO,
  Classes, Constantes, UHistoricoVO, UPessoasVO, UContasPagarVO, UPlanoContasVO;

type

  TestTContasPagarVO = class(TTestCase)
  strict private
    FContasPagarVO: TContasPagarVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCampos;
    procedure TestValidarCamposErro;
    procedure TestValidarBaixa;
    procedure TestValidarBaixaErro;
  end;

implementation

procedure TestTContasPagarVO.SetUp;
begin
  FContasPagarVO := TContasPagarVO.Create;
end;

procedure TestTContasPagarVO.TearDown;
begin
  FContasPagarVO.Free;
  FContasPagarVO := nil;
end;

procedure TestTContasPagarVO.TestValidarCampos;
var
  ContasPagar : TContasPagarVO;
begin
  ContasPagar:= TContasPagarVO.Create;
  ContasPagar.DtCompetencia := StrToDate('01/01/2016');
  ContasPagar.DtEmissao := StrToDate('01/01/2016');
  ContasPagar.DtVencimento := StrToDate('20/01/2016');
  ContasPagar.NrDocumento := 'Teste 01';
  ContasPagar.VlValor := StrToFloat('10,00');
  try
     ContasPagar.ValidarCampos;
     Check(true,'sucesso!')
  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTContasPagarVO.TestValidarCamposErro;
var
  ContasPagar : TContasPagarVO;
begin
  ContasPagar:= TContasPagarVO.Create;
  ContasPagar.DtCompetencia := StrToDate('01/01/2016');
  ContasPagar.DtEmissao := StrToDate('01/01/2016');
  ContasPagar.DtVencimento := StrToDate('20/01/2016');
  ContasPagar.NrDocumento := 'Teste 01';
  ContasPagar.VlValor := StrToFloat('0');
  try
     ContasPagar.ValidarCampos;
     Check(false,'Erro!')
  except on E: Exception do
     Check(true,'sucesso!');
  end;
end;
procedure TestTContasPagarVO.TestValidarBaixa;
var
  ContasPagar : TContasPagarVO;
begin
  ContasPagar := TContasPagarVO.Create;
  ContasPagar:= TContasPagarVO.Create;
  ContasPagar.DtCompetencia := StrToDate('01/01/2016');
  ContasPagar.DtEmissao := StrToDate('01/01/2016');
  ContasPagar.DtVencimento := StrToDate('20/01/2016');
  ContasPagar.NrDocumento := 'Teste 01';
  ContasPagar.VlValor := StrToFloat('10,00');
  ContasPagar.DtBaixa := StrToDate('20/01/2016');
  ContasPagar.VlPago := StrToFloat('10,00');
  ContasPagar.VlBaixa := StrToFloat('10,00');
  ContasPagar.IdContaBaixa := StrToInt('4');
  try
    ContasPagar.ValidarBaixa;
    Check(True,'Sucesso!')

  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTContasPagarVO.TestValidarBaixaErro;
var
  ContasPagar : TContasPagarVO;
begin
  ContasPagar := TContasPagarVO.Create;
  ContasPagar:= TContasPagarVO.Create;
  ContasPagar.DtCompetencia := StrToDate('01/01/2016');
  ContasPagar.DtEmissao := StrToDate('01/01/2016');
  ContasPagar.DtVencimento := StrToDate('20/01/2016');
  ContasPagar.NrDocumento := 'Teste 01';
  ContasPagar.VlValor := StrToFloat('10,00');
  ContasPagar.DtBaixa := StrToDate('20/01/2016');
  ContasPagar.VlPago := StrToFloat('10,00');
  ContasPagar.VlBaixa := StrToFloat('0');
  ContasPagar.IdContaBaixa := StrToInt('4');
  try
    ContasPagar.ValidarBaixa;
    Check(false,'Erro!')

  except on E: Exception do
     Check(true,'Sucesso');
  end;
end;

initialization
  RegisterTest(TestTContasPagarVO.Suite);
end.

