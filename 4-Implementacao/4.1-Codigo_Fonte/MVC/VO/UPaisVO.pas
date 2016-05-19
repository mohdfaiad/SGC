unit UPaisVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('Pais')]
  TPaisVO = class(TGenericVO)

  private
    FidPais: Integer;
    Fnome: String;

    //FidCidade: integer;

  public
    [TId('idPais')]
    [TGeneratedValue(sAuto)]
    property idPais: Integer  read FidPais write FidPais;

    [TColumn('NOME','Nome',250,[ldGrid], False)]
    property Nome: String  read Fnome write Fnome;

  end;

implementation


{ TPaisVO }



end.
