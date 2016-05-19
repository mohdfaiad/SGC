unit UDMServer;

interface

uses

  System.SysUtils,  Data.DB,
  Vcl.Forms, Vcl.Dialogs, System.Classes, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADGUIxFormsWait, uADCompGUIx, uADPhysIB, uADCompClient,
  uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager, uADCompDataSet;

type

  TDMServer = class(TDataModule)
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADConnection: TADConnection;
    ADQueryErro: TADQuery;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    NomeBancoDados, ClienteBco,Servidor,VersaoFB : String;

    procedure ConectaBco(Login: Boolean; Usuario, Senha, config : String);


  end;

var

  DMServer: TDMServer;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}


{$R *.dfm}


procedure TDMServer.ConectaBco(Login: Boolean; Usuario, Senha, config : String);
var
    p1,p2 : integer;
    Lista : TStringList;

begin

  Lista:=TStringList.Create;

  If FileExists('fbclient.dll') then
    ClienteBco:=ExtractFilePath(Application.ExeName)+'fbclient.dll'
  else begin
      ShowMessage('Arquivo FBCLIENT.DLL não encontrado...');
      Abort;
  end;

  If FileExists(config) then
  begin

    try Lista.Clear;
        Lista.LoadFromFile(config);
        NomeBancoDados:=Lista[0];
    except;
    end;

    Servidor:='';

    if Pos('/',NomeBancoDados)<>0 then begin
      p1:=Pos(':',NomeBancoDados);
      Servidor:=Copy(NomeBancoDados,1,p1-1);
      NomeBancoDados:=Copy(NomeBancoDados,p1+1,Length(NomeBancoDados)-p1);
    end
    else begin
      p1:=Pos(':',NomeBancoDados);
      p2:=Pos(':',Copy(NomeBancoDados,p1+1,Length(NomeBancoDados)-p1));
      if p2<>0 then begin
        Servidor:=Copy(NomeBancoDados,1,p1-1);
        NomeBancoDados:=Copy(NomeBancoDados,p1+1,Length(NomeBancoDados)-p1);
      end;
    end;
  end
  else begin
      ShowMessage('Arquivo configuração destino do banco não encontrado...');
      Abort;
  end;

  ADPhysIBDriverLink1.DriverID:='IB';
  ADPhysIBDriverLink1.VendorLib:=ClienteBco;

  ADConnection.LoginPrompt:=False;
  ADConnection.Params.Text:='';
  ADConnection.Params.Add('SQLDialect=1');
  ADConnection.Params.Add('Protocol=TCPIP');
  ADConnection.Params.Add('Server='+Servidor);
  ADConnection.Params.Add('DataBase='+NomeBancoDados);
  ADConnection.Params.Add('DriverID=IB');
  ADConnection.Params.Add('User_Name='+Usuario);
  ADConnection.Params.Add('password='+Senha);

  try
    ADConnection.Connected:=True;
  except
      on e: Edatabaseerror do begin
        if UpperCase(Copy(e.Message, 20, 43)) = 'YOUR USER NAME AND PASSWORD ARE NOT DEFINED'
        then begin
          ShowMessage('Usuário não cadastrado no sistema ou senha invalida');
          Abort;
        end
        else begin
          ShowMessage(e.message);
          Abort;
        end;
      end;
  end;

  Lista.Free;

end;


procedure TDMServer.DataModuleCreate(Sender: TObject);
begin

  DMServer.ADConnection.Connected:=False;
  DMServer.ADConnection.Params.Clear;
  DMServer.ADConnection.LoginPrompt:=False;

end;



end.
