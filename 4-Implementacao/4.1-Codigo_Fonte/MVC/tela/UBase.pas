unit UBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Rtti, Menus,
  ActnList, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;


type
  TFBase = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    function GetCustomKeyPreview: Boolean;
    procedure SetCustomKeyPreview(const Value: Boolean);


  public
    { Public declarations }

    procedure FechaFormulario;
    function TemAcesso(pFuncaoObjeto: string): Boolean;
    procedure VerificaPermissoes;

    property CustomKeyPreview: Boolean read GetCustomKeyPreview write SetCustomKeyPreview default False;


  end;

var
  FBase: TFBase;

implementation

{$R *.dfm}

uses ComCtrls;

procedure TFBase.FormCreate(Sender: TObject);
begin
  VerificaPermissoes;
end;


procedure TFBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Vk_Return then Screen.ActiveForm.Perform(Wm_NextDlgCtl,0,0);
  if Key=Vk_Up then Screen.ActiveForm.Perform(Wm_NextDlgCtl,0,1);

end;

function TFBase.GetCustomKeyPreview: Boolean;
begin
  Result := Self.KeyPreview;
end;

procedure TFBase.SetCustomKeyPreview(const Value: Boolean);
begin
  Self.KeyPreview := Value;
end;


function TFBase.TemAcesso(pFuncaoObjeto: string): Boolean;
begin
end;

procedure TFBase.VerificaPermissoes;
var
  Obj: TObject;
  Habilitar: Boolean;
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Campo: TRttiField;
  Atributo: TCustomAttribute;
begin
{
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(Self.ClassType);

    for Campo in Tipo.GetFields do
    begin
      for Atributo in Campo.GetAttributes do
      begin
        if (Atributo is TComponentDescription) then
        begin
          if Campo.GetValue(Self).IsObject then
          begin
            Obj := Campo.GetValue(Self).AsObject;
            if Obj is TComponent then
            begin

              Habilitar := TemAcesso(TComponent(Obj).Name);

              if Obj is TControl then
              begin
                TControl(Obj).Enabled := Habilitar;

                if Obj is TTabSheet then
                begin
                  TTabSheet(Obj).TabVisible := Habilitar;
                end;
              end
              else if Obj is TAction then
              begin
                TAction(Obj).Enabled := Habilitar;
              end;
            end;
          end;
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;
  }
end;


procedure TFBase.FechaFormulario;
begin
    Self.Close;
end;

end.
