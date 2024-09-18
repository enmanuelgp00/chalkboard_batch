setlocal EnableDelayedExpansion
:: count to 5 storing the results in a variable
set var=0
for /l %%i in (1, 1, 5) do echo [!var!] & set /a var+=1
pause