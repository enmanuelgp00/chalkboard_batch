@echo off
set param=%~1
if exist %param% (
  for /f "tokens=1,2 delims=." %%a in ("%param%") do (
    c++ -o %%a.exe %param% && echo "%%a.exe" file created.
  )
) else (
  echo "%param%" file does not exist.
)

echo on