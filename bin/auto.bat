@echo off
setlocal enabledelayedexpansion
set stage=%*
:auto
  echo.
  set /p command="[auto] !stage! "
  if "!command!" equ "[quit]" (
    goto:eof
  ) else (
    !stage! !command!
  )
goto:auto
echo on

