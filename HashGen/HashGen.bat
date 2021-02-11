@echo off  & setlocal
title Hash-R
color 0b
cd /d "%~dp0"
::you can add more banner's in banner directory then increase the maxvalue accordingly
SET maxvalue=10
SET minvalue=1
SETLOCAL 
SET /A tmpRandom=((%RANDOM%)%%(%maxvalue%))+(%minvalue%)
type "banner\banner%tmpRandom%"
"%~dp0Exo.exe" /M:2:1 /C:0e /T:********************************* && echo.
"%~dp0Exo.exe" /M:2:1 /C:0e /T: Hash cracking tool  && echo.
"%~dp0Exo.exe" /M:2:1 /C:0c /T: Hey! /M:2:1 /C:0e /T: yeah you,am /M:2:1 /C:0c /T: not /M:2:1 /C:0e /T: responsible && echo. 
"%~dp0Exo.exe" /M:2:1 /C:0e /T: for your naughty work. && echo.
"%~dp0Exo.exe" /M:2:1 /C:0e /T:********************************* && echo.
ping localhost -n 2 >nul
setlocal enabledelayedexpansion

:Main
	:: Build the menu one time
	call :Build-Menu "MyMainMenu" MainMenu

:ShowMainMenu	
	echo.
	"%~dp0Exo.exe" /M:2:1 /C:0a /T:- /M:2:1 /C:0b /T:- /M:2:1 /C:0c /T:- /M:2:1 /C:0d /T:- /M:2:1 /C:0e /T:- /M:2:1 /C:0f /T: -
    "%~dp0Exo.exe" /M:2:1 /C:0e /T:CONTROL PANEL
    "%~dp0Exo.exe" /M:2:1 /C:0a /T:- /M:2:1 /C:0b /T:- /M:2:1 /C:0c /T:- /M:2:1 /C:0d /T:- /M:2:1 /C:0e /T:- /M:2:1 /C:0f /T: -
	echo.
    echo.
	call :Display-Menu MainMenu "'------------Choose your option" R1
	
	call %R1%

	goto ShowMainMenu



:: Build the menu
:Build-Menu <1=Menu-Prefix> <2=MenuVar-Out>
	set nmenu=1
	for /F "tokens=1*" %%a in ('findstr /c:":%~1-" /b "%~f0"') do (
		set Menu-%~2-N[!nmenu!]=%%a
		set Menu-%~2-Text[!nmenu!]=%%b

		set /A nmenu+=1
	)

	set /a Menu%~2=%nmenu%-1

	set nmenu=
	
	:: Return the number of menu items built
	exit /b %nmenu%

:: Show a menu
:Display-Menu <1=MenuVar-In> <2=Prompt-Text> <3=Dispatch-Label-Out>
	setlocal
	set choices=
	for /l %%a in (1, 1, !Menu%~1!) do (
		for /f "tokens=2 delims=-" %%b in ("!Menu-%~1-N[%%a]!") do (
			set choice=%%b
			set choices=!choices!!choice!
		)
		echo ^!choice!^) !Menu-%~1-Text[%%a]!
	)
	choice /C:%choices% /M "%~2"
	(
		endlocal
		set %~3=!Menu-%~1-N[%errorlevel%]!
		exit /b 0
	)


:MyMainMenu-A Generate MD2
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set md2=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" MD2') do (
    if not defined md2 set "md2=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo MD2 Hash: %md2: =% 
pause
cls
call :Main
:MyMainMenu-B Generate MD4
set userinput=
set /p userinput=Enter your string:
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

echo MD5 Hash: %md4: =% 
pause
cls
call :Main
:MyMainMenu-C Generate MD5
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set md5=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" MD5') do (
    if not defined md5 set "md5=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo MD5 Hash: %md5: =% 
pause
cls
call :Main
:MyMainMenu-D Generate SHA1
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set sha1=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" SHA1') do (
    if not defined sha1 set "sha1=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo SHA1 Hash: %sha1: =% 
pause
cls
call :Main
:MyMainMenu-E Generate SHA256
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set sha256=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" SHA256') do (
    if not defined sha256 set "sha256=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo SHA256 Hash: %sha256: =% 
pause
cls
call :Main
:MyMainMenu-F Generate SHA384
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set sha384=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" SHA384') do (
    if not defined sha384 set "sha384=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo SHA384 Hash: %sha384: =% 
pause
cls
call :Main
:MyMainMenu-G Generate SHA512
set userinput=
set /p userinput=Enter your string:
set "plaintext=%userinput%"
set "file=%temp%\%~n0.tmp"
set sha512=

if not defined plaintext set /P "plaintext="

if exist "%plaintext%" (
    set "file=%plaintext%"
) else for %%I in ("%file%") do if %%~zI equ 0 (
    <NUL >"%file%" set /P "=%plaintext%"
)

for /f "skip=1 delims=" %%I in ('certutil -hashfile "%file%" SHA512') do (
    if not defined sha512 set "sha512=%%I"
)

2>NUL del "%temp%\%~n0.tmp"

echo SHA512 Hash: %sha512: =% 
pause
cls
call :Main
:MyMainMenu-Q Quit
 exit