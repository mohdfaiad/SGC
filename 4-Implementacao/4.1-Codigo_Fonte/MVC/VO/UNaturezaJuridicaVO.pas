unit UNaturezaJuridicaVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('NaturezaJuridica')]
  TNaturezaJuridicaVO = class(TGenericVO)

  private
    FidNatureza: Integer;
    FcodigoNatureza : String;
    Fdescricao: String;

  public
    [TId('idNatureza')]
    [TGeneratedValue(sAuto)]
    property idNatureza: Integer  read FidNatureza write FidNatureza;
    [TColumn('CODIGONATUREZA','Nat. Jurídica',50,[ldGrid], False)]
    property codigoNatureza: String  read FcodigoNatureza write FcodigoNatureza;
    [TColumn('DESCRICAO','Descrição',400,[ldGrid], False)]
    property descricao: String  read Fdescricao write Fdescricao;


    function ValidarCamposObrigatorios:boolean;
  end;

implementation

{ TNaturezaJuridicaVO }

function TNaturezaJuridicaVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.FcodigoNatureza = '') then
  begin
    raise Exception.Create('O campo Natureza Jurídica é obrigatório!');
    Result := false;
  end
  else if (Self.Fdescricao = '') then
  begin
    raise Exception.Create('O campo Descrição é obrigatório!');
    Result := false;
  end;
end;

end.
