@echo off
SET CURRENT_DATE=%DATE%
SET YEAR=%DATE:~-4%
SET MONTH=%DATE:~4,2%
SET DAY=%DATE:~7,2%

echo %CURRENT_DATE%
echo %YEAR%
echo %MONTH%
echo %DAY%

Rem This part is to mess with date and time environment variables

echo %TIME%

echo/Today is: %year%-%month%-%day%