@echo off
setlocal enabledelayedexpansion
set gw=
set isFound="no"
for /f "delims=" %%i in ('ipconfig') do (
  for /f "delims=: tokens=1,2" %%1 in ("%%i") do (

rem Filtrando el string en busca de la palabra "defaultGateway"
    set gw="%%1"
    set gw=!gw: =!
    set gw=!gw:.=!
    if !gw!=="DefaultGateway" (
      set gw=%%2
      set isFound="yes"
      goto continue
    )
  )
)
:continue
if !isFound!=="yes" (
  echo !gw!
) else (
  echo You are not connected to a router.
)
setlocal disabledelayedexpansion