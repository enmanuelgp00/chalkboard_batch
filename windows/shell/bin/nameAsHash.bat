@echo off
setlocal enableDelayedExpansion
set dx=0
for %%f in (%~1) do (
  for /f %%h in ('certutil -hashFile "%%f" md5') do (
    set /a dx=!dx! + 1
    if "!dx!" equ "2" rename "%%f" "%%h%%~xf"
  )
  set dx=0
)