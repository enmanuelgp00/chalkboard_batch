@echo off
setlocal enableDelayedExpansion

set tag=@%~2
set tag=!tag: = @!
set files=%~3

if "%~1" equ "--clear" (

  rem removes all the descriptions
  if "%~2" equ "--all" (
    for %%f in ("%files%") do (
      set fileName=%%f
      for /f "delims=@" %%n in ("%%f") do (
        set newFileName=%%~nn%%~xf   
        set newFileName=!newFileName: %%~xf=%%~xf!
        rename "!fileName!" "!newFileName!"
      )
    )
  ) else (
    
    rem removes description
    for %%f in ("%files%") do (
      set fileName=%%~nf%%~xf
      set "newFileName=!fileName: %tag%=!"
      rem echo !fileName! !newFileName!
      rename "!fileName!" "!newFileName!"
    )
  )
  
  rem add description
) else if "%~1" equ "--add" (    
    for %%f in ("%files%") do ( 
      echo "%%f" | findstr /i "!tag!" > nul || rename "%%~nf%%~xf" "%%~nf %tag%%%~xf" 
    )
) else (
  echo.
  echo description [--clear/add] [strDescription] [strFile^(s^)]
)
