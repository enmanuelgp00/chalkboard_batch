@echo off
setlocal enabledelayedexpansion
rem restTime <start> <finish>

set startTime=%~1
set startTime=!startTime:.= !
set startTime=!startTime::= !
::echo !startTime!

set finishTime=%~2
set finishTime=!finishTime:.= !
set finishTime=!finishTime::= !
::echo !finishTime!
set restTime=

for /f "tokens=1-8" %%a in ("!finishTime! !startTime!") do (
  set /a h=%%a - %%e
  set /a m=%%b - %%f
  set /a s=%%c - %%g
  set /a ms=%%d - %%h
  
  if !ms! lss 0 (
    set /a s=!s! - 1
    set /a ms=100 + !ms!
  ) else if !ms! lss 10 (
    set ms=0!ms!
  )

  if !s! lss 0 (
    set /a m=!m! - 1
    set /a s=60 + !s!
  ) else if !s! lss 10 (
    set s=0!s!
  )
  
  if !m! lss 0 (
    set /a h=!h! - 1
    set /a m=60 + !m!
  ) else if !m! lss 10 (
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