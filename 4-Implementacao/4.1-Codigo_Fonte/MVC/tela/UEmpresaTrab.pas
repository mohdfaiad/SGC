unit UEmpresaTrab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  UCondominioController, UCondominio, UCondominioVO, UGenericVO,Generics.Collections, UMVC;

type
  TFormEmpresaTrab = class(TForm)
    Panel1: TPanel;
    LabeledEditCodigo: TLabeledEdit;
    BitBtn1: TBitBtn;
    MaskEditDt: TMaskEdit;
    LabelNomeCond: TLabel;
    LabelCnpj: TLabel;
    BtnAcessar: TBitBtn;
    BtnSair: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnAcessarClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabeledEditCodigoExit(Sender: TObject);

  private
    { Private declarations }

  public
    ctLeituraGas, ctjurosp, ctmultap, ctdescontop, ctjurosr, ctmultar, ctdescontor, ctrateio, ctfundoreserva :integer;
    idhistoricol, idhistoricor, idhistoricof : integer;
    CodigoEmpLogada:integer;
    IdUsuario:integer;
    PrecoGas, fundoreserva, areatotal : Currency;
    DataLog : TDateTime;

    DescricaoEmpLogada,cnpjEmpLogada:String;
  end;

var
  FormEmpresaTrab: TFormEmpresaTrab;
  CondominioController : TCondominioController;
  formcondominioconsulta : TFTelaCadastroCondominio;
implementation

{$R *.dfm}

procedure TFormEmpresaTrab.BitBtn1Click(Sender: TObject);
VAR
ObjRetornoVO : TGenericVO;
begin
  FormCondominioConsulta := TFTelaCadastroCondominio.Create(nil);
  FormCondominioConsulta.FechaForm := true;
  FormCondominioConsulta.ShowModal;
  ObjRetornoVO := condominioController.ConsultarPorId(FormCondominioConsulta.CDSGrid.FieldByName('IDCONDOMINIO').AsInteger);
  FormCondominioConsulta.ObjetoRetornoVO := ObjRetornoVO;
  if (FormCondominioConsulta.ObjetoRetornoVO <> nil) then
  begin
    LabeledEditCodigo.Text:=IntToStr(TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCondominio);
    LabelNomeCond.Caption := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).nome;
    LabelCnpj.Caption := (TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).Cnpjcpf);

    ctjurosp:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtjurosP;
    ctjurosr:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtjuros;
    ctdescontop:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtDesconto;
    ctdescontor:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtDescontoObt;
    ctmultap:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtMultaP;
    ctmultar:= TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtMulta;
    ctleituragas := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idctLeituraGas;
    ctRateio := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idCtRateio;
    ctFundoReserva := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).IdCtFundoReserva;
    fundoReserva := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).FundoReserva;
    areatotal := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).metragem;
    precoGas := 0;
    idhistoricol := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idHistoricoL;
    idhistoricor := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idHistoricoR;
    idhistoricoF := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idHistoricoF;

    if TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).idPrecoGas > 0 then
    begin
        precoGas := TCondominioVO(FormCondominioConsulta.ObjetoRetornoVO).PrecoGasVo.vlGas;
    end;
end;
  FormCondominioConsulta.Release;
end;

procedure TFormEmpresaTrab.BtnAcessarClick(Sender: TObject);
begin
  if (LabeledEditCodigo.Text <> '')  and (MaskEditDt.Text <> '  /  /    ') then
  begin
    CodigoEmpLogada:= strtoint(LabeledEditCodigo.Text);
    DescricaoEmpLogada:= LabelNomeCond.Caption;
    CnpjEmpLogada := LabelCnpj.Caption;
    DataLog := StrToDate(MaskEditDt.Text);
    FormMenu.Caption:= 'SGC - ('+inttostr(codigoEmpLogada)+')     '+DescricaoEmpLogada;
    FormEmpresaTrab.Visible:=false;
    if(FormMenu.Visible=true)then
      FormMenu.SetFocus
    else
      FormMenu.ShowModal;
  end
  else
  begin
    MessageDlg('Condomínio ou data não informado!', mtInformation, [mbOK], 0);
  end;
end;

procedure TFormEmpresaTrab.BtnSairClick(Sender: TObject);
begin
  FormEmpresaTrab.Visible:=false;
  if(FormMenu.Visible=false)then
    FormMenu.ShowModal;
end;

procedure TFormEmpresaTrab.FormShow(Sender: TObject);
begin
  if(codigoEmpLogada>0)then
  begin
    LabeledEditCodigo.Text:=inttostr(CodigoEmpLogada);
    LabelNomeCond.caption:=descricaoEmpLogada;
    LabelCnpj.caption:=cnpjEmpLogada;
  end;
end;

procedure TFormEmpresaTrab.LabeledEditCodigoExit(Sender: TObject);
var
  CondominioController:TCondominioController;
  CondominioVO: TCondominioVO;

begin
  if LabeledEditCodigo.Text <> '' then
  begin
  try
    CondominioController := TCondominioController.Create;
    CondominioVO := CondominioController.ConsultarPorId(StrToInt(LabeledEditCodigo.Text));
    LabelNomeCond.Caption := CondominioVO.nome;
    LabelCnpj.Caption := CondominioVO.Cnpjcpf;

    ctjurosp:= CondominioVO.idCtjurosP;
    ctjurosr:= CondominioVO.idCtjuros;
    ctdescontop:= CondominioVO.idCtDesconto;
    ctdescontor:= CondominioVO.idCtDescontoObt;
    ctmultap:= CondominioVO.idCtMultaP;
    ctmultar:= CondominioVO.idCtMulta;
    ctLeituraGas := CondominioVO.idctLeituraGas;
    ctRateio := CondominioVO.idCtRateio;
    ctFundoReserva := CondominioVO.IdCtFundoReserva;
    fundoreserva := CondominioVO.FundoReserva;
    areatotal := COndominioVO.metragem;

    if CondominioVo.idPrecoGas > 0 then
       PrecoGas := CondominioVO.PrecoGasVo.vlGas;

    CondominioController.Free;
   except
    LabelNomeCond.Caption := '';
    LabelCnpj.Caption := '';
    raise Exception.Create('Código Inválido');
  end;
  end
  else
  begin
    LabeledEditCodigo.Text := '';
  end;

end;

end.
