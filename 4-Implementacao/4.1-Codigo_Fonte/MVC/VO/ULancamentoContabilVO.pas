unit ULancamentoContabilVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,
UPlanoContasVO, UContasReceberVO, UContasPagarVO,UhistoricoVO, ULoteVO, UCondominioVO;

type
  [TEntity]
  [TTable('LancamentoContabil')]
  TLancamentoContabilVO = class(TGenericVO)
  private
    FidLcto : Integer;
    FdtLcto : TDateTime;
    FValor : currency;
    FComplemento : String;
    FidContaDebito : Integer;
    FidContaCredito : Integer;
    FidContasReceber : Integer;
    FidContasPagar : Integer;
    FidHistorico : Integer;
    FidLote : Integer;
    FidCondominio : integer;

  public

    ContaDebitoVo : TPlanoContasVO;
    ContaCreditoVO : TPlanoContasVO;
    ContasReceberVO : TContasReceberVO;
    ContasPagarVo : TContasPagarVO;
    HistoricoVO : THistoricoVO;
    LoteVO : TLoteVo;
    CondominioVO : TCondominioVO;



    [TId('idLcto')]
    [TGeneratedValue(sAuto)]
    property idLcto : Integer  read FidLcto write FidLcto;

    [TColumn('dtLcto','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtLcto: TDateTime  read FdtLcto write FdtLcto;

    [TColumn('valor','Valor',30,[ldGrid,ldLookup,ldComboBox], False)]
    property valor: Currency  read FValor write FValor;

    [TColumn('complemento','Complemento',400,[ldGrid,ldLookup,ldComboBox], False)]
    property complemento: string  read FComplemento write Fcomplemento;

    [TColumn('idCondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;

    [TColumn('idcontacredito','Crédito',0,[ldLookup,ldComboBox], False)]
    property idContaCredito: integer  read FidContaCredito write FidContaCredito;

    [TColumn('idcontadebito','Débito',0,[ldLookup,ldComboBox], False)]
    property idcontadebito: integer  read FidContaDebito write FidContaDebito;

    [TColumn('idcontasreceber','ContasReceber',0,[ldLookup,ldComboBox], False)]
    property idContasReceber: integer  read FidContasReceber write FidContasReceber;

    [TColumn('idcontaspagar','ContasPagar',0,[ldLookup,ldComboBox], False)]
    property idContasPagar: integer  read FidContasPagar write FidContasPagar;

    [TColumn('idlote','idLote',0,[ldLookup,ldComboBox], False)]
    property idLote: integer  read FIdLote write FIdLote;

    [TColumn('idHistorico','idHistorico',0,[ldLookup,ldComboBox], False)]
    property idHistorico: integer  read FIdHistorico write FIdHistorico;

    procedure ValidarCamposObrigatorios;

  end;
implementation



{ TLancamentoContabilVO }

procedure TLancamentoContabilVO.ValidarCamposObrigatorios;
begin


end;

end.

