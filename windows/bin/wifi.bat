@echo off
netsh interface set interface "wi-fi" disable
timeout /t 1 > nul
netsh interface set interface "wi-fi" enable