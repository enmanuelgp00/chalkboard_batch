@echo off
setlocal enabledelayedexpansion
rem restTime <start> <finish>

set startTime=%~1
set startTime=!startTime:.= !
set startTime=!startTime::= !

set finishTime=%~2
set finishTime=!finishTime:.= !
set finishTime=!finishTime::= !

rem quitando los ceros a la derecha para evitar el error por los formatos octales como el numero 09
for %%i in (!startTime!) do (
  for /f "delims=0 tokens=*" %%a in ("%%i") do (
    if "%%a" equ "" set "formatSt=!formatSt! 0"
    set "formatSt=!formatSt! %%a"
  )
)
for %%i in (!finishTime!) do (
  for /f "delims=0 tokens=*" %%a in ("%%i") do (    
    if "%%a" equ "" set "formatFt=!formatFt! 0"
    set "formatFt=!formatFt! %%a"
  )
)

set restTime=

for /f "tokens=1-8" %%a in ("!formatFt! !formatSt!") do (
  set /a h=%%a - %%e
  set /a m=%%b - %%f
  set /a s=%%c - %%g 
  set /a ms=%%d - %%h
  if !ms! lss 0 (
    set /a s=!s! - 1
    set /a ms=!ms! + 100
  ) else if !ms! lss 10 (
    set ms=0!ms!
  )

  if !s! lss 0 (
    set /a m=!m! - 1
    set /a s=!s! + 60
    
  )
  if !s! lss 10 (
    set s=0!s!
  )
  
  if !m! lss 0 (
    set /a h=!h! - 1
    set /a m=!m! + 60
  )
  if !m! lss 10 (
    set m=0!m!
  )
  
  if !h! lss 0 (
    set /a h=!h! + 24
  )
  if !h! lss 10 (
    set h=0!h!
  )

  set "restTime=!h!:!m!:!s!.!ms!"
)

echo !restTime!