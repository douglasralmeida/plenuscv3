; Script para o instalador do Plenus para o INSS
; requer InnoSetup 6

#define AppName "Plenus CV3 para INSS"
#define AppVersion "1.1"
#define AppPublisher "Instituto Nacional do Seguro Social"
#define AppURL "https://github.com/douglasralmeida/plenuscv3"

[Setup]
AllowNoIcons=yes
AllowUNCPath=False
AppId={{A1C11669-69C6-4BAA-BABC-312796C81E8C}
AppName={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AppVersion={#AppVersion}
ChangesAssociations=True
Compression=lzma
DefaultDirName=C:\WPLENUS
DefaultGroupName=Plenus CV3
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableWelcomePage=no
OutputBaseFilename=PlenusInstala
OutputDir=..\dist
PrivilegesRequired=admin
SetupIconFile=..\icons\install.ico
SetupMutex=InstalacaoPlenusMutex1
SolidCompression=yes
ShowLanguageDialog=no
UninstallDisplayName={#AppName} {#AppVersion}
UninstallDisplayIcon={app}\plenus.exe
UninstallDisplaySize=5697536
VersionInfoVersion=1.1.0
VersionInfoProductVersion={#AppVersion}
WizardImageFile=setupgrande.bmp
WizardSmallImageFile=setuppequeno.bmp
WizardStyle=modern

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[LangOptions]
DialogFontName=Segoe UI
DialogFontSize=9
WelcomeFontName=Segoe UI
WelcomeFontSize=12
TitleFontName=Segoe UI
TitleFontSize=29
CopyrightFontName=Segoe UI
CopyrightFontSize=9

[Dirs]
Name: "C:\WPLENUS"; Flags: uninsalwaysuninstall;

[Files]
Source: "..\BIN\AP32_BPS.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_COM.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_HLC.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_LCW.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_NET.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_TCP.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_TRM.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_TSK.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AP32_XFR.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\AUTOCONFIG.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\CONFIG.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CONFIG\CV3.IP"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CONFIG\CV3.PLC"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\FPLENUS.FON"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\NTERM32.DLL"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\PLENUS.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\PLENUS.HLP"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CONFIG\plenus.trp"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CONFIG\RPCV3.RPC"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\RPLPD.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\RPRINT.EXE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\CONFIG\RPRINT.INI"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\BIN\GUIREF.PDF"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{commondesktop}\Plenus CV3"; Filename: "{app}\PLENUS.EXE"; Parameters: "CV3.PLC"; WorkingDir: "{app}"; Comment: "Conecte com servidor CV3 da Dataprev.";
Name: "{group}\Plenus CV3"; Filename: "{app}\PLENUS.EXE"; Parameters: "CV3.PLC"; WorkingDir: "{app}"; Comment: "Conecte com servidor CV3 da Dataprev.";
Name: "{group}\Configurador de Transporte"; Filename: "{app}\CONFIG.EXE"; WorkingDir: "{app}"
Name: "{group}\RPrint"; Filename: "{app}\RPRINT.EXE"; WorkingDir: "{app}"
Name: "{group}\Guia de Referência do Plenus"; Filename: "{app}\GUIREF.PDF"; WorkingDir: "{app}"; Comment: "Aprenda sobre as teclas de atalho do Plenus.";

[Registry]
Root: HKLM; Subkey: "Software\Classes\.PLC"; ValueType: string; ValueName: ""; ValueData: "PlenusConfigFile"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile"; ValueType: string; ValueName: ""; ValueData: "Arquivo de Configurações do Plenus"; Flags: uninsdeletekey;
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\PLENUS.EXE,2"
Root: HKLM; Subkey: "Software\Classes\PlenusConfigFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\PLENUS.EXE"" ""%1"""

[Run]
; Executa a configuração automática
Filename: "{app}\AUTOCONFIG.EXE"; \
  Parameters: "CV3.IP"; \
  Flags: runhidden; \
  StatusMsg: "Definindo configurações de acesso..."

; Executa o Plenus após a finalização da instalação
Filename: "{app}\PLENUS.EXE"; \
  Description: "Abrir o Plenus CV3 imediatamente."; \
  Parameters: "CV3.PLC"; \
  Flags: postinstall nowait skipifsilent unchecked

[UninstallDelete]
Type: files; Name: "C:\WPLENUS\*";

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then
  begin
    { Apaga o diretório C:\wplenus }  
    DelTree('C:\WPLENUS', True, True, True);
  end;
end;
