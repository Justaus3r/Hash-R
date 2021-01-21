@echo off
setlocal enableextensions enabledelayedexpansion
set /p passhash=<ntlm.txt
::looping passwords to try everytime
for /f %%a in (%1) do (
   call :funch %%a  
)
::using hashconsole to extract and filter ntlm hash of our passwords and storing them in variable
:funch
set userinput=%1
set "plaintext=%userinput%"
for /f "tokens=1-2 delims=NTLM" %%a in ('HashConsole.exe -t %plaintext%^|find "NTLM"') do set ntlmh=%%b
echo %ntlmh% >>nth.txt
set "num=32"
set /a num=%num%+1

for /f "delims=" %%f in (nth.txt) do (
set a=%%f
echo !a:~31,%num%! >>ntlh.txt
set /p ntlmhash=<ntlh.txt
del ntlh.txt
del nth.txt
)
::Validating hashes,if a hash is matched then the password against it is thrown as the cracked password.
if %passhash% equ %ntlmhash% ( goto cracked) else ( goto  error)
:error
"%~dp0Exo.exe" /M:2:1 /C:0b /T:Current Try:: /M:2:1 /C:0d /T: %userinput% /M:2:1 /C:0e /T:: /M:2:1 /C:0c /T: Failed && echo.
goto :EOF
:cracked
cls
"%~dp0Exo.exe" /M:2:1 /C:0b /T:Current Try:: /M:2:1 /C:0d /T: %userinput% /M:2:1 /C:0e /T:: /M:2:1 /C:0a /T: Success && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Congratulation.Password has been cracked.it was /M:2:1 /C:0e /T: "%userinput%" && echo.
echo %userinput% >>C:\Users\%username%\Desktop\Cracked.txt
"%~dp0Exo.exe" /M:2:1 /C:0a /T: Saved the password in C:\Users\%username%\Desktop\Cracked.txt && echo.
pause
exit


