@echo off
setlocal enabledelayedexpansion
set var=2
:auto
  set /p command="run $ "
  if "!command!" equ "quit" (
    goto:eof
  ) else (
    %~1!command!%~1
  )
goto:auto
echo on

