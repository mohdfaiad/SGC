unit UContaCorrenteVO;


interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,
   UCondominioVO, UContasReceberVO, ULancamentoContabilVO;

type
  [TEntity]
  [TTable('ContaCorrente')]
  TContaCorrenteVO = class(TGenericVO)
  private
    FidContaCorrente : Integer;
    FidContasReceber : Integer;
    FidLcto : Integer;

  public
    ContasReceverVo : TContasReceberVo;
    LctoVO : TLancamentoCOntabilVO;


    [TId('idContaCorrente')]
    [TGeneratedValue(sAuto)]
    property FdContaCorrente : Integer  read FidContaCorrente write FidContaCorrente;

    [TColumn('idContasReceber','CR',0,[ldGrid,ldLookup,ldComboBox], False)]
    property idContasReceber: integer  read FidContasReceber write FidContasReceber;

    [TColumn('idLcto','IdLcto',0,[ldLookup,ldComboBox], False)]
    property idLcto: integer  read FidLcto write FidLcto;

    procedure ValidarCamposObrigatorios;

  end;
implementation


procedure TContaCorrenteVO.ValidarCamposObrigatorios;
begin
end;
end.

