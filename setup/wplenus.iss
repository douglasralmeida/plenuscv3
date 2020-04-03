; Script para o instalador do Plenus para o INSS
; requer InnoSetup

#define MyAppName "Plenus CV3 para INSS"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Douglas R. Almeida"
#define MyAppURL "https://github.com/douglasralmeida/wpinss"

[Setup]
AllowUNCPath=False
AppId={{A1C11669-69C6-4BAA-BABC-312796C81E8C}
AppName={#MyAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
ArchitecturesInstallIn64BitMode=x64
ChangesAssociations=True
Compression=lzma
DefaultDirName=C:\WPLENUS\
DefaultGroupName=Plenus CV3
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableWelcomePage=False
OutputBaseFilename=plenusinstala
SetupIconFile=..\icons\install.ico
SolidCompression=yes
ShowLanguageDialog=no
UninstallDisplayName=Plenus CV3
UninstallDisplayIcon={app}\plenus.exe
UninstallDisplaySize=6291456
VersionInfoVersion=1.0.0
VersionInfoProductVersion=1.0
WizardImageFile=setupgrande.bmp
WizardSmallImageFile=setuppequeno.bmp

[Files]
Source: "..\PLENUS\AP32_BPS.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_COM.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_HLC.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_LCW.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_NET.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_TCP.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_TRM.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_TSK.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\AP32_XFR.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\BALCARGA.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\CONFIG.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\CV3.IP"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\CV3.PLC"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\FPLENUS.FON"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\NTERM32.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\PLENUS.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\PLENUS.HLP"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\plenus.trp"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\RPCV3.RPC"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\RPLPD.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\RPRINT.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\PLENUS\RPRINT.INI"; DestDir: "{app}"; Flags: ignoreversion

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Icons]
Name: "{commondesktop}\Plenus CV3"; Filename: "{app}\PLENUS.EXE"; Parameters: "CV3.PLC"; WorkingDir: "{app}"
Name: "{group}\Plenus CV3"; Filename: "{app}\PLENUS.EXE"; Parameters: "CV3.PLC"; WorkingDir: "{app}"
Name: "{group}\Configurador de Transporte"; Filename: "{app}\CONFIG.EXE"; WorkingDir: "{app}"
Name: "{group}\RPrint"; Filename: "{app}\RPRINT.EXE"; WorkingDir: "{app}"

[Registry]
Root: HKLM; Subkey: "Software\Classes\.PLC"; ValueType: string; ValueName: ""; ValueData: "PlenusConfigFile"; Flags: uninsdeletevalue
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile"; ValueType: string; ValueName: ""; ValueData: "Arquivo de Configurações do Plenus"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\ PLENUS.EXE,2"
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\PLENUS.EXE"" ""%1"""

; Executa o balanceamento de carga
[Run]
Filename: "{app}\BALCARGA.EXE"; \
  Parameters: "CV3.IP"; \
  Flags: runhidden; \
  StatusMsg: "Definindo configurações de acesso..."

Filename: "{app}\PLENUS.EXE"; \
  Description: "Abrir o Plenus CV3 imediatamente."; \
  Parameters: "CV3.PLC"; \
  Flags: postinstall nowait skipifsilent unchecked

[Code]
var
  RotuloExplicacao: TLabel;
  RotuloCodigo: TLabel;
  RotuloDica: TLabel;
  EditCodigoMaquina: TEdit;
  CodigoAcesso: String;

function CodigoDadosPage(Page: TWizardPage): Boolean;
begin
  Result := True;
  if EditCodigoMaquina.Text = '' then
  begin
    MsgBox('Você deve digitar um código de acesso antes de continuar.', mbError, MB_OK);
    //Exit(false);
    Result := false;
  end;
  CodigoAcesso := EditCodigoMaquina.Text;
end;
  
function CreateCodigoPage(PreviousPageId: Integer): Integer;
var
  Page: TWizardPage;
begin
  Page := CreateCustomPage(PreviousPageId, 'Código de Acesso',
  'Defina um código de acesso único para o Plenus CV3.');

  RotuloExplicacao := TLabel.Create(Page);
  with RotuloExplicacao do
  begin
    Parent := Page.Surface;
    Caption := 'Para acessar o servidor CV3 da Dataprev, você deve utilizar um código de acesso exclusivo. Caso dois computadores distintos acessem o CV3 com o mesmo código, ambos serão desconectados simultaneamente do servidor.';
    Left := ScaleX(16);
    Top := ScaleY(0);
    Width := ScaleX(400);
    Height := ScaleY(40);
    WordWrap := true;
  end;
  RotuloCodigo := TLabel.Create(Page);
  with RotuloCodigo do
  begin
    Parent := Page.Surface;
    Caption := '&Código de Acesso:';
    Left := ScaleX(16);
    Top := ScaleY(100);
    Width := ScaleX(100);
    Height := ScaleY(40);
    WordWrap := true;
  end;
  EditCodigoMaquina := TEdit.Create(Page);
  with EditCodigoMaquina do
  begin
    Parent := Page.Surface;
    Left := ScaleX(124);
    Top := ScaleY(96);
    Width := ScaleX(257);
    Height := ScaleY(25);
    TabOrder := 0;
    Text := '';
  end;
  RotuloDica := TLabel.Create(Page);
  with RotuloDica do
  begin
    Parent := Page.Surface;
    Caption := 'DICA: Se você estiver acessando de casa, através do teletrabalho, utilize o código HO + o nº do seu CPF. Caso esteja no INSS, utilize o número de tombamento do computador (PIB) como código de acesso. Ou, você pode utilizar uma sequência de letras e números gerados em um gerador aleatório com, pelo menos, oito dígitos.';
    Left := ScaleX(16);
    Top := ScaleY(172);
    Width := ScaleX(400);
    Height := ScaleY(40);
    WordWrap := true;
  end;
  with Page do
  begin
    OnNextButtonClick := @CodigoDadosPage;
  end;
  Result := Page.ID;
end;

procedure InitializeWizard();
begin
  CreateCodigoPage(wpLicense);
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  Configuracoes: TStringList;
begin
  if CurStep = ssInstall then
  begin
    { Apaga o diretório C:\wplenus }  
    DelTree('C:\WPLENUS', True, True, True);
  end
  else if CurStep = ssPostInstall then
  begin
    
    { Configura o código de acesso do Plenus }
    Configuracoes := TStringList.Create;
    Configuracoes.LoadFromFile(ExpandConstant('{app}\plenus.trp'));
    Configuracoes.Strings[9] := 'Nome=' + CodigoAcesso;
    Configuracoes.SaveToFile(ExpandConstant('{app}\plenus.trp'));
    Configuracoes.Free;
  end;
end;
