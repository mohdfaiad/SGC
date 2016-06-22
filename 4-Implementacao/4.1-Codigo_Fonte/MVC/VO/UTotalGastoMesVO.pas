unit UTotalGastoMesVO;


interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCnaeVO, UCidadeVO, UEstadoVO, UPaisVO;

type
  [TEntity]
  [TTable('TotalGastoMes')]
  TTotalGastoMesVO = class(TGenericVO)
  private
    FidTotalGastoMes: Integer;
    FdtMesAno : TdateTime;
    FvlTotal : string;
    FidCondominio: Integer;
  public

    [TId('idtotalgastomes')]
    [TGeneratedValue(sAuto)]
    property idProprietario: Integer  read FidTotalGastoMes write FidTotalGastoMes;
    [TColumn('vltotal','Valor Total',50,[ldGrid,ldLookup,ldComboBox], False)]
    property vlTotal: string  read FvlTotal write FvlTotal;
    [TColumn('dtMesAno','Data Inicio',0,[ldLookup,ldComboBox], False)]
    property dtMesAno: TDateTime  read FdtMesAno write FdtMesAno;

    Function ValidarCamposObrigatorios:boolean;

  end;

  implementation

  { TProprietarioUnidadeVO }

function TTotalGastoMesVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.Fidtotalgastomes = 0) then
  begin
    raise Exception.Create('O campo Total Gasto Mês é obrigatório!');
    Result := false;
  end
  else if (self.FdtMesAno = 0) then
    raise Exception.Create('O campo data é obrigatório!');
    Result := false;
end;

end.

