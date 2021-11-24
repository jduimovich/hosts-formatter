@echo off  

set BASE=g:\Dev\hosts-formatter

set ROUTES=%BASE%\routes.json 
set UPDATE=%BASE%\tmp.update-routes.cmd

rd .kube /s /q
mkdir .kube
SET KUBECONFIG=G:\Dev\hosts-formatter\.kube\config
xcopy c:\Users\jduim\.kube .kube /s
call crck

:L1
oc get routes --all-namespaces -o json > %ROUTES% 2> null

if %ERRORLEVEL% == 1 goto :NOCONNECT

g:\bin\nodejs\node %BASE%\getroutes.js %ROUTES% > %UPDATE%
call %UPDATE%
cls
echo.  
echo %time%
echo.   
g:\bin\nodejs\node %BASE%\getroutes.js %ROUTES%  
echo.
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
