::@mode con:cols=120 lines=1
@echo off
for /f %%i in ('adb shell dumpsys window ^| find "screenState"') do (
   set screenState="%%i"
)
::if true
adb shell dumpsys window | find "mCurrentFocus" | find "NotificationShade">nul && (^ 
   if %screenState%=="screenState=SCREEN_STATE_OFF" (
      adb shell input keyevent POWER
   )
   adb shell input keyevent MENU
   adb shell input text 00020267541
   adb shell input keyevent ENTER ) || echo The screen is turn on already!

::set screenState=
@echo on
