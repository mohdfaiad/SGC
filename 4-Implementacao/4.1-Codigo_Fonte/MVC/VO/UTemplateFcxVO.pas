unit UTemplateFcxVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO, UCondominioVO;

type
  [TEntity]
  [TTable('TemplateFcx')]
  TTemplateFcxVO = class(TGenericVO)
  private
    FidFcx : Integer;
    FidTemplate : Integer;
    Fclassificacao : String;
    FclassificacaoContabil : String;
    FflTipo : String;
    Flinha : String;
    FlinhaTotal : string;
    FidCondominio : Integer;
    Fdescricao : String;
  public

    CondominioVO : TCondominioVO;



    [TId('idFcx')]
    [TGeneratedValue(sAuto)]
    property idFcx : Integer  read FidFcx write FidFcx;

    [TColumn('idTemplate','Template',0,[ldGrid,ldLookup,ldComboBox], False)]
    property idTemplate: Integer  read FidTemplate write FidTemplate;

    [TColumn('classificacao','Classificação',150,[ldGrid,ldLookup,ldComboBox], False)]
    property Classificacao: string  read FClassificacao write FClassificacao;

    [TColumn('classificacaocontabil','Classificação Contábil',150,[ldGrid,ldLookup,ldComboBox], False)]
    property ClassificacaoContabil: string  read FClassificacaoContabil write FClassificacaoContabil;

    [TColumn('descricao','Descrição',450,[ldGrid,ldLookup,ldComboBox], False)]
    property descricao: string  read Fdescricao write Fdescricao;

    [TColumn('flTipo','Tipo',10,[ldLookup,ldComboBox], False)]
    property flTipo: string  read FflTipo write FflTipo;

    [TColumn('idCondominio','Condomínio',0,[ldLookup,ldComboBox], False)]
    property idcondominio: integer  read Fidcondominio write Fidcondominio;

    [TColumn('linha','Linha',10,[ldLookup,ldComboBox], False)]
    property linha: string  read Flinha write Flinha;

    [TColumn('linhatotal','Linhas Totalizadoras',10,[ldLookup,ldComboBox], False)]
    property linhatotal: string  read Flinhatotal write Flinhatotal;

    procedure ValidarCamposObrigatorios;

  end;
implementation



procedure TTemplateFcxVO.ValidarCamposObrigatorios;
begin
  if (self.FidTemplate = 0) then
  begin
    raise Exception.Create('O campo Descrição é obrigatório!');
  end;
  if (Self.Fclassificacao = '') then
  begin
    raise Exception.Create('O campo Classificação é obrigatório!');
  end;
  if (self.Fdescricao = '') then
  begin
    raise Exception.Create('O campo Descrição é obrigatório!');
  end;
  if (self.FflTipo = '') then
  begin
    raise Exception.Create('O campo Tipo é obrigatório!');
  end;
end;

end.
