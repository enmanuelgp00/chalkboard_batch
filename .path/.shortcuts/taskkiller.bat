@echo off
setlocal enabledelayedexpansion
set saved=false
for /f "delims=. skip=3" %%i in ('tasklist /fi "username eq Enmanuel"') do (   
  for %%e in (RuntimeBroker.exe dllhost.exe explorer.exe cmd.exe tasklist.exe taskkill.exe conhost.exe notepad.exe sihost.exe svchost.exe) do (
    if "%%i.exe" equ "%%e" set saved=true
  )

  rem if "!saved!" equ "false" (echo %%i was killed) else (set saved=false)
  if "!saved!" equ "false" (taskkill /f /im "%%i.exe") else (set saved=false)
)
pause
@echo on