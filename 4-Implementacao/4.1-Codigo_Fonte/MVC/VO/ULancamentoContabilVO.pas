unit ULancamentoContabilVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,
UPlanoContasVO, UContasReceberVO, UContasPagarVO,UhistoricoVO, ULoteVO, UCondominioVO, ULancamentoPadraoVO;

type
  [TEntity]
  [TTable('LancamentoContabil')]
  TLancamentoContabilVO = class(TGenericVO)
  private
    FidLcto : Integer;
    FdtLcto : TDateTime;
    FVlValor : currency;
    FComplemento : String;
    FidContaDebito : Integer;
    FidContaCredito : Integer;
    FidContasReceber : Integer;
    FidContasPagar : Integer;
    FidHistorico : Integer;
    FidLote : Integer;

    FDsContaDebito : String;
    FDsContaCredito : String;
    FDsHistorico : String;

  public

    ContaDebitoVo : TPlanoContasVO;
    ContaCreditoVO : TPlanoContasVO;
    ContasReceberVO : TContasReceberVO;
    ContasPagarVo : TContasPagarVO;
    HistoricoVO : THistoricoVO;
    LoteVO : TLoteVo;
    CondominioVO : TCondominioVO;
    LctoPadraoVo : TLancamentoPadraoVO;



    [TId('idLcto')]
    [TGeneratedValue(sAuto)]
    property idLcto : Integer  read FidLcto write FidLcto;

    [TColumn('dtLcto','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtLcto: TDateTime  read FdtLcto write FdtLcto;

    [TColumn('vlValor','Valor',30,[ldGrid,ldLookup,ldComboBox], False)]
    property VlValor: Currency  read FVlValor write FVlValor;

    [TColumn('dscomplemento','Complemento',80,[ldGrid,ldLookup,ldComboBox], False)]
    property complemento: string  read FComplemento write Fcomplemento;

    [TColumn('idcontacredito','Cr�dito',0,[ldLookup,ldComboBox], False)]
    property idContaCredito: integer  read FidContaCredito write FidContaCredito;

    [TColumn('idcontadebito','D�bito',0,[ldLookup,ldComboBox], False)]
    property idcontadebito: integer  read FidContaDebito write FidContaDebito;

    [TColumn('idcontasreceber','ContasReceber',0,[ldLookup,ldComboBox], False)]
    property idContasReceber: integer  read FidContasReceber write FidContasReceber;

    [TColumn('idcontaspagar','ContasPagar',0,[ldLookup,ldComboBox], False)]
    property idContasPagar: integer  read FidContasPagar write FidContasPagar;

    [TColumn('idlote','idLote',0,[ldLookup,ldComboBox], False)]
    property idLote: integer  read FIdLote write FIdLote;

    [TColumn('idHistorico','idHistorico',0,[ldLookup,ldComboBox], False)]
    property idHistorico: integer  read FIdHistorico write FIdHistorico;

    [TColumn('DSCONTADEBITO','ContaDebito',0,[], True, 'PlanoContas', 'idContaDebito', 'idPlanoContas', 'PlanoDebito', 'DSCONTA')]
    property DsContaDebito: string  read FDsContaDebito write FDsContaDebito;

    [TColumn('DSCONTACREDITO','ContaCredito',0,[], True, 'PlanoContas', 'idContaCredito', 'idPlanoContas', 'PlanoCredito', 'DSCONTA')]
    property DsContaCredito: string  read FDsContaCredito write FDsContaCredito;

    [TColumn('DSHISTORICO','',0,[], True, 'Historicos', 'idHistorico', 'idHistorico')]
    property DsHistorico: string  read FDsHistorico write FDsHistorico;

    procedure ValidarCamposObrigatorios;

  end;
implementation



{ TLancamentoContabilVO }

procedure TLancamentoContabilVO.ValidarCamposObrigatorios;
begin
  if (self.FDtLcto = 0) then
  begin
    raise Exception.Create('O campo Data � obrigat�rio!');
  end;
  if ((self.FidContaDebito = 0) and (self.idContaCredito = 0))then
  begin
      raise Exception.Create('O campo Conta d�bito ou conta cr�dito  � obrigat�rio!');
  end;
  if (Self.FidHistorico = 0) then
  begin
    raise Exception.Create('O campo Hist�rico � obrigat�rio!');
  end;
  if (Self.FVlValor <= 0) then
  begin
     raise Exception.Create('O campo Valor � obrigat�rio!');
  end;
end;

end.

