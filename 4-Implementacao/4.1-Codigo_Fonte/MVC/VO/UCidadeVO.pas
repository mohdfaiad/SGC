unit UCidadeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UPaisVO, UEstadoVO;

type
  [TEntity]
  [TTable('Cidade')]
  TCidadeVO = class(TGenericVO)

  private
    FIdCidade: Integer;
    FnomeCidade: String;
    FIdEstado : Integer;
    FIdPais : Integer;

  public
    PaisVO: TPAISVO;
    EstadoVO : TESTADOVO;

    [TId('idCidade')]
    [TGeneratedValue(sAuto)]
    property idCidade: Integer  read FIdCidade write FIdCidade;
    [TColumn('nome','Cidade',250,[ldGrid], False)]
    property NomeCidade: String  read FnomeCidade write FnomeCidade;

    [TColumn('idEstado','idEstado',0,[ldLookup,ldComboBox], False)]
    property idEstado: integer  read FIdEstado write FIdEstado;

    [TColumn('idPais','idPais',0,[ldLookup,ldComboBox], False)]
    property idPais: integer  read FIdPais write FIdPais;

  end;

implementation




end.
