@echo off
for /f "delims=" %%i  in ('%~1') do (
  echo %%i | findstr /i %~2
)
echo on