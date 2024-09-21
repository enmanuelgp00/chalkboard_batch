@echo off
for %%i in (%~1) do (

  rem Getting the name of the file using %%~n; Running the new file.exe
  
  gcc -g -o %%~ni.exe %%i && echo. && %%~ni.exe
  echo.
  
  
)
echo off