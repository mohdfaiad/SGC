unit UCondominioVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,UCnaeVO, UNaturezaJuridicaVO;

type
  [TEntity]
  [TTable('Condominio')]
  TCondominioVO = class(TGenericVO)
  private
    FIdCondominio: Integer;
    FCnpj: String;
    FNome: String;
    FCep: String;
    FEndereco: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FEmail: String;
    FTelefoneI: String;
    FTelefoneII: String;
    FMetragem : String;
    FInscricaoMunicipal : String;
    FNomeFantasia : String;
    FRegimeTributario : String;
    FDtInicioAtividade : String;
    FIdCidade : integer;
    FIdEstado : integer;
    FIdPais : integer;
    FIdCnae: integer;
    FIdNatureza : integer;

  public
    CnaeVO: TCnaeVO;
    NaturezaVO : TNaturezaJuridicaVO;
  //CidadeVO : TCidadeVO;

    [TId('idCondominio')]
    [TGeneratedValue(sAuto)]
    property idCondominio: Integer  read FIdCondominio write FIdCondominio;
    [TColumn('cnpj','CNPJ',130,[ldGrid,ldLookup,ldComboBox], False)]
    property Cnpjcpf: String  read FCnpj write FCnpj;
    [TColumn('nome','Nome',250,[ldGrid,ldLookup,ldComboBox], False)]
    property nome : String  read Fnome write Fnome;
    [TColumn('cep','CEP',80,[ldLookup,ldComboBox], False)]
    property Cep: String  read FCep write FCep;
    [TColumn('endereco','Rua',250,[ldLookup,ldComboBox], False)]
    property Endereco: String  read FEndereco write FEndereco;
    [TColumn('numero','numero',50,[ldLookup,ldComboBox], False)]
    property Numero: String  read FNumero write FNumero;
    [TColumn('complemento','complemento',250,[ldLookup,ldComboBox], False)]
    property Complemento: String  read FComplemento write FComplemento;
    [TColumn('bairro','bairro',250,[ldLookup,ldComboBox], False)]
    property Bairro: String  read FBairro write FBairro;
    [TColumn('email','Email',200,[ldGrid,ldLookup,ldComboBox], False)]
    property Email: String  read FEmail write FEmail;
    [TColumn('telefoneI','Tel I',100,[ldGrid,ldLookup,ldComboBox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property TelefoneI: String  read FtelefoneI write FtelefoneI;
    [TColumn('telefoneII','Tel 2',15,[ldLookup,ldComboBox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property TelefoneII: String  read FTelefoneII write FtelefoneII;
    [TColumn('metragem','Metragem',0,[ldLookup,ldComboBox], False)]
    property metragem: string  read FMetragem write FMetragem;
    [TColumn('inscricaoMunicipal','CMC',0,[ldLookup,ldComboBox], False)]
    property inscricaoMunicipal: string  read FInscricaoMunicipal write FInscricaoMunicipal;
    [TColumn('nomeFantasia','Fantasia',0,[ldLookup,ldComboBox], False)]
    property nomeFantasia: string  read FNomeFantasia write FNomeFantasia;
    [TColumn('regimeTributario','Tributa��o',0,[ldLookup,ldComboBox], False)]
    property regimeTributario: string  read FRegimeTributario write FRegimeTributario;
    [TColumn('idCnae','idCnae',0,[ldLookup,ldComboBox], False)]
    property idCnae: integer  read FIdCnae write FIdCnae;
    [TColumn('idNatureza','idNaturezaJuridica',0,[ldLookup,ldComboBox], False)]
    property idNaturezaJuridica: integer  read FIdNatureza write FIdNatureza;

  //  [TColumn('DtInicioAtividade','Inicio Atividade',0,[ldLookup,ldComboBox], False)]
  //  property DtInicioAtividade: string  read FDtInicioAtividade write FDtInicioAtividade;



 //   [TColumn('idCidade','idCidade',0,[ldGrid,ldLookup,ldComboBox], False)]
 //   property IdCidade: integer  read FIdCidade write FIdCidade;
 //   [TColumn('idEstado','idEstado',0,[ldGrid,ldLookup,ldComboBox], False)]
 //   property idEstado: integer  read FIdEstado write FIdEstado;
 //   [TColumn('idPais','idPais',0,[ldGrid,ldLookup,ldComboBox], False)]
 //   property idPais: integer  read FIdPais write FIdPais;

    Function ValidarCamposObrigatorios:boolean;
    Function ValidaCNPJ(xCNPJ: String): Boolean;
    Function ValidaCPF(xCPF: String): Boolean;

  end;
implementation

{ TCondominioVO }

function TCondominioVO.ValidarCamposObrigatorios: boolean;
begin
Result := true;
  if (Self.Fnome = '') then
  begin
    raise Exception.Create('O campo Nome � obrigat�rio!');
    Result := false;
  end
  else if (Self.FCnpj = '') then
  begin
    raise Exception.Create('O campo Cnpj � obrigat�rio!');
    Result := false;
  end;
end;

function TCondominioVO.ValidaCNPJ(xCNPJ: String): Boolean;
Var
  d1, d4, xx, nCount, fator, resto, digito1, digito2: integer;
  Check: String;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(xCNPJ) - 2 do
  begin
    if Pos(Copy(xCNPJ, nCount, 1), '/-.') = 0 then
    begin
      if xx < 5 then
      begin
        fator := 6 - xx;
      end
      else
      begin
        fator := 14 - xx;
      end;
      d1 := d1 + StrToInt(Copy(xCNPJ, nCount, 1)) * fator;
      if xx < 6 then
      begin
        fator := 7 - xx;
      end
      else
      begin
        fator := 15 - xx;
      end;
      d4 := d4 + StrToInt(Copy(xCNPJ, nCount, 1)) * fator;
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(digito1) + IntToStr(digito2);
  if Check <> Copy(xCNPJ, succ(Length(xCNPJ) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

{ Valida o CPF digitado }
function TCondominioVO.ValidaCPF(xCPF: String): Boolean;
Var
  d1, d4, xx, nCount, resto, digito1, digito2: integer;
  Check: String;
Begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(xCPF) - 2 do
  begin
    if Pos(Copy(xCPF, nCount, 1), '/-.') = 0 then
    begin
      d1 := d1 + (11 - xx) * StrToInt(Copy(xCPF, nCount, 1));
      d4 := d4 + (12 - xx) * StrToInt(Copy(xCPF, nCount, 1));
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
  begin
    digito1 := 0;
  end
  else
  begin
    digito1 := 11 - resto;
  end;
  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
  begin
    digito2 := 0;
  end
  else
  begin
    digito2 := 11 - resto;
  end;
  Check := IntToStr(digito1) + IntToStr(digito2);
  if Check <> Copy(xCPF, succ(Length(xCPF) - 2), 2) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

end.