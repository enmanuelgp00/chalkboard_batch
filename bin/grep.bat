@echo off
setlocal enabledelayedexpansion
if "%~1" equ "" (
  echo grep [command] [search] [counter]
) else (
  set command=%~1
  set search=%~2
  set counter=%~3
  set isFound=false
  for /f "delims=" %%i in ('!command!') do (
    for /f "delims=" %%a in ("%%i") do (
      echo %%i | findstr /i "!search!" > nul && set isFound=true
    )
    if "!isFound!" equ "true" (
      if !counter! gtr 0 (
        set /a counter = counter - 1
        echo %%i
      )
    )
  )

)
echo on