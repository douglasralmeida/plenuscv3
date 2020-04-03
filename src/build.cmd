SETLOCAL

SET "RH="C:\Program Files (x86)\Resource Hacker\ResourceHacker.exe""

%RH%  -open .\plenus.rc -save .\plenus.res -action compile -log NUL
REM %RH%  -open .\rprint.rc -save .\rprint.res -action compile -log NUL
%RH%  -open .\config.rc -save .\config.res -action compile -log NUL

%RH% -open plenus.exe -save xplenus.exe -action addoverwrite -res plenus.res
REM %RH% -open rprint.exe -save xrprint.exe -action addoverwrite -res rprint.res
%RH% -open config.exe -save xconfig.exe -action addoverwrite -res config.res