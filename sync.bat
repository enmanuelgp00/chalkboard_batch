@echo off
git status
echo.
set /p message="Type down your commit message: "
echo.
echo Adding commit, wait ...
git add . 
git commit -m "%message%"
echo.
echo Syncing with GitHub ...
git push
echo on