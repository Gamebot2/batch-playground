@echo off

Rem This part is for testing out conditionals such as if, if else, and nested if
SET /A a=5
SET /A b=10
SET /A c=%a% + %b%
if %c%==15 echo C is 15
if %c%==10 echo C is 10

echo %1
echo %2
echo %3
if %1%==1 (echo "The value is 1") else (echo "Unknown value") 
if %2%==2 (echo "The value is 2") else (echo "Unknown value") 
if %3%==3 (echo "The value is 3") else (echo "Unknown value")

::Nested if statements can be accomplished through the use of goto labels
SET /A ifVar=5
if %ifVar%=5 goto :labelA
if %ifVar%=10 goto :labelB

:labelA
echo The value of a is 5

::exit /b 0

:labelB
echo The value of a is 10