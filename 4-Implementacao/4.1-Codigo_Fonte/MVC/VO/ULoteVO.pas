unit ULoteVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UCondominioVO;

type
  [TEntity]
  [TTable('Lote')]
  TLoteVO = class(TGenericVO)
  private
    FidLote : Integer;
    FdtLote : TDateTime;
    FnrLote : String;
    FdsLote : String;
    FidCondominio : Integer;

  public

    CondominioVO : TCondominioVO;




    [TId('idLote')]
    [TGeneratedValue(sAuto)]
    property idLote : Integer  read FidLote write FidLote;

    [TColumn('dtLote','Data',0,[ldGrid,ldLookup,ldComboBox], False)]
    property dtLote: TDateTime  read FdtLote write FdtLote;

    [TColumn('nrLote','Lote',50,[ldGrid,ldLookup,ldComboBox], False)]
    property nrLote: String  read FnrLote write FnrLote;

    [TColumn('dsLote','Descrição',600,[ldGrid,ldLookup,ldComboBox], False)]
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

