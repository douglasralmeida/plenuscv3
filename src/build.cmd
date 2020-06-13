REM Compila os arquivos de recursos
%RH%  -open .\plenus.rc -save .\plenus.res -action compile -log NUL
%RH%  -open .\rprint.rc -save .\rprint.res -action compile -log NUL
%RH%  -open .\config.rc -save .\config.res -action compile -log NUL

REM Substitui os recursos dos executáveis originais
%RH% -open ..\orig\plenus.exe -save ..\bin\plenus.exe -action addoverwrite -res plenus.res
%RH% -open ..\orig\rprint.exe -save ..\bin\rprint.exe -action addoverwrite -res rprint.res
%RH% -open ..\orig\config.exe -save ..\bin\config.exe -action addoverwrite -res config.res