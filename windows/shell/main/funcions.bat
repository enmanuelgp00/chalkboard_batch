@echo off
for /l %%i in (1, 1, 10) do call:function

goto:eof

:function
  echo dentro de la funcion
goto:eof
echo on
