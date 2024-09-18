@echo off
set pross=%~1
set at=%~2
call setFromCommand "sec" "subtractTime %time% %at% --get-seconds"
timeout /t %sec%
%pross%
echo on
