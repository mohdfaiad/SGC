unit ULancamentoPadraoVO;

interface

uses Atributos, Classes, Constantes, Generics.Collections, SysUtils, UGenericVO,
UPlanoContasVO, UContasReceberVO, UContasPagarVO,UhistoricoVO, ULoteVO, UCondominioVO;

type
  [TEntity]
  [TTable('LancamentoPadrao')]
  TLancamentoPadraoVO = class(TGenericVO)
  private
    FidLctoPadrao : Integer;
    FidContaDebito : Integer;
    FidContaCredito : Integer;
    FidHistorico : Integer;
    Fobservacao : string;

    FDsContaDebito : String;
    FDsContaCredito : String;
    FDsHistorico : String;
    FidCondominio : Integer;
  public

    ContaDebitoVo : TPlanoContasVO;
    ContaCreditoVO : TPlanoContasVO;
    HistoricoVO : THistoricoVO;
    CondominioVO : TCondominioVO;



    [TId('idLctoPadrao')]
    [TGeneratedValue(sAuto)]
    property idLctoPadrao : Integer  read FidLctoPadrao write FidLctoPadrao;

    [TColumn('observacao','Observa��o',200,[ldGrid,ldLookup,ldComboBox], False)]
    property observacao: string  read Fobservacao write Fobservacao;


    [TColumn('idcontadebito','D�bito',20,[ldGrid,ldLookup,ldComboBox], False)]
    property idcontadebito: integer  read FidContaDebito write FidContaDebito;

    [TColumn('DSCONTADEBITO','Descri��o',150,[ldGrid], True, 'PlanoContas', 'idContaDebito', 'idPlanoContas', 'PlanoDebito', 'DSCONTA')]
    property DsContaDebito: string  read FDsContaDebito write FDsContaDebito;

    [TColumn('idcontacredito','Cr�dito',20,[ldGrid,ldLookup,ldComboBox], False)]
    property idContaCredito: integer  read FidContaCredito write FidContaCredito;

    [TColumn('DSCONTACREDITO','Descri��o',150,[ldGrid], True, 'PlanoContas', 'idContaCredito', 'idPlanoContas', 'PlanoCredito', 'DSCONTA')]
    property DsContaCredito: string  read FDsContaCredito write FDsContaCredito;

    [TColumn('idHistorico','Historico',10,[ldGrid,ldLookup,ldComboBox], False)]
    property idHistorico: integer  read FIdHistorico write FIdHistorico;



    [TColumn('DSHISTORICO','',0,[], True, 'Historicos', 'idHistorico', 'idHistorico')]
    property DsHistorico: string  read FDsHistorico write FDsHistorico;

    [TColumn('idCondominio','Condom�nio',0,[ldLookup,ldComboBox], False)]
    property idCondominio: integer  read FidCOndominio write FidCondominio;

    procedure ValidarCamposObrigatorios;

  end;
implementation



{ TLancamentoContabilVO }

procedure TLancamentoPadraoVO.ValidarCamposObrigatorios;
begin
  if ((self.FidContaDebito = 0) or (self.idContaCredito = 0))then
  begin
      raise Exception.Create('O campo Conta d�bito ou conta cr�dito  � obrigat�rio!');
  end;

  if (Self.Fobservacao = '') then
  begin
    raise Exception.Create('O campo Observa��o � obrigat�rio!');
  end;

  if (Self.FidHistorico = 0) then
  begin
    raise Exception.Create('O campo Hist�rico � obrigat�rio!');
  end;
end;

end.

