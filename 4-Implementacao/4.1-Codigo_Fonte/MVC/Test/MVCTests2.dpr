program MVCTests2;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  TestUCondominioController in 'TestUCondominioController.pas',
  UCondominioController in '..\controle\UCondominioController.pas',
  DUnitTestRunner,
  UCidadeController in '..\controle\UCidadeController.pas',
  UCnaeController in '..\controle\UCnaeController.pas',
  UController in '..\controle\UController.pas',
  UEstadoController in '..\controle\UEstadoController.pas',
  UNaturezaJuridicaController in '..\controle\UNaturezaJuridicaController.pas',
  UPaisController in '..\controle\UPaisController.pas',
  UPessoasController in '..\controle\UPessoasController.pas',
  UProprietarioUnidadeController in '..\controle\UProprietarioUnidadeController.pas',
  UTotalGastoMesController in '..\controle\UTotalGastoMesController.pas',
  UUnidadeController in '..\controle\UUnidadeController.pas',
  UDAO in '..\dao\UDAO.pas',
  ConexaoBD in '..\Conexao\ConexaoBD.pas',
  Atributos in '..\comum\Atributos.pas',
  Biblioteca in '..\comum\Biblioteca.pas',
  Constantes in '..\comum\Constantes.pas',
  UCidadeVO in '..\VO\UCidadeVO.pas',
  UCnaeVO in '..\VO\UCnaeVO.pas',
  UCondominioVO in '..\VO\UCondominioVO.pas',
  UEstadoVO in '..\VO\UEstadoVO.pas',
  UGenericVO in '..\VO\UGenericVO.pas',
  UNaturezaJuridicaVO in '..\VO\UNaturezaJuridicaVO.pas',
  UPaisVO in '..\VO\UPaisVO.pas',
  UPessoasVO in '..\VO\UPessoasVO.pas',
  UProprietarioUnidadeVO in '..\VO\UProprietarioUnidadeVO.pas',
  UTotalGastoMesVO in '..\VO\UTotalGastoMesVO.pas',
  UUnidadeVO in '..\VO\UUnidadeVO.pas',
  TestUPessoasController in 'TestUPessoasController.pas',
  TestUUnidadeController in 'TestUUnidadeController.pas',
  TestUInquilinoUnidadeController in 'TestUInquilinoUnidadeController.pas',
  TestUProprietarioUnidadeController in 'TestUProprietarioUnidadeController.pas',
  TestUPrecoGasController in 'TestUPrecoGasController.pas',
  UPrecoGasController in '..\controle\UPrecoGasController.pas',
  UPrecoGasVO in '..\VO\UPrecoGasVO.pas',
  UInquilinoUnidadeVO in '..\VO\UInquilinoUnidadeVO.pas',
  UInquilinoUnidadeController in '..\controle\UInquilinoUnidadeController.pas',
  TestUCondominioVO in 'TestUCondominioVO.pas',
  UTemplateFcxVO in '..\VO\UTemplateFcxVO.pas',
  UPlanoContasVO in '..\VO\UPlanoContasVO.pas',
  UTemplateDreVO in '..\VO\UTemplateDreVO.pas',
  UPlanoContasController in '..\controle\UPlanoContasController.pas',
  UTemplateDreController in '..\controle\UTemplateDreController.pas',
  UTemplateFcxController in '..\controle\UTemplateFcxController.pas',
  TestUTemplateDreController in 'TestUTemplateDreController.pas',
  TestUTemplateFcxController in 'TestUTemplateFcxController.pas',
  TestUPlanoContasController in 'TestUPlanoContasController.pas';

{R *.RES}

begin
  TDBExpress.Conectar('Firebird');
  DUnitTestRunner.RunRegisteredTests;
end.

