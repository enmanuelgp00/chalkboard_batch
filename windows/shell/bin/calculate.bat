@echo off
set "op=%*"
powershell $num = %op%; write-host $num;
