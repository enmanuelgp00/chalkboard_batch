@echo off
setlocal enabledelayedexpansion
set _start=%time%
%*
@echo off
set _finish=%time%
call subtractTime !_start! !_finish!
echo on