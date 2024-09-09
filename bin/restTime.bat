setlocal enabledelayedexpansion

set startTime=%~2
set startTime=!startTime:~0, -3!
set startTime=!startTime::= !

set finishTime=%~1
set finishTime=!finishTime:~0, -3!
set finishTime=!finishTime::= !

set restTime=

for /f "tokens=1-6" %%a in ("!finishTime! !startTime!") do (
  set /a h=%%a - %%d
  set /a m=%%b - %%e
  set /a s=%%c - %%f

  if !s! lss 0 (
    set /a m=!m! - 1
    set /a s=60 + !s!
  )
  
  if !m! lss 0 (
    set /a h=!h! - 1
    set /a m=60 + !m!
  )

  set "restTime=!h!:!m!:!s!"
)

echo !restTime!