@echo off
title Stay awake
echo How long shoud I wait. Please specify if it's minutes(m), hours(h) or seconds(s)?
set /p input=
set type=%input:~-1%
set num=%input:~0,-1%
echo.
if "%type%" equ "m" (
  set /a t=%num%*60
) else if "%type%" equ "h" (
  set /a t=%num%*60*60
) else (
  set t=%num%
)
powercfg /change monitor-timeout-ac 0
powercfg /change standby-timeout-ac 0

timeout %t%
powercfg /change monitor-timeout-ac 1
powercfg /change standby-timeout-ac 300
echo done


