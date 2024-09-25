@echo off
if "%~1" equ "--color" (
  setlocal enableDelayedExpansion
  set psCom=
  for /f "tokens=4* skip=2" %%1 in ('dir') do (
    rem %%1 let us know if its about a folder or not
    rem %%2 its the name of the file or folder
   
    if /i "%%1" equ "<dir>" (
      set "psCom=!psCom! write-host ^"%%2^" -foregroundColor blue;"
    ) else if /i "%%1" neq "bytes" (
    

      rem It'ill turn green if its about a .exe file or .bat      
      if "%%~x2" equ ".exe"  (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor green;" 
      ) else  if "%%~x2" equ ".bat" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor green;"         
        
        rem Color on images
      ) else if "%%~x2" equ ".jpg" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor darkyellow;"         
      ) else if "%%~x2" equ ".png" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor darkyellow;"         
      ) else if "%%~x2" equ ".webp" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor darkyellow;"         

        rem compress files        
      ) else if "%%~x2" equ ".zip" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor magenta;"         
      ) else if "%%~x2" equ ".rar" (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor magenta;"         
        
        rem default
      ) else (
        set "psCom=!psCom! write-host ^"%%2^" -foregroundColor gray;" 
      )
    )
  )
  powershell !psCom!
  echo.
  
) else (
  @dir /b
  echo.
)

