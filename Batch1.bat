@echo off
::dir
::ver
::echo %USERNAME%
::set

Rem This part is for listing down all the files in the directory Program Files
::dir "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch" > C:\Users\QLOWORKSTATION5\lists.txt
::echo "The program has completed"

Rem This part is for setting and echoing variables, numeric values
set message=Hello World
echo %message%

set /A a=5
set /A b=10
set /A c=%a% + %b%
echo %c%
set /A c=%a% - %b%
echo %c%
set /A c=%b% / %a%
echo %c%
set /A c=%a% * %b%
echo %c%

echo %JAVA_HOME%