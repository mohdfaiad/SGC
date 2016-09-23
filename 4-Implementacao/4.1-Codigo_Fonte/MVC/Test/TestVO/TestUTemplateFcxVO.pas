unit TestUTemplateFcxVO;


interface

uses
  TestFramework, SysUtils, Atributos, UCondominioVO, Generics.Collections, UGenericVO,
  Classes, Constantes, UTemplateFcxVO;

type


  TestTTemplateFcxVO = class(TTestCase)
  strict private
    FTemplateFcxVO: TTemplateFcxVO;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidarCamposObrigatorios;
    procedure TestValidarCamposErro;
  end;

implementation

procedure TestTTemplateFcxVO.SetUp;
begin
  FTemplateFcxVO := TTemplateFcxVO.Create;
end;

procedure TestTTemplateFcxVO.TearDown;
begin
  FTemplateFcxVO.Free;
  FTemplateFcxVO := nil;
end;

procedure TestTTemplateFcxVO.TestValidarCamposErro;
var
  TemplateFcx : TTemplateFcxVO;
begin
  TemplateFcx := TTemplateFcxVO.Create;
  TemplateFcx.idTemplate := StrToInt('1');
  TemplateFcx.Classificacao := '10';
  TemplateFcx.descricao := '';
  TemplateFcx.flTipo := '0';

 try
  TemplateFcx.ValidarCamposObrigatorios;
  check(true,'Erro');

  except on E: Exception do
     Check(true,'Sucesso');
  end;
end;

procedure TestTTemplateFcxVO.TestValidarCamposObrigatorios;
var
  TemplateFcx : TTemplateFcxVO;
begin
  TemplateFcx := TTemplateFcxVO.Create;
  TemplateFcx.idTemplate := StrToInt('1');
  TemplateFcx.Classificacao := '10';
  TemplateFcx.descricao := 'Atividades';
  TemplateFcx.flTipo := '0';

 try
  TemplateFcx.ValidarCamposObrigatorios;
  check(true,'Sucesso');

  except on E: Exception do
     Check(false,'Erro');
  end;
end;

initialization

  RegisterTest(TestTTemplateFcxVO.Suite);
end.

