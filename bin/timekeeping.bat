@echo off
setlocal enabledelayedexpansion
set _start=%time%
call %*
@echo off
set _finish=%time%
call restTime !_start! !_finish!
echo on