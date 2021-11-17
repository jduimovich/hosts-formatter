@echo off 

set LAST_COPY=%~dp0\tmp.hosts.lastcopy
set LAST_SKIP=%~dp0\tmp.hosts.lastcheck
set HOSTS_CURRENT=C:\Windows\System32\drivers\etc\hosts
set HOSTS_NEW=%~dp0\tmp.hosts.new

echo "No Updates Yet in %dp0%" > %LAST_COPY%
echo "No Checks Yet" > %LAST_SKIP%

:L1
cls 
echo.  
type %HOSTS_CURRENT%
echo.
type %LAST_SKIP%
type %LAST_COPY%
choice /D N /T 1 > nul

rem find if resorting is different and if so, update
node %~dp0\hf.js > %HOSTS_NEW%

diff %HOSTS_CURRENT% %HOSTS_NEW%
set RC=%ERRORLEVEL% 
if %RC% == 0 goto :nocopy

:copy
copy %HOSTS_NEW%  %HOSTS_CURRENT%
echo Last update at: %time% Copied RC = %RC% > %LAST_COPY%  
goto :L1
 
:nocopy 
echo Last check at: %time% Copied RC = %RC% > %LAST_SKIP%   
goto :L1
