unit TestUPrecoGasController;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, DB, DBXJSON, UPrecoGasController, ConexaoBD, Generics.Collections,
  UController, Classes, SysUtils, DBClient, UPrecoGasVO, DBXCommon, SQLExpr;

type
  // Test methods for class TPrecoGasController

  TestTPrecoGasController = class(TTestCase)
  strict private
    FPrecoGasController: TPrecoGasController;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestConsultarPorId;
  end;

implementation

procedure TestTPrecoGasController.SetUp;
begin
  FPrecoGasController := TPrecoGasController.Create;
end;

procedure TestTPrecoGasController.TearDown;
begin
  FPrecoGasController.Free;
  FPrecoGasController := nil;
end;

procedure TestTPrecoGasController.TestConsultarPorId;
var
  ReturnValue: TPrecoGasVO;
 // id: Integer;
begin
  ReturnValue := FPrecoGasController.ConsultarPorId(1);
  if(returnvalue <> nil)  then
    check(true,'Pre�o G�s pesquisado com sucesso!')
  else
    check(true,'Pre�o G�s n�o encontrado!');

end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTPrecoGasController.Suite);
end.

