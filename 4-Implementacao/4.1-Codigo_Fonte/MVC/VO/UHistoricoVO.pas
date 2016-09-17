unit UHistoricoVO;


interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('Historicos')]
  THistoricoVO = class(TGenericVO)
  private
    FIdHistorico : Integer;
    FDsHistorico : String;
    FFlContaCorrente : String;
  public

    [TId('IdHistorico')]
    [TGeneratedValue(sAuto)]
    property idHistorico : Integer  read FIdHistorico write FIdHistorico;
    [TColumn('DsHistorico','Descrição',250,[ldGrid,ldLookup,ldComboBox], False)]
    property DsHistorico: String  read FDsHistorico write FDsHistorico;
    [TColumn('FlContaCorrente','Conta Corrente',0,[ ldLookup,ldComboBox], False)]
    property FlContaCorrente : String  read FFlContaCorrente write FFlContaCorrente;


    Procedure ValidarCamposObrigatorios;

  end;
implementation


{ THistoricoVO }

procedure THistoricoVO.ValidarCamposObrigatorios;
begin
  if (Self.FDsHistorico = '') then
    raise Exception.Create('O campo Descrição é obrigatório!');
  if (Self.FFlContaCorrente = '') then
    raise Exception.Create('O campo Conta Corrente é obrigatório!');
end;

end.

