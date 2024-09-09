@echo off

::En los comandos for la secuencia ~nxi
::  ~n extrae el nombre el archivo
::  ~x extrae la extensi'on del archivo
::  ~i es simplemente el nombre de la variable

setlocal enabledelayedexpansion
set startPoint=%time%

set count=0
set clean=0
set totalFiles=0

echo Searching for cloned files...

for /r %%f in (*) do (
  set /a totalFiles=!totalFiles! + 1
  for /r %%c in (*) do (
    if "%%~xzf" equ "%%~xzc" set /a count=!count! + 1
    
  )

  if !count! neq 1 set clean=1 && echo file: %%~nxf && echo path: %%f && echo.
  set count=0
)
set finishPoint=%time%
if !clean! equ 0 echo No cloned files found

call setFromCommand "diffTime" "restTime %finishPoint% %startPoint%"
echo.
echo !totalFiles! files were analyzed in %diffTime%
echo [Started  at %startPoint%]
echo [Finished at %finishPoint%]
setlocal disabledelayedexpansion
echo on