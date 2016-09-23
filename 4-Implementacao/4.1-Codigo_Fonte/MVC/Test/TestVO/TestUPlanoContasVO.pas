unit TestUPlanoContasVO;


interface

uses
  TestFramework, SysUtils, Atributos, UUnidadeVO, UCondominioVO, Generics.Collections,
  UGenericVO, Classes, Constantes, UPessoasVO, UPlanoContasVO;

type


  TestTPlanoContasVO = class(TTestCase)
  strict private
    FPlanoContasVO: TPlanoContasVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposObrigatorios;
    procedure TestValidarCamposObrigatoriosNãoEncontrado;
  end;

implementation

procedure TestTPlanoContasVO.SetUp;
begin
  FPlanoContasVO := TPlanoContasVO.Create;
end;

procedure TestTPlanoContasVO.TearDown;
begin
  FPlanoContasVO.Free;
  FPlanoContasVO := nil;
end;

procedure TestTPlanoContasVO.TestValidarCamposObrigatorios;
var
PlanoContas : TPlanoContasVO;
begin
  PlanoContas := TPlanoContasVo.Create;
  PlanoContas.dsConta := 'Conta Caixa';
  PlanoContas.nrClassificacao := '1.1.10.001';

  try
    PlanoContas.ValidarCamposObrigatorios;
    check(true,'Sucesso!');

  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTPlanoContasVO.TestValidarCamposObrigatoriosNãoEncontrado;
var
PlanoContas : TPlanoContasVO;
begin
  PlanoContas := TPlanoContasVo.Create;
  PlanoContas.dsConta := 'Conta Caixa';
  PlanoContas.nrClassificacao := '';

  try
    PlanoContas.ValidarCamposObrigatorios;
    check(false,'Erro!');

  except on E: Exception do
     Check(true,'Sucesso');
  end;
end;


initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPlanoContasVO.Suite);
end.

