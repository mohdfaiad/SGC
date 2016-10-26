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

  public

    ContaDebitoVo : TPlanoContasVO;
    ContaCreditoVO : TPlanoContasVO;
    ContasReceberVO : TContasReceberVO;
    ContasPagarVo : TContasPagarVO;
    HistoricoVO : THistoricoVO;
    LoteVO : TLoteVo;
    CondominioVO : TCondominioVO;



    [TId('idLote')]
    [TGeneratedValue(sAuto)]
    property idLote : Integer  read FidLote write FidLote;

    [TColumn('dtLcto','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtLcto: TDateTime  read FdtLcto write FdtLcto;

    [TColumn('nrLote','Lote',50,[ldGrid,ldLookup,ldComboBox], False)]
    property nrLote: String  read FnrLote write FnrLote;

    [TColumn('dsLote','Descrição',400,[ldGrid,ldLookup,ldComboBox], False)]
    property dsLote: string  read FdsLote write FdsLote;

    [TColumn('idCondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;


    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TLoteVO.ValidarCamposObrigatorios;
begin
  if (self.FDtLote = 0) then
  begin
    raise Exception.Create('O campo Data é obrigatório!');
  end;
  if (Self.FnrLote = '') then
  begin
    raise Exception.Create('O campo Lote é obrigatório!');
  end;
end;
end.

