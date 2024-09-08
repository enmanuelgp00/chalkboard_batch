@echo off
set args=%*
set mg="C:\Users\Enmanuel\AppData\Local\MEGAcmd\MEGAclient.exe"
set mgshll="C:\Users\Enmanuel\AppData\Local\MEGAcmd\MEGAcmdShell.exe"

if "%~1%" == "" (
  echo No arguments
  echo.
) else (

  if "%~1" == "shell" (
    %mgshll%
  ) else (

    rem killing the sever
    if "%~1" == "kill-server" (
      taskkill /im "MEGAcmdServer.exe"

    ) else (
 
    rem running arguments    
    if "%~1" == "get" (
      if "%~2" neq "" (
       for /f "delims=" %%c in ('time /t') do (set "startpoint=%%c")
      )
    )
    %mg% %args%
    if "%~1" == "get" (
      if "%~2" neq "" (
       for /f "delims=" %%c in ('time /t') do (echo [Started at %startpoint%, finished at %%c])
      )
    )
    echo.
    )  
  )
)

echo on


