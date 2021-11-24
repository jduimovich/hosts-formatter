@echo off  

set ROUTES=%~dp0\routes.json 
set UPDATE=%~dp0\tmp.update-routes.cmd

:L1
oc get routes --all-namespaces -o json > %ROUTES% 2> null

if %ERRORLEVEL% == 1 goto :NOCONNECT

node %~dp0\getroutes.js %ROUTES% > %UPDATE%
call %UPDATE%
echo.  
cls  
type C:\Windows\System32\drivers\etc\hosts
echo. 
choice /D N /T 10 > nul  
goto :L1


:NOCONNECT
cls  
type C:\Windows\System32\drivers\etc\hosts
echo. 
echo "Openshift not running - ignoring hosts updates"   %time%
echo. 
choice /D N /T 2 > nul   
goto :L1 
