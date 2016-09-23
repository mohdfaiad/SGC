unit TestUTemplateDreVO;

interface

uses
  TestFramework, SysUtils, Atributos, UCondominioVO, Generics.Collections, UGenericVO,
  Classes, Constantes, UTemplateDreVO;

type
  TestTTemplateDreVO = class(TTestCase)
  strict private
    FTemplateDreVO: TTemplateDreVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposObrigatorios;
    procedure TestValidarCamposObrigatoriosErro;
  end;

implementation

procedure TestTTemplateDreVO.SetUp;
begin
  FTemplateDreVO := TTemplateDreVO.Create;
end;

procedure TestTTemplateDreVO.TearDown;
begin
  FTemplateDreVO.Free;
  FTemplateDreVO := nil;
end;

procedure TestTTemplateDreVO.TestValidarCamposObrigatorios;
var
  TemplateDre: TTemplateDreVO;
begin
  TemplateDre := TTemplateDreVO.Create;
  TemplateDre.idTemplate:= StrToInt('1');
  TemplateDre.Classificacao := '3.1';
  TemplateDre.descricao := 'Receitas Operacionais';
  TemplateDre.flTipo := '0';
  TemplateDre.ordem := '1';

  Try
    TemplateDre.ValidarCamposObrigatorios;
    check(true,'Sucesso');
  except on E: Exception do
     Check(false,'Erro');
  end;
end;

procedure TestTTemplateDreVO.TestValidarCamposObrigatoriosErro;
var
  TemplateDre: TTemplateDreVO;
begin
  TemplateDre := TTemplateDreVO.Create;
  TemplateDre.idTemplate:= StrToInt('1');
  TemplateDre.Classificacao := '';
  TemplateDre.descricao := 'Receitas Operacionais';
  TemplateDre.flTipo := '0';
  TemplateDre.ordem := '1';

  Try
    TemplateDre.ValidarCamposObrigatorios;
    check(false,'Erro');
  except on E: Exception do
     Check(true,'Sucesso');
  end;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTTemplateDreVO.Suite);
end.

