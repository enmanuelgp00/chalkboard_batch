@echo off
cd /d %music%
adb devices | findstr /i /r "device$" || echo There is no device connected && goto:eof
:: cambiando a formato en castellano
chcp 65001 > nul
echo Creating log...
set pth=/storage/sdcard0/music

rem Para saber si hay archivos o no en telegram y luego moverlos
adb shell ls /storage/emulated/0/music/telegram | findstr /i /c:"." > nul && echo Sorting files from telegram ... && adb shell mv /storage/emulated/0/music/telegram/* /storage/sdcard0/music/

set newfiles=false
set file=local.tmp
dir /b > %file%

setlocal enabledelayedexpansion
echo.
echo Fetching songs from device...

for /f "delims=" %%i in ('adb shell ls %pth%') do (
  for %%a in ("%%i") do (

     rem filtro la extensión para saber si es un archivo o directorio
     if "%%~xa" neq "" (
 
       rem censuro parte del nombre para poder encontrar posibles coincidencias en el log
       set name=%%~na
       rem echo.
       rem echo =^> file to search !name:~3!
       rem find /i "!name:~3!" %file% || adb pull "%pth%/%%i".nofile && set newfiles=true
       find /i "!name:~3!" %file% > nul || adb pull "%pth%/%%i" && set newfiles=true
     )     
  )
)
erase %file%

if "!newfiles!" equ "true" (
  echo.
  echo Formating new files...
  set song=
  for %%s in (*.mp3) do (
    set song=%%s  
    for /f "tokens=1,*" %%a in ("!song!") do (
      set /a token=%%a - 1
      if %%a equ 0 (      
        echo renaming "!song!" "%%b"
        move "!song!" "%%b"
      ) else (
        if !token! neq -1 (
          echo renaming "!song!" "%%b"
          move "!song!" "%%b"
        )
      )
    )
  )
) else (
  echo No new songs were found
)

setlocal disabledelayedexpansion
