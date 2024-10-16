@echo off
call :main
goto:eof

:main
	setlocal
	echo.
	set "exceptions=taskmgr.exe svchost.exe notepad++.exe dllhost.exe explorer.exe cmd.exe tasklist.exe taskkill.exe conhost.exe sihost.exe ctfmon.exe eguiProxy.exe"
	echo Getting process list ...
	call :getPNames "%exceptions%" names 
	echo %names%
	echo Killing process ...
	call :kill "%names%" stdo
	call :powShell "%stdo%"
	echo.
	endlocal
goto:eof

:kill 
	setlocal enableDelayedExpansion
	set process=%1
	set process=%process:~1,-1%
	set return=
	for %%i in (%process%) do (
		for /f "tokens=1*" %%1 in ('taskkill /f /im %%~ni.exe 2^>^&1') do (
			set "out=%%1 %%2"			
			if %%1 equ SUCCESS: (
				set "return=!return! write-host !out! -foreground green;"
			) else if %%1 equ ERROR: (
				set "return=!return! write-host !out! -foreground red"
				rem -noNewLine;"
			) else (
				set "return=!return! write-host "`t`t"!out! -foreground gray;"
			)
		)
	)
	endlocal & set %2=%return%
goto:eof
:powShell
	setlocal
	set	log=%1
	set log=%log:~1,-1%
	set log=%log:(=`(%
	set log=%log:)=`)%
	powershell %log%
	endlocal
goto:eof
:getPNames
	setlocal enableDelayedExpansion
	set names=
	set exception=%1
	set exception=%exception:~1,-1%
	set isKeepPross=
	for /f "tokens=1-4" %%1 in ('tasklist /nh /fi "username eq %username%"') do ( rem 
		call :isKeepPross %%1 "!exception!" isKeepPross
		if !isKeepPross! neq true (
			if "!names!" neq "" (	
				set names=!names:%%1=!
			)
			set "names=!names! %%1"
		)
	)
	endlocal & set %2=%names%
goto:eof

:isKeepPross
	setlocal
		set str=%1
		set arr=%2
		set arr=%arr:~1,-1%
		set res=false
		for %%i in (%arr%) do (
			if /i %%i equ %str% (set res=true)
		)
	endlocal & set %3=%res%
goto:eof

:getPIds
	setlocal enableDelayedExpansion
	set pids=
	for /f "tokens=1-4" %%1 in ('tasklist /nh') do (
		call :isNumber %%2 isnumber
		if !isnumber! equ true (
			set "pids=!pids! %%2"
		) 
	)
	endlocal & set %1=%pids%
goto:eof

:isNumber
	setlocal
	set unk=%1
	set /a answer=%unk% + "null"
	if %unk% equ 0 (
		set return=true
	) else (
		rem checking is its a number using an operation
		if "%unk%" equ "%answer%" (
			set return=true
		) else (
			set return=false
		)
	)	
	endlocal & set %2=%return%
goto:eof

rem #########################################
rem #########################################
You could also use a little command trickery to capture the error directly into a variable without writing to a file. Here's a nifty way to do it:

batch

Copy
@echo off
for /f "tokens=* delims=" %%i in ('taskkill /F /IM yourprocess.exe 2^>^&1 1^>nul') do set errorContent=%%i

:: Print the content of the error variable
echo %errorContent%
This script captures the error output from taskkill and stores it directly in the variable errorContent. No files needed. Cool, right?




You
can you explain this: 2^>^&1 1^>nul
Copilot
Absolutely, let's break it down:

2>: Redirects standard error (stderr).

1>: Redirects standard output (stdout).

&1: Points to the same location as standard output.

Now, the reason for the ^ characters is that in batch scripting, the > and & need to be escaped so they aren’t interpreted prematurely.

Putting it together:

2^>^&1: Redirects the standard error to the same destination as standard output.

1^>nul: Redirects the standard output to nul (essentially discarding it).

This way, all the output is funneled into a single stream, but only the errors are preserved for handling later. Clever, huh?