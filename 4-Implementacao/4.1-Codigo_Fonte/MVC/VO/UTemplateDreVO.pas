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

    [TColumn('classificacao','Classificação',200,[ldGrid,ldLookup,ldComboBox], False)]
    property Classificacao: string  read FClassificacao write FClassificacao;

    [TColumn('descricao','Descrição',400,[ldGrid,ldLookup,ldComboBox], False)]
    property descricao: string  read Fdescricao write Fdescricao;

    [TColumn('flTipo','Tipo',10,[ldLookup,ldComboBox], False)]
    property flTipo: string  read FflTipo write FflTipo;

    [TColumn('idCondominio','Condomínio',0,[ldLookup,ldComboBox], False)]
    property idcondominio: integer  read Fidcondominio write Fidcondominio;

    [TColumn('ordem','Ordem',10,[ldLookup,ldComboBox], False)]
    property ordem: string  read Fordem write Fordem;

    [TColumn('total','Total',10,[ldLookup,ldComboBox], False)]
    property total: string  read Ftotal write Ftotal;

    Function ValidarCamposObrigatorios:boolean;

  end;
implementation



function TTemplateDreVO.ValidarCamposObrigatorios: boolean;
begin
  Result := true;
  {if (Self.FdsConta = '') then
  begin
    raise Exception.Create('O campo Descrição é obrigatório!');
    Result := false;
  end
  else if (self.FnrClassificacao = '') then
  begin
    raise Exception.Create('O campo Classificação é obrigatório!');
    Result := false;
  end;    }
end;
end.

