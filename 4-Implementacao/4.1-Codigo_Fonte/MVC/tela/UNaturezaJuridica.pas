unit UNaturezaJuridica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UtelaCadastro, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, UNaturezaJuridicaVO, UController, Generics.Collections;

type
  TFTelaCadastroNaturezaJuridica = class(TFTelaCadastro)
    LabelEditDescricao: TLabeledEdit;
    LabelEditNome: TLabeledEdit;
  private
    { Private declarations }
    procedure GridParaEdits; override;
    function EditsToObject(NaturezaJuridica:TNaturezaJuridicaVo):TNaturezaJuridicaVo;
  public
    { Public declarations }
  end;

var
  FTelaCadastroNaturezaJuridica: TFTelaCadastroNaturezaJuridica;
  NaturezaJuridicaController: TController<TNaturezaJuridicaVo>;

implementation

{$R *.dfm}

{ TFTelaCadastroNaturezaJuridica }

function TFTelaCadastroNaturezaJuridica.EditsToObject(
  NaturezaJuridica: TNaturezaJuridicaVo): TNaturezaJuridicaVo;
begin

end;

procedure TFTelaCadastroNaturezaJuridica.GridParaEdits;
begin
  inherited;

end;

end.
