unit TestULeituraGasVO;


interface

uses
  TestFramework, SysUtils, Atributos, ULeituraGasVO, UCondominioVO,
  Generics.Collections, UGenericVO, Classes, Constantes, UitensLeituraGasVO;

type

  TestTLeituraGasVO = class(TTestCase)
  strict private
    FLeituraGasVO: TLeituraGasVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposObrigatorios;
    procedure TestValidarCamposObrigatoriosNaoEncontrado;
  end;

implementation

procedure TestTLeituraGasVO.SetUp;
begin
  FLeituraGasVO := TLeituraGasVO.Create;
end;

procedure TestTLeituraGasVO.TearDown;
begin
  FLeituraGasVO.Free;
  FLeituraGasVO := nil;
end;

procedure TestTLeituraGasVO.TestValidarCamposObrigatorios;
var
  Leitura : TLeituraGasVO;
begin
  Leitura := TLeituraGasVO.Create;
  Leitura.dtLeitura := StrToDate('01/01/2016');
  Leitura.idLeituraGas := 1;
  try
     Leitura.ValidarCamposObrigatorios;
     Check(True,'Sucesso!')
  except on E: Exception do
     Check(False,'Erro!');
  end;
end;

procedure TestTLeituraGasVO.TestValidarCamposObrigatoriosNaoEncontrado;
var
  Leitura : TLeituraGasVO;
begin
  Leitura := TLeituraGasVO.Create;
  Leitura.dtLeitura := StrToDate('01/01/2016');
  Leitura.idLeituraGas := 0;
  try
     Leitura.ValidarCamposObrigatorios;
     Check(false,'Erro!')
  except on E: Exception do
     Check(true,'Sucesso!');
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTLeituraGasVO.Suite);
end.

