:::***IMPORTANT: There can be no spacing between the equals

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

Rem This part is for testing out how to use arrays and for loops in Batch
set list=1 2 3 4
::Structure of a for loop very similar to a for each loop in Java
(for %%a in (%list%) do (
	echo %%a
))

set array[0]=1
set array[1]=2
set array[2]=3

echo The first element of the array is %arrays[0]%

set array[3]=4

::How to list the length of an array
set "x=0"
:SymLoop

if defined array[%x%] (
	call echo %%array[%x%]%%
	set /a "x+=1"
	GOTO :SymLoop
)

echo The length of the array is %x%

::How to create structures within Arrays
goto :pastStructureArray
set len=3
set obj[0].Name=Joe
set obj[0].ID=1
set obj[1].Name=Mark
set obj[1].ID=2
set obj[2].Name=Mohan
set obj[2].ID=3
set i=0
:loop

if %i% equ %len% goto :eof
set cur.Name=
set cur.ID=

for /f "usebackq delims==.tokens=1-3" %%j in (`set obj[%i%]`) do (
   set cur.%%k=%%l
)
echo Name=%cur.Name%
echo Value=%cur.ID%
set /a i=%i%+1
goto loop
:pastStructureArray
