@echo off
setlocal enabledelayedexpansion
if "%~1" equ "--deep" (
  set query=%~2
  for /f %%i in ('dir /s /b /a') do (
    (echo "%%~nxi" | find /i "!query!" > nul) && echo %%i && set found=true
  )
) else (
  set query=%~1
  for /r %%i in (*) do (
    (echo "%%~nxi" | find /i "!query!" > nul) && echo %%i && set found=true
  )
)
if "!found!" neq "true" echo No coincidences
set query=
set found=
setlocal disabledelayedexpansion
echo on