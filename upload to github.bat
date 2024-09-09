@echo off
git status
echo.
set /p message="type down your commit message: "
git add . 
git commit -m "%message%"
git push
echo on