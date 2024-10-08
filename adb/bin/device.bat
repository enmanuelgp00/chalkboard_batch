@echo off
if "%~1" equ "" (
  adb devices
) else if "%~1" equ "about" (
    if "%~2" equ "battery" (
      adb shell dumpsys battery
    )
     
) else if "%~1" equ "btn" (
    if "%~2" equ "pow" (
      adb shell input keyevent POWER
    ) else if "%~2" equ "vol" (
      if "%~3" equ "up" (
        adb shell input keyevent VOLUME_UP
      ) else if "%~2" equ "dw" (
        adb shell input keyevent VOLUME_DOWN
      ) else (
        adb shell input keyevent VOLUME_DOWN
      )      
    )
     
)