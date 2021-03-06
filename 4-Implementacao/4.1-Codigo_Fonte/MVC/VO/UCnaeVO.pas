unit UCnaeVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('Cnae')]
  TCnaeVO = class(TGenericVO)

  private
    FidCnae: Integer;
    FcodigoCnae : String;
    Fdescricao: String;

  public
    [TId('idCnae')]
    [TGeneratedValue(sAuto)]
    property idCnae: Integer  read FidCnae write FidCnae;
    [TColumn('CODIGOCNAE','Cnae',80,[ldGrid], False)]
    [TFormatter(ftCnae, taLeftJustify)]
    property codigoCnae: String  read FcodigoCnae write FcodigoCnae;
    [TColumn('DESCRICAO','Descri��o',500,[ldGrid], False)]
    property descricao: String  read Fdescricao write Fdescricao;

    function ValidarCamposObrigatorios:boolean;
  end;

implementation

{ TCnaeVO }

function TCnaeVO.ValidarCamposObrigatorios: boolean;
begin
  Result := true;
  if (Self.FcodigoCnae = '') then
  begin
    raise Exception.Create('O campo Cnae � obrigat�rio!');
    Result := false;
  end
  else if (Self.Fdescricao = '') then
  begin
    raise Exception.Create('O campo Descri��o � obrigat�rio!');
    Result := false;
  end;
end;

end.
