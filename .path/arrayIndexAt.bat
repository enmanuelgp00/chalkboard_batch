@echo off
:: arrayIndexAt <arr> <index> <return>
set _arr=%~1
set _index=%~2
set _return=%~3

for /f "tokens=%_index%" %%a in ("%_arr%") do (
  set %_return%=%%a
)
echo on