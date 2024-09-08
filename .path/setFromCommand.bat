:: Guarda la salida de un comando en una variable
:: 
::setlocal enabledelayedexpansion
set "command=%~2"
for /f "delims=" %%a in ('%command%') do set %~1=%%a

