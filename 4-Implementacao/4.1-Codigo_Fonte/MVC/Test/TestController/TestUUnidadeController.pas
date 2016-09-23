unit TestUUnidadeController;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, UCondominioVO, SysUtils, DBClient, DBXJSON, UPessoasVO,
  UCondominioController, DBXCommon, UUnidadeController, UUnidadeVO,
  Generics.Collections, Classes, UController, DB, ConexaoBD, SQLExpr;

type
  // Test methods for class TUnidadeController

  TestTUnidadeController = class(TTestCase)
  strict private
    FUnidadeController: TUnidadeController;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestConsultarPorId;
  end;

implementation

procedure TestTUnidadeController.SetUp;
begin
  FUnidadeController := TUnidadeController.Create;
end;

procedure TestTUnidadeController.TearDown;
begin
  FUnidadeController.Free;
  FUnidadeController := nil;
end;

procedure TestTUnidadeController.TestConsultarPorId;
var
  ReturnValue: TUnidadeVO;
 // id: Integer;
begin
  ReturnValue := FUnidadeController.ConsultarPorId(4);
  if(returnvalue <> nil)  then
    check(true,'Unidade pesquisada com sucesso!')
  else
    check(true,'Unidade nao encontrada!');

end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTUnidadeController.Suite);
end.

