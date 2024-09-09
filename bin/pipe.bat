@echo off
::pipe <command> <command>

for /f %%i in ('%~2') do (
  %~1 %%i
)

echo on