unit TestUContasReceberVO;

interface

uses
  TestFramework, SysUtils, Atributos, UUnidadeVO, UCondominioVO, Generics.Collections,
  UGenericVO, Classes, Constantes, UHistoricoVO, UPlanoContasVO, UContasReceberVO;

type


  TestTContasReceberVO = class(TTestCase)
  strict private
    FContasReceberVO: TContasReceberVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposErro;
    procedure TestValidarCampos;
    procedure TestValidarBaixaErro;
    procedure TestValidarBaixa;
  end;

implementation

procedure TestTContasReceberVO.SetUp;
begin
  FContasReceberVO := TContasReceberVO.Create;
end;

procedure TestTContasReceberVO.TearDown;
begin
  FContasReceberVO.Free;
  FContasReceberVO := nil;
end;

procedure TestTContasReceberVO.TestValidarCampos;
var
  ContasReceber : TContasReceberVO;
begin
  ContasReceber:= TContasReceberVO.Create;
  ContasReceber.DtCompetencia := StrToDate('01/01/2016');
  ContasReceber.DtVencimento := StrToDate('20/01/2016');
  ContasReceber.NrDocumento := 'Teste 01';
  ContasReceber.VlValor := StrToFloat('10,00');
  try
     ContasReceber.ValidarCampos;
     Check(true,'sucesso!')
  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTContasReceberVO.TestValidarCamposErro;
var
  ContasReceber : TContasReceberVO;
begin
  ContasReceber:= TContasReceberVO.Create;
  ContasReceber.DtCompetencia := StrToDate('01/01/2016');
  ContasReceber.DtVencimento := StrToDate('20/01/2016');
  ContasReceber.NrDocumento := 'Teste 01';
  ContasReceber.VlValor := StrToFloat('0');
  try
     ContasReceber.ValidarCampos;
     Check(false,'Erro!')
  except on E: Exception do
     Check(true,'sucesso!');
  end;
end;
procedure TestTContasReceberVO.TestValidarBaixa;
var
  ContasReceber : TContasReceberVO;
begin
  ContasReceber := TContasReceberVO.Create;
  ContasReceber:= TContasReceberVO.Create;
  ContasReceber.DtCompetencia := StrToDate('01/01/2016');
  ContasReceber.DtVencimento := StrToDate('20/01/2016');
  ContasReceber.NrDocumento := 'Teste 01';
  ContasReceber.VlValor := StrToFloat('10,00');
  ContasReceber.DtBaixa := StrToDate('20/01/2016');
  ContasReceber.VlPago := StrToFloat('10,00');
  ContasReceber.VlBaixa := StrToFloat('10,00');
  ContasReceber.IdContaBaixa := StrToInt('4');
  try
    ContasReceber.ValidarBaixa;
    Check(True,'Sucesso!')

  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTContasReceberVO.TestValidarBaixaErro;
var
  ContasReceber : TContasReceberVO;
begin
  ContasReceber := TContasReceberVO.Create;
  ContasReceber:= TContasReceberVO.Create;
  ContasReceber.DtCompetencia := StrToDate('01/01/2016');
  ContasReceber.DtVencimento := StrToDate('20/01/2016');
  ContasReceber.NrDocumento := 'Teste 01';
  ContasReceber.VlValor := StrToFloat('10,00');
  ContasReceber.DtBaixa := StrToDate('20/01/2016');
  ContasReceber.VlPago := StrToFloat('10,00');
  ContasReceber.VlBaixa := StrToFloat('0');
  ContasReceber.IdContaBaixa := StrToInt('4');
  try
    ContasReceber.ValidarBaixa;
    Check(false,'Erro!')

  except on E: Exception do
     Check(true,'Sucesso');
  end;
end;

initialization
  RegisterTest(TestTContasReceberVO.Suite);
end.

