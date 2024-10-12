@echo off

call :sub parm0 parm1



goto:eof

rem %1 %2 represent the parameters of the subrutine
:sub
	echo %1 %2
goto:eof