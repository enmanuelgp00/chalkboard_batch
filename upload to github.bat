@echo off
git status
echo.
set /p message="Type down your commit message: "
echo Adding commit, wait ...
git add . 
git commit -m "%message%"
echo Syncing with GitHub ...
git push
echo on