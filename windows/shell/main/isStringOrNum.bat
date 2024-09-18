@echo off
setlocal enabledelayedexpansion
set song

for %%s in (*.mp3) do (
  set song=%%s 
  for /f "tokens=1, 2*" %%a in ("!song!") do (
    set /a token=%%a - 1
    if %%a equ 0 (
      echo %%a is a num
    ) else (
      if !token! equ -1 (
         echo %%a is a str
      ) else (
         echo %%a is a num
      )
    )
  )  
)
echo on
