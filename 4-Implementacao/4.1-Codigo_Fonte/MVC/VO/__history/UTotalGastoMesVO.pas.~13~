unit UTotalGastoMesVO;
//mapeamento
interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCnaeVO, UCidadeVO, UEstadoVO, UPaisVO;

type
  [TEntity]
  [TTable('TotalGastoMes')]
  TTotalGastoMesVO = class(TGenericVO)
  private
    FidTotalGastoMes: Integer;
    FdtMesAno : TdateTime;
    FvlTotal : currency;
    FidCondominio: Integer;
  public

    [TId('idtotalgastomes')]
    [TGeneratedValue(sAuto)]
    property idTotalGastoMes: Integer  read FidTotalGastoMes write FidTotalGastoMes;
    [TColumn('vltotal','Valor Total',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlTotal: currency  read FvlTotal write FvlTotal;
    [TColumn('dtMesAno','Data Inicio',0,[ldLookup,ldComboBox], False)]
    property dtMesAno: TDateTime  read FdtMesAno write FdtMesAno;
    [TColumn('idcondominio','Condominio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCondominio write FidCondominio;


    procedure ValidarCampos;

  end;

  implementation

  { TProprietarioUnidadeVO }

procedure TTotalGastoMesVO.ValidarCampos;
begin
  if (Self.FvlTotal = 0) then
  begin
    raise Exception.Create('O campo Total Gasto Mês é obrigatório!');
  end
  else if (self.FdtMesAno = 0) then
  begin
    raise Exception.Create('O campo data é obrigatório!');
  end;

end;

end.

