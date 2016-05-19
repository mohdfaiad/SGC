program MVC;

uses
  Vcl.Forms,
  uMVC in 'uMVC.pas' {FormMenu},
  UBase in 'tela\UBase.pas' {FBase},
  ULogin in 'tela\ULogin.pas' {FormLogin},
  UTela in 'tela\UTela.pas' {FTela},
  UPessoasVO in 'VO\UPessoasVO.pas',
  Atributos in 'comum\Atributos.pas',
  Constantes in 'comum\Constantes.pas',
  UtelaCadastro in 'tela\UtelaCadastro.pas' {FTelaCadastro},
  Upessoa in 'tela\Upessoa.pas' {FTelaCadastroPessoa},
  UDAO in 'dao\UDAO.pas',
  ConexaoBD in 'Conexao\ConexaoBD.pas',
  Biblioteca in 'comum\Biblioteca.pas',
  UGenericVO in 'VO\UGenericVO.pas',
  UController in 'controle\UController.pas',
  UPessoasController in 'controle\UPessoasController.pas',
  UPaisVO in 'VO\UPaisVO.pas',
  UPais in 'tela\UPais.pas' {FTelaCadastroPais},
  UCnaeVO in 'VO\UCnaeVO.pas',
  UCnae in 'tela\UCnae.pas' {FTelaCadastroCnae},
  UNaturezaJuridicaVO in 'VO\UNaturezaJuridicaVO.pas',
  UNaturezaJuridica in 'tela\UNaturezaJuridica.pas' {FTelaCadastroNaturezaJuridica};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
