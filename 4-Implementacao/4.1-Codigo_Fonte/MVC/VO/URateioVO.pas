unit URateioVO;


interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,
   UCondominioVO,UItensRateioVO;

type
  [TEntity]
  [TTable('Rateio')]
  TRateioVO = class(TGenericVO)
  private
    FidRateio : Integer;
    FTotalRateio : currency;
    FdtRateio : TDateTime;
    FidCondominio : Integer;

  public
    CondominioVO : TCondominioVO;

    ItensRateio: TObjectList<TItensRateioVO>;

    [TId('idRateio')]
    [TGeneratedValue(sAuto)]
    property idRateio : Integer  read FidRateio write FidRateio;

    [TColumn('dtRateio','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtRateio: TDateTime  read FdtRateio write FdtRateio;

    [TColumn('TotalRateio','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property TotalRateio: Currency  read FTotalRateio write FTotalRateio;

    [TColumn('idCondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;

    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TRateioVO.ValidarCamposObrigatorios;
begin
  if (self.dtRateio = 0) then
  begin
    raise Exception.Create('O campo Data � obrigat�rio!');
  end;
end;
end.

