unit UItensLeituraGasVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UUnidadeVO;

type
  [TEntity]
  [TTable('ItensLeituraGas')]
  TItensLeituraGasVO = class(TGenericVO)
  private
    FidItensLeituraGas : Integer;
    FidLeituraGas : Integer;
    FidUnidade : Integer;
    FvlMedido : currency;
    FvlCalculado : currency;
    FdtLeitura : TDateTime;
    FdsUnidade : String;

  public
    UnidadeVO : TUnidadeVO;

    [TId('idItensLeituraGas')]
    [TGeneratedValue(sAuto)]
    property idItensLeituraGas : Integer  read FidItensLeituraGas write FidItensLeituraGas;

    [TColumn('idLeituraGas','Leitura Gás',0,[ldLookup,ldComboBox], False)]
    property idLeituraGas: integer  read FidLeituraGas write FidLeituraGas;

    [TColumn('dtLeitura','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtLeitura: TDateTime  read FdtLeitura write FdtLeitura;

    [TColumn('idUnidade','Unidade',0,[ldLookup,ldComboBox], False)]
    property idUnidade: integer  read FidUnidade write FidUnidade;

    [TColumn('vlMedido','Valor Medido',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlMedido: currency  read FvlMedido write FvlMedido;

    [TColumn('vlCalculado','Valor Calculado',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlCalculado: currency  read FvlCalculado write FvlCalculado;

    [TColumn('DSUNIDADE','Unidade',0,[], True, 'Unidade', 'idUnidade', 'idUnidade')]
    property DsUnidade: string  read FdsUnidade write FdsUnidade;


    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TItensLeituraGasVO.ValidarCamposObrigatorios;
begin
  if (self.dtLeitura = 0) then
  begin
    raise Exception.Create('O campo Data é obrigatório!');
  end;
    if (self.vlMedido < 0) then
  begin
    raise Exception.Create('O campo Valor Medido é obrigatório!');
  end;
end;
end.


