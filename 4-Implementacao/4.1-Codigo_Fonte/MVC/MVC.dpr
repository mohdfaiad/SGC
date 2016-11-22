program MVC;

uses
  Vcl.Forms,
  uMVC in 'uMVC.pas' {FormMenu},
  UPessoasVO in 'VO\UPessoasVO.pas',
  Atributos in 'comum\Atributos.pas',
  Constantes in 'comum\Constantes.pas',
  UDAO in 'dao\UDAO.pas',
  ConexaoBD in 'Conexao\ConexaoBD.pas',
  Biblioteca in 'comum\Biblioteca.pas',
  UGenericVO in 'VO\UGenericVO.pas',
  UController in 'controle\UController.pas',
  UPessoasController in 'controle\UPessoasController.pas',
  UPaisVO in 'VO\UPaisVO.pas',
  UCnaeVO in 'VO\UCnaeVO.pas',
  UNaturezaJuridicaVO in 'VO\UNaturezaJuridicaVO.pas',
  UCondominioVO in 'VO\UCondominioVO.pas',
  UEstadoVO in 'VO\UEstadoVO.pas',
  UEstadoController in 'controle\UEstadoController.pas',
  UCidadeVO in 'VO\UCidadeVO.pas',
  UCidadeController in 'controle\UCidadeController.pas',
  UCondominioController in 'controle\UCondominioController.pas',
  UCnaeController in 'controle\UCnaeController.pas',
  UNaturezaJuridicaController in 'controle\UNaturezaJuridicaController.pas',
  UPaisController in 'controle\UPaisController.pas',
  UUnidadeVO in 'VO\UUnidadeVO.pas',
  UUnidadeController in 'controle\UUnidadeController.pas',
  UProprietarioUnidadeVO in 'VO\UProprietarioUnidadeVO.pas',
  UProprietarioUnidadeController in 'controle\UProprietarioUnidadeController.pas',
  UInquilinoUnidadeVO in 'VO\UInquilinoUnidadeVO.pas',
  UInquilinoUnidadeController in 'controle\UInquilinoUnidadeController.pas',
  UTotalGastoMesVO in 'VO\UTotalGastoMesVO.pas',
  UTotalGastoMesController in 'controle\UTotalGastoMesController.pas',
  UPrecoGasVO in 'VO\UPrecoGasVO.pas',
  UPrecoGasController in 'controle\UPrecoGasController.pas',
  UPlanoContasVO in 'VO\UPlanoContasVO.pas',
  UPlanoContasController in 'controle\UPlanoContasController.pas',
  UTemplateDreVO in 'VO\UTemplateDreVO.pas',
  UTemplateDreController in 'controle\UTemplateDreController.pas',
  UTemplateFcxVO in 'VO\UTemplateFcxVO.pas',
  UTemplateFcxController in 'controle\UTemplateFcxController.pas',
  UContasPagarVO in 'VO\UContasPagarVO.pas',
  UContasPagarController in 'controle\UContasPagarController.pas',
  UHistoricoVO in 'VO\UHistoricoVO.pas',
  UHistoricoController in 'controle\UHistoricoController.pas',
  UContasReceberVO in 'VO\UContasReceberVO.pas',
  UContasReceberController in 'controle\UContasReceberController.pas',
  Vcl.Themes,
  Vcl.Styles,
  PNGExtra in '..\..\..\..\..\..\Downloads\PNGExtra.pas',
  ULoteVO in 'VO\ULoteVO.pas',
  ULoteController in 'controle\ULoteController.pas',
  ULancamentoContabilVO in 'VO\ULancamentoContabilVO.pas',
  ULancamentoContabilController in 'controle\ULancamentoContabilController.pas',
  UUsuarioVO in 'VO\UUsuarioVO.pas',
  UUsuarioController in 'controle\UUsuarioController.pas',
  UContadorVO in 'VO\UContadorVO.pas',
  UContadorController in 'controle\UContadorController.pas',
  UResponsavelVO in 'VO\UResponsavelVO.pas',
  UResponsavelController in 'controle\UResponsavelController.pas',
  ULancamentoPadraoVO in 'VO\ULancamentoPadraoVO.pas',
  ULancamentoPadraoController in 'controle\ULancamentoPadraoController.pas',
  ULeituraGasVO in 'VO\ULeituraGasVO.pas',
  UItensLeituraGasVO in 'VO\UItensLeituraGasVO.pas',
  ULeituraGasController in 'controle\ULeituraGasController.pas',
  UItensLeituraGasController in 'controle\UItensLeituraGasController.pas',
  URateioVO in 'VO\URateioVO.pas',
  UItensRateioVO in 'VO\UItensRateioVO.pas',
  URateioController in 'controle\URateioController.pas',
  UItensRateioController in 'controle\UItensRateioController.pas',
  UBase in 'tela\UBase.pas' {FBase},
  UCidade in 'tela\UCidade.pas' {TFTelaCadastroCidade},
  UCnae in 'tela\UCnae.pas' {FTelaCadastroCnae},
  UCondominio in 'tela\UCondominio.pas' {FTelaCadastroCondominio},
  UContador in 'tela\UContador.pas' {FTelaCadastroContador},
  UContasPagar in 'tela\UContasPagar.pas' {FTelaCadastroContasPagar},
  UContasReceber in 'tela\UContasReceber.pas' {FTelaCadastroContasReceber},
  UEmpresaTrab in 'tela\UEmpresaTrab.pas' {FormEmpresaTrab},
  UEstado in 'tela\UEstado.pas' {FTelaCadastroEstado},
  UHistorico in 'tela\UHistorico.pas' {FTelaCadastroHistorico},
  UInquilinoUnidade in 'tela\UInquilinoUnidade.pas' {FTelaCadastroInquilino},
  ULancamentoPadrao in 'tela\ULancamentoPadrao.pas' {FTelaCadastroLancamentoPadrao},
  ULeituraGas in 'tela\ULeituraGas.pas' {FTelaCadastroLeituraGas},
  ULogin in 'tela\ULogin.pas' {FormLogin},
  ULote in 'tela\ULote.pas' {FTelaCadastroLote},
  UNaturezaJuridica in 'tela\UNaturezaJuridica.pas' {FTelaCadastroNaturezaJuridica},
  UPais in 'tela\UPais.pas' {FTelaCadastroPais},
  Upessoa in 'tela\Upessoa.pas' {FTelaCadastroPessoa},
  UPlanoContas in 'tela\UPlanoContas.pas' {FTelaCadastroPlano},
  UPrecoGas in 'tela\UPrecoGas.pas' {FTelaCadastroPrecoGas},
  UProprietarioUnidade in 'tela\UProprietarioUnidade.pas' {FTelaCadastroProprietario},
  URateio in 'tela\URateio.pas' {FTelaCadastroRateio},
  UResponsavel in 'tela\UResponsavel.pas' {FTelaCadastroResponsavel},
  UTela in 'tela\UTela.pas' {FTela},
  UtelaCadastro in 'tela\UtelaCadastro.pas' {FTelaCadastro},
  UTemplateDre in 'tela\UTemplateDre.pas' {FTelaCadastroTemplateDre},
  UTemplateFcx in 'tela\UTemplateFcx.pas' {FTelaCadastroTemplateFcx},
  UTotalGastoMes in 'tela\UTotalGastoMes.pas' {FTelaCadastroTotalGastoMes},
  UUnidade in 'tela\UUnidade.pas' {FTelaCadastroUnidade},
  UUsuario in 'tela\UUsuario.pas' {FTelaCadastroUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFTelaCadastroLeituraGas, FTelaCadastroLeituraGas);
  Application.CreateForm(TFTelaCadastroRateio, FTelaCadastroRateio);
  Application.CreateForm(TFTelaCadastro, FTelaCadastro);
  Application.CreateForm(TFBase, FBase);
  Application.CreateForm(TTFTelaCadastroCidade, TFTelaCadastroCidade);
  Application.CreateForm(TFTelaCadastroCnae, FTelaCadastroCnae);
  Application.CreateForm(TFTelaCadastroCondominio, FTelaCadastroCondominio);
  Application.CreateForm(TFTelaCadastroContador, FTelaCadastroContador);
  Application.CreateForm(TFTelaCadastroContasPagar, FTelaCadastroContasPagar);
  Application.CreateForm(TFTelaCadastroContasReceber, FTelaCadastroContasReceber);
  Application.CreateForm(TFormEmpresaTrab, FormEmpresaTrab);
  Application.CreateForm(TFTelaCadastroEstado, FTelaCadastroEstado);
  Application.CreateForm(TFTelaCadastroHistorico, FTelaCadastroHistorico);
  Application.CreateForm(TFTelaCadastroInquilino, FTelaCadastroInquilino);
  Application.CreateForm(TFTelaCadastroLeituraGas, FTelaCadastroLeituraGas);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFTelaCadastroLote, FTelaCadastroLote);
  Application.CreateForm(TFTelaCadastroNaturezaJuridica, FTelaCadastroNaturezaJuridica);
  Application.CreateForm(TFTelaCadastroPais, FTelaCadastroPais);
  Application.CreateForm(TFTelaCadastroPessoa, FTelaCadastroPessoa);
  Application.CreateForm(TFTelaCadastroPlano, FTelaCadastroPlano);
  Application.CreateForm(TFTelaCadastroPrecoGas, FTelaCadastroPrecoGas);
  Application.CreateForm(TFTelaCadastroProprietario, FTelaCadastroProprietario);
  Application.CreateForm(TFTelaCadastroRateio, FTelaCadastroRateio);
  Application.CreateForm(TFTelaCadastroResponsavel, FTelaCadastroResponsavel);
  Application.CreateForm(TFTela, FTela);
  Application.CreateForm(TFTelaCadastro, FTelaCadastro);
  Application.CreateForm(TFTelaCadastroTemplateDre, FTelaCadastroTemplateDre);
  Application.CreateForm(TFTelaCadastroTemplateFcx, FTelaCadastroTemplateFcx);
  Application.CreateForm(TFTelaCadastroTotalGastoMes, FTelaCadastroTotalGastoMes);
  Application.CreateForm(TFTelaCadastroUnidade, FTelaCadastroUnidade);
  Application.CreateForm(TFTelaCadastroUsuario, FTelaCadastroUsuario);
  Application.Run;
end.
