for /l %a in (1, 1, 10) do ^
  for /f %i in ('time /t') do ^
    if %i==07:00 ^
      shutdown /s /f /t 0 

for /l %i in (1, 0, 1) do (time /t | find "06:59" && a.exe && timeout  /t 5 && shutdown /h) || timeout /t 30