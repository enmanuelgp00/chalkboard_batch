@echo off
echo What is your game number?
set /p numGame=
find "%numGame%" descargados* && echo true || echo false
pause
cls
call buscar.bat