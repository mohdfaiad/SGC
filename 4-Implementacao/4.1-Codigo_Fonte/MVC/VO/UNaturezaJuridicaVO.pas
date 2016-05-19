unit UNaturezaJuridicaVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('NaturezaJuridica')]
  TNaturezaJuridicaVO = class(TGenericVO)

  private
    FidNaturezaJuridica: Integer;
    FcodigoNatureza : String;
    Fdescricao: String;

  public
    [TId('idNaturezaJuridica')]
    [TGeneratedValue(sAuto)]
    property idNaturezaJuridica: Integer  read FidNaturezaJuridica write FidNaturezaJuridica;
    [TColumn('CODIGONATUREZA','Nat. Jurídica',50,[ldGrid], False)]
    property codigoNatureza: String  read FcodigoNatureza write FcodigoNatureza;
    [TColumn('DESCRICAO','Descrição',250,[ldGrid], False)]
    property descricao: String  read Fdescricao write Fdescricao;
  end;

implementation

end.
