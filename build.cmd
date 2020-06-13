@ECHO OFF

SETLOCAL

REM Local de instalação do FreePascal
SET "FP="C:\lazarus\fpc\3.0.4\bin\x86_64-win64\fpc.exe""

REM Local de instalação do InnoSetup
SET "ISCC="C:\Program Files (x86)\Inno Setup 6\ISCC.exe""

REM Local de instalação do Resource Hacker
SET "RH="C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe""

REM Gera o configurador automático
CD AUTOCONFIG
BUILD.CMD
CD..

REM Processa os recursos de executáveis do Plenus
CD SRC
BUILD.CMD
CD..

REM Gera o programa de instalação
CD SETUP
BUILD.CMD
CD..

ENDLOCAL