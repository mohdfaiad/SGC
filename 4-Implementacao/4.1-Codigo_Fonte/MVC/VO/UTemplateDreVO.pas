unit UTemplateDreVO;


interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UCondominioVO;

type
  [TEntity]
  [TTable('TemplateDre')]
  TTemplateDreVO = class(TGenericVO)
  private
    FidDre : Integer;
    FidTemplate : Integer;
    Fclassificacao : String;
    FflTipo : String;
    Fordem : String;
    Ftotal : string;
    FidCondominio : Integer;
    Fdescricao : String;
  public

    CondominioVO : TCondominioVO;



    [TId('idDre')]
    [TGeneratedValue(sAuto)]
    property idDre : Integer  read FidDre write FidDre;

    [TColumn('idTemplate','Template',0,[ldGrid,ldLookup,ldComboBox], False)]
    property idTemplate: Integer  read FidTemplate write FidTemplate;

    [TColumn('classificacao','Classifica��o',200,[ldGrid,ldLookup,ldComboBox], False)]
    property Classificacao: string  read FClassificacao write FClassificacao;

    [TColumn('descricao','Descri��o',400,[ldGrid,ldLookup,ldComboBox], False)]
    property descricao: string  read Fdescricao write Fdescricao;

    [TColumn('flTipo','Tipo',10,[ldLookup,ldComboBox], False)]
    property flTipo: string  read FflTipo write FflTipo;

    [TColumn('idCondominio','Condom�nio',0,[ldLookup,ldComboBox], False)]
    property idcondominio: integer  read Fidcondominio write Fidcondominio;

    [TColumn('ordem','Ordem',10,[ldLookup,ldComboBox], False)]
    property ordem: string  read Fordem write Fordem;

    [TColumn('total','Total',10,[ldLookup,ldComboBox], False)]
    property total: string  read Ftotal write Ftotal;

    procedure ValidarCamposObrigatorios;

  end;
implementation



procedure TTemplateDreVO.ValidarCamposObrigatorios;
begin
  if (self.FidTemplate = 0) then
  begin
    raise Exception.Create('O campo C�digo � obrigat�rio!');
  end;
  if (Self.Fclassificacao = '') then
  begin
    raise Exception.Create('O campo Classifica��o � obrigat�rio!');
  end;
  if (Self.Fordem = '' )then
  begin
    raise Exception.Create('O campo Ordem � obrigat�rio!');
  end;
  if (self.Fdescricao = '') then
  begin
    raise Exception.Create('O campo Descri��o � obrigat�rio!');
  end;
  if (self.FflTipo = '') then
  begin
    raise Exception.Create('O campo Tipo � obrigat�rio!');
  end;
end;
end.

