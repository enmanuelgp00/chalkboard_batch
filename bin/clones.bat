@echo off
setlocal enabledelayedexpansion

::En los comandos for la secuencia ~nxi
::  ~n extrae el nombre el archivo
::  ~x extrae la extensi'on del archivo
::  ~i es simplemente el nombre de la variable

rem ### Archivo donde se almacenan los datos
set file=cloned_files.tmp
type nul > %file%

rem ### Definiendo el tiempo que va a tardar la operaci'on

set startPoint=%time%

set count=0
set clean=0
set totalFiles=0

rem ### Para la animaci'on del cambio de hora, guardo el caracter backspace en una variable
set bksp=
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "bksp=%%A"
for /l %%i in (1, 1, 12) do (
  set "cleanline=!cleanline!!bksp!"
)

echo Searching for cloned files...

for /r %%f in (*) do (
  set /a totalFiles=!totalFiles! + 1
  for /r %%c in (*) do (
    rem fc /lb1 /a "%%f" "%%c" > nul && set /a count=!count! + 1
    if "%%~xzf" equ "%%~xzc" set /a count=!count! + 1
    
  )

  rem ### Comparando los posibles archivos clonados, if es m'as r'apido, aunque no tienen que ser archivos clonados necesariamente
  rem if "!count!" neq "1" set clean=1 && echo file: %%~nxf %%~zf && echo path: %%f && echo.
  if "!count!" neq "1" set clean=1 && echo file: %%~nxf %%~zf >> %file% && echo path: %%f >> %file% && echo. >> %file%   
  
  set finishPoint=!time!
  call setFromCommand "diffTime" "restTime %startPoint% !finishPoint!"
  set /p ="!cleanline!!diffTime!" < nul
  set count=0
)
echo.
echo.
type %file%
echo.
echo !totalFiles! files were analyzed in %diffTime%
echo [Started  at %startPoint%]
echo [Finished at !finishPoint!]

if !clean! equ 0 (echo No cloned files found && erase %file%) else (

  rem ### Preguntando si borrar o no el archivo dump
  :question
    set /p answer="Would you like to erase the dump file? (y/n): "
    if "!answer!" equ "y" (erase %file% && goto:eof) else if "!answer!" equ "n" (goto:eof)
  goto:question

)


setlocal disabledelayedexpansion
echo on