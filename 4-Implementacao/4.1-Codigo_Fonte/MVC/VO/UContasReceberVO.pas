unit UContasReceberVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UUnidadeVO,
UHistoricoVO, UCondominioVO, UPlanoContasVO;

type
  [TEntity]
  [TTable('ContasReceber')]
  TContasReceberVO = class(TGenericVO)
  private
    FidContasReceber : Integer;
    FDtCompetencia : TDateTime;
    FDtVencimento: TDateTime;
    FNrDocumento : String;
    FVlValor : Currency;
    FDsComplemento : String;
    FIdHistorico : Integer;
    FFlBaixa : String;
    FIdConta : Integer;
    FIdCondominio : Integer;
    FIdPessoa : Integer;
    FIdContraPartida : Integer;
    FIdUnidade : Integer;
    FVlBaixa : Currency;
    FVlJuros : Currency;
    FVlMulta : Currency;
    FVlDesconto : Currency;
    FDtBaixa : TDateTime;
    FIdContaBaixa : Integer;
    FIdHistoricoBx  : Integer;
    FDescricao : string;
    FVlPago : currency;


  public

    CondominioVO : TCondominioVO;
    UnidadeVO : TUnidadeVO;
    PlanoContasContaVO : TPlanoContasVO;
    PlanoContasContraPartidaVO : TPlanoContasVO;
    HistoricoVO : THistoricoVO;


    [TId('idContasReceber')]
    [TGeneratedValue(sAuto)]
    property idContasReceber : Integer  read FidContasReceber write FidContasReceber;

    [TColumn('DtCompetencia','Data Competencia',50,[ldLookup,ldComboBox], False)]
    property DtCompetencia: TDateTime  read FDtCompetencia write FDtCompetencia;
    [TColumn('DtVencimento','Data Vencimento',50,[ldGrid,ldLookup,ldComboBox], False)]
    property DtVencimento: TDateTime  read FDtVencimento write FDtVencimento;
    [TColumn('NrDocumento','Documento',100,[ldGrid,ldLookup,ldComboBox], False)]
    property NrDocumento: string  read FNrDocumento write FNrDocumento;

    [TColumn('DSUNIDADE','Unidade',400,[ldGrid], True, 'Unidade', 'idUnidade', 'idUnidade')]
    property Descricao: string  read FDescricao write FDescricao;

    [TColumn('VlValor','Valor',100,[ldGrid,ldLookup,ldComboBox], False)]
    property VlValor: Currency  read FVlValor write FVlValor;
    [TColumn('DsComplemento','Complemento',0,[ldLookup,ldComboBox], False)]
    property DsComplemento: String  read FDsComplemento write FDsComplemento;
    [TColumn('IdHistorico','Hist�rico',0,[ldLookup,ldComboBox], False)]
    property IdHistorico: integer  read FIdHistorico write FIdHistorico;
    [TColumn('IdUnidade','Unidade',0,[ldLookup,ldComboBox], False)]
    property IdUnidade: integer  read FIdUnidade write FIdUnidade;
    [TColumn('FlBaixa','Situa��o',10,[ldGrid,ldLookup,ldComboBox], False)]
    property FlBaixa: String  read FFlBaixa write FFlBaixa;
    [TColumn('IdConta','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdConta: Integer  read FIdConta write FIdConta;
    [TColumn('IdCondominio','Id Condominio',0,[ldLookup,ldComboBox], False)]
    property IdCondominio: Integer  read FIdCondominio write FIdCondominio;
//    [TColumn('IdPessoa','Id Pessoa',50,[ldLookup,ldComboBox], False)]
//    property IdPessoa: Integer  read FIdPessoa write FIdPessoa;
    [TColumn('IdContraPartida','Id Contra Partida',0,[ldLookup,ldComboBox], False)]
    property IdContraPartida: Integer  read FIdContraPartida write FIdContraPartida;

    [TColumn('VlBaixa','Valor',100,[ldLookup,ldComboBox], False)]
    property VlBaixa: Currency  read FVlBaixa write FVlBaixa;
    [TColumn('VlJuros','Juros',100,[ldLookup,ldComboBox], False)]
    property VlJuros: Currency  read FVlJuros write FVlJuros;
    [TColumn('VlMulta','Multa',100,[ldLookup,ldComboBox], False)]
    property VlMulta: Currency  read FVlMulta write FVlMulta;
    [TColumn('VlDesconto','Desconto',100,[ldLookup,ldComboBox], False)]
    property VlDesconto: Currency  read FVlDesconto write FVlDesconto;
    [TColumn('DtBaixa','Data Baixa',50,[ldLookup,ldComboBox], False)]
    property DtBaixa: TDateTime  read FDtBaixa write FDtBaixa;
    [TColumn('IdContaBaixa','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdContaBaixa: Integer  read FIdContaBaixa write FIdContaBaixa;
    [TColumn('IdHistoricoBx','Id Conta',0,[ldLookup,ldComboBox], False)]
    property IdHistoricoBx: Integer  read FIdHistoricoBx write FIdHistoricoBx;
    [TColumn('VlPago','Valor Pago',100,[ldLookup,ldComboBox], False)]
    property VlPago: Currency  read FVlPago write FVlPago;



    procedure ValidarCampos;
    procedure ValidarBaixa;



  end;

implementation






procedure TContasReceberVO.ValidarBaixa;
begin
 if (Self.FDtBaixa = 0)  then
   raise Exception.Create('O campo Data Baixa � obrigat�rio!');
  if ((Self.FVlBaixa <= 0) or (self.FVlBaixa <> self.VlValor)) then
    raise Exception.Create('O campo Valor Baixa � obrigat�rio e n�o pode ser diferente que o valor!');
  if ( Self.FVlPago<=0) then
    raise Exception.Create('O campo Valor  � obrigat�rio!');
  if (self.FDtBaixa < self.DtCompetencia) then
    raise Exception.Create('A data da baixa n�o pode ser menor que a data de competencia!');
  if (Self.FIdContaBaixa = 0) then
    raise Exception.Create('O campo Conta � obrigat�rio!');

  if Self.vlpago > self.vlvalor then
  begin
    if ((self.vlbaixa + Self.VlJuros + self.VlMulta - self.VlDesconto) <> self.VlPago) then
    raise Exception.Create('Valor n�o confere!');
  end
  else if Self.VlPago < self.VlValor then
  begin
    if ((self.VlPago + self.vldesconto) <> self.vlValor) then
    raise Exception.Create('Valor n�o confere');
  end;
end;

procedure TContasReceberVO.ValidarCampos;
begin
  if (Self.FDtCompetencia = 0 ) then
   raise Exception.Create('O campo Data Competencia � obrigat�rio!');
  if (Self.FNrDocumento= '') then
    raise Exception.Create('O campo Documento � obrigat�rio!');
  if (Self.FDtVencimento = 0) then
   raise Exception.Create('O campo Data Vencimento � obrigat�rio!');
  if (Self.FVlValor<= 0) then
    raise Exception.Create('O campo Valor � obrigat�rio!');
  if (Self.FDtVencimento < self.FDtCompetencia) then
    raise Exception.Create('A data de Competencia deve ser menor que a data de Vencimento!');
end;


end.

