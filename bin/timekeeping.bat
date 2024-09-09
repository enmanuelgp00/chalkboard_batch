@echo off
setlocal enabledelayedexpansion
set _start=%time%
call %*  
set _finish=%time%
call restTime !_start! !_finish!
echo on