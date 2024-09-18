:: Guarda la salida de un comando en una variable
:: 
::setlocal enabledelayedexpansion
set "command=%~2"
rem set _var=
rem for /f "delims=" %%a in ('%command%') do (set _var=!_var! "%%a")
for /f "delims=" %%a in ('%command%') do (set %~1=%%a)

rem set %~1=!_var!
