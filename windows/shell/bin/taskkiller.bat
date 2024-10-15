@echo off
setlocal enabledelayedexpansion
set command=
set keepPross=false
for /f "delims=. skip=3" %%i in ('tasklist /fi "username eq Enmanuel"') do (   
  for %%e in (RuntimeBroker.exe dllhost.exe explorer.exe cmd.exe tasklist.exe taskkill.exe conhost.exe notepad.exe sihost.exe svchost.exe) do (
    if "%%i.exe" equ "%%e" set keepPross=true
  )

  if "!keepPross!" equ "false" (taskkill /f /im "%%i.exe") else (set keepPross=false)
)
powershell !command!

@echo on