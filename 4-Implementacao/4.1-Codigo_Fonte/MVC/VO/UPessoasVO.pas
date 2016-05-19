unit UPessoasVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO;

type
  [TEntity]
  [TTable('Pessoa')]
  TPessoasVO = class(TGenericVO)
  private
    FidPessoa: Integer;
    FcpfCnpj: String;
    Fnome: String;
    Fcep: String;
    FEndereco: String;
    Fnumero: String;
    Fcomplemento: String;
    Fbairro: String;
    Femail: String;
    FtelefoneI: String;
    FtelefoneII: String;
    //FidCidade: integer;

  public
    [TId('idPessoa')]
    [TGeneratedValue(sAuto)]
    property idPessoa: Integer  read FidPessoa write FidPessoa;
    [TColumn('cpfCnpj','CNPJ',50,[ldGrid,ldLookup,ldComboBox], False)]
    property Cnpjcpf: String  read FcpfCnpj write FcpfCnpj;
    [TColumn('nome','Nome',250,[ldGrid,ldLookup,ldComboBox], False)]
    property nome : String  read Fnome write Fnome;
    [TColumn('cep','CEP',10,[ldGrid,ldLookup,ldComboBox], False)]
    property Cep: String  read FCep write FCep;
    [TColumn('endereco','Rua',250,[ldGrid,ldLookup,ldComboBox], False)]
    property Endereco: String  read FEndereco write FEndereco;
    [TColumn('numero','numero',50,[ldGrid,ldLookup,ldComboBox], False)]
    property Numero: String  read FNumero write FNumero;
    [TColumn('complemento','complemento',250,[ldGrid,ldLookup,ldComboBox], False)]
    property Complemento: String  read FComplemento write FComplemento;
    [TColumn('bairro','bairro',250,[ldGrid,ldLookup,ldComboBox], False)]
    property Bairro: String  read FBairro write FBairro;
    [TColumn('email','Email',250,[ldGrid,ldLookup,ldComboBox], False)]
    property Email: String  read FEmail write FEmail;
    [TColumn('telefoneI','Tel 1',15,[ldGrid,ldLookup,ldComboBox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property TelefoneI: String  read FtelefoneI write FtelefoneI;
    [TColumn('telefoneII','Tel 2',15,[ldGrid,ldLookup,ldComboBox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property TelefoneII: String  read FTelefoneII write FtelefoneII;
    //[TColumn('idCidade','idCidade',0,[ldGrid,ldLookup,ldComboBox], False)]
    //property IdCidade: integer  read FIdCidade write FIdCidade;
  end;

implementation


end.
