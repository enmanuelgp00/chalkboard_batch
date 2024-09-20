@echo off
set "rDef=1920 1080"
set "rLow=1280 720"
set "command=%~d0%~p0\data\set-resolution\set-resolution.exe"

if "%~1" equ "--low" (
  %command% %rLow%
) else if "%~1" equ "--default" (
  %command% %rDef%
) else (
  %command% %*
)