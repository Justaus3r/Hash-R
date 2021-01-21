@echo off
set /p psh=<hash.txt
for /f %%a in (%1) do (
   call :funch %%a  
)
:funch
set userinput=%1
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set md4=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" MD4') do (
    if not defined md4 set "md4=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

if  "%md4: =%" equ "%psh%" ( goto cracked) else ( goto notcracked)

:cracked
cls
"%~dp0Exo.exe" /M:2:1 /C:0b /T:Current Try:: /M:2:1 /C:0d /T: %userinput% /M:2:1 /C:0e /T:: /M:2:1 /C:0a /T: Success && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Congratulation.Password has been cracked.it was /M:2:1 /C:0e /T: "%userinput%" && echo.
echo %userinput% >>C:\Users\%username%\Desktop\Cracked.txt
"%~dp0Exo.exe" /M:2:1 /C:0a /T: Saved the password in C:\Users\%username%\Desktop\Cracked.txt && echo.
pause
exit
:notcracked
"%~dp0Exo.exe" /M:2:1 /C:0b /T:Current Try:: /M:2:1 /C:0d /T: %userinput% /M:2:1 /C:0e /T:: /M:2:1 /C:0c /T: Failed && echo.
