@echo off  
:L1
cls 
echo.  
type C:\Windows\System32\drivers\etc\hosts  
choice /D N /T 3 > nul   
goto :L1
