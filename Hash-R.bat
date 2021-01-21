@echo off 
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


:MyMainMenu-A Crack MD2
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit target hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_md2
if '%choicee%'=='n' goto crackmd2
if '%choicee%'=='Y' goto edit_hashfile_md2
if '%choicee%'=='N' goto crackmd2
:edit_hashfile_md2
notepad md2\hash.txt
goto crackmd2
:crackmd2
cd md2
call MD2CrackeR.bat %file%
pause
 exit
:MyMainMenu-B Crack MD4
 "%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_md4
if '%choicee%'=='n' goto crackmd4
if '%choicee%'=='Y' goto edit_hashfile_md4
if '%choicee%'=='N' goto crackmd4
:edit_hashfile_md4
notepad md4\hash.txt
goto crackmd4
:crackmd4
cd md4
call MD4CrackeR.bat %file%
pause
 exit
:MyMainMenu-C Crack MD5
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_md5
if '%choicee%'=='n' goto crackmd5
if '%choicee%'=='Y' goto edit_hashfile_md5
if '%choicee%'=='N' goto crackmd5
:edit_hashfile_md5
notepad md5\hash.txt
goto crackmd5
:crackmd5
cd md5
call MD5CrackeR.bat %file%
pause
 exit
:MyMainMenu-D Crack NTLM
 "%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_ntlm
if '%choicee%'=='n' goto crackntlm
if '%choicee%'=='Y' goto edit_hashfile_ntlm
if '%choicee%'=='N' goto crackntlm
:edit_hashfile_ntlm
notepad ntlm\ntlm.txt
goto crackntlm
:crackntlm
cd ntlm
call NTLMCrackeR.bat %file%
pause
 exit
:MyMainMenu-E Crack SHA1
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_sha1
if '%choicee%'=='n' goto cracksha1
if '%choicee%'=='Y' goto edit_hashfile_sha1
if '%choicee%'=='N' goto cracksha1
:edit_hashfile_sha1
notepad sha1\hash.txt
goto cracksha1
:cracksha1
cd sha1
call SHA1CrackeR.bat %file%
pause
 exit
:MyMainMenu-F Crack SHA256
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_sha256
if '%choicee%'=='n' goto cracksha256
if '%choicee%'=='Y' goto edit_hashfile_sha256
if '%choicee%'=='N' goto cracksha256
:edit_hashfile_sha256
notepad sha256\hash.txt
goto cracksha256
:cracksha256
cd sha256
call SHA256CrackeR.bat %file%
pause
 exit
:MyMainMenu-G Crack SHA384
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_sha384
if '%choicee%'=='n' goto cracksha384
if '%choicee%'=='Y' goto edit_hashfile_sha384
if '%choicee%'=='N' goto cracksha384
:edit_hashfile_sha384
notepad sha384\hash.txt
goto cracksha384
:cracksha384
cd sha384
call SHA384CrackeR.bat %file%
pause
 exit
:MyMainMenu-H Crack SHA512
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Choose a password file 
"%~dp0Exo.exe" /M:2:1 /C:0c /T:(FILENAME SHOULD BE WITHOUT WHITESPACES):
echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:----- && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:    ^| && echo.
"%~dp0Exo.exe" /M:2:1 /C:0d /T:     -------- /M:2:1 /C:0e /T:$/M:2:1 /C:0d /T:PATH:
set/p file=
"%~dp0Exo.exe" /M:2:1 /C:0d /T:Do you want to edit targeted hash file:
set choicee=
set /p choicee=
if not '%choicee%'=='' set choicee=%choicee:~0,1%
if '%choicee%'=='y' goto edit_hashfile_sha512
if '%choicee%'=='n' goto cracksha512
if '%choicee%'=='Y' goto edit_hashfile_sha512
if '%choicee%'=='N' goto cracksha512
:edit_hashfile_sha512
notepad sha512\hash.txt
goto cracksha512
:cracksha512
cd sha512
call SHA512CrackeR.bat %file%
pause
 exit
:MyMainMenu-I Retrieve Sam file(requires sudo privileges)
mkdir "%windir%\AdminCheck" 2>nul
if '%errorlevel%' == '0' rmdir "%windir%\AdminCheck" & call :gotPrivileges else call :getPrivileges
:getPrivileges
echo Invoking Uac for Privilege Escalation..
call "%~dp0runadmin.vbs" "%~dp0retsam.bat" 
exit
:MyMainMenu-J Help
cls
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Help: && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:First choose the hash you want to crack. && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:then give the path for password file. && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:then edit the target hash file in which target hash will be stored && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:tool will start a bruteforce attack to crack the hash. && echo.
"%~dp0Exo.exe" /M:2:1 /C:0a /T:Please note that it depends on your luck and password file and time to crack the hash.  && echo.
pause
exit
:MyMainMenu-Q Quit
 exit
