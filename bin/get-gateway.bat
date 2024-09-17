@echo off
setlocal enabledelayedexpansion
if "%~1" equ "" (
  echo get-gateway [interface-name]
) else (
  call setFromCommand var "grep ipconfig %~1 6"
  for /f "delims=: tokens=1,2" %%a in ("!var!") do (
    echo %%b
  )
)