@echo off
setlocal enabledelayedexpansion

set BS= 

rem capurando el caracter backspace
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"
for /l %%i in (1, 1, 10) do (

  set /p = !BS!!BS!!BS!!BS!!BS!!BS! < nul
  set /p = / < nul
  timeout 1 > nul

  set /p = !BS!!BS!!BS!!BS!!BS!!BS! < nul
  set /p = - < nul
  timeout 1 > nul

  set /p = !BS!!BS!!BS!!BS!!BS!!BS! < nul
  set /p = \ < nul
  timeout 1 > nul

  set /p = !BS!!BS!!BS!!BS!!BS!!BS! < nul
  set /p = ^| < nul 
  timeout 1 > nul

)
setlocal disabledelayedexpansion