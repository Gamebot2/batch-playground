::Environment variable defining the user of the machine
$env:UserName

::Declaring variables for later use in the program
$CompletedBooksPath = 
$NewCompletedBooksHome =
$command_file =  
$source=
$target=
 
::Path where the completed books are taken from: just above the individual student folders
$CompletedBooksPath = "C:\Users\$env:UserName\Google Drive\Quest Students"
::Path where the completed books are deposited: also just above individual student folders 
$NewCompletedBooksHome = "C:\Users\$env:UserName\Dropbox\Quest Student Completed Books"
::Text file where we record all files transferred, and timedate of last modification
$questfiles_data="C:\Users\$env:UserName\Dropbox\Quest_Work\Batch\StudentsCompletedFiles.txt"
::File with assorted move statements that I will assume were discarded for some reason
$command_file ="C:\Users\$env:UserName\Dropbox\Quest_Work\Batch\RemoveCompletedFilesCommands.ps1"

::Gets all child items within the student folders that have variations of the word complete
::Depth specifies a 5-depth recursion for looking through files
::-File specifies that only files, not folders, are retrieve
::Format-table gets property fullname and makes a table out of them
::-hideTableHeaders omits column headings from the table
::Out-File sends files to data file through -FilePath
::-width specifies that only 300 characters per line, rest are truncated, default is 80
Get-ChildItem -Path $CompletedBooksPath -depth 5 -File | Where-Object {$_.fullname -match "\(complete\)|_complete\)|-complete| complete|\(complete"  } `
 | Format-table -Property fullname -hideTableHeaders | Out-File -FilePath $questfiles_data -width 300
 
::Setting $cnt variable
::Get-Content gets the actual text in the completed files file
::Measure-object measures the number of -Lines in the file
::Select object "Expands" the Lines property for measurement (Don't get this part)
$cnt= Get-Content -Path $questfiles_data | Measure-Object -Line | select-object -ExpandProperty Lines

::Injects the following phrase into the command file variable (dunno why)
"#  Start of Remove Command, hope I don't need it!!!!!!" > $command_file   

::For each loop that goes through all objects in the data file
[string[]](Get-Content -Path $questfiles_data ) | ForEach-Object {

    ::Variable that creates an array split along the slash delimiter
    $QuestDataWork = $_ -split '\\'
    ::Variable that stores the student's name (0 indexed array)
    $QuestStudent = $QuestDataWork[5]
    ::Variable that stores file name with a -1 index (last element)
    $FileName = $QuestDataWork[-1]

    ::Variable that stores the entire line that the loop is iterating over
    $StudentCompletedFile = $_
    

    $target=   '"' +"$NewCompletedBooksHome\$QuestStudent" + '"'
    $target_dir=   "$NewCompletedBooksHome\$QuestStudent"
   
     if($FileName)  {       
        ::Trimend removes the spaces from the end of a string  
        $FileName=$FileName.trimend(" ")
        #=================================================================================================
        # Full Target Name is double quoted as required by the command file
        # Check Target Name is not quoted and works with the Test Path command
        #=================================================================================================
        
        $FullTargetName='"' +"$NewCompletedBooksHome\$QuestStudent\$FileName" + '"'
        $CheckTargetName="$NewCompletedBooksHome\$QuestStudent\$FileName" +''

        if( $StudentCompletedFile)  {         
        $StudentCompletedFile=$StudentCompletedFile.trimend(" ")
        $source = '"' + "$StudentCompletedFile" + '"'
        }
       
    }
    
#=========================================================================================================
#   If source completed file missing
#      write message (maybe someone moved it?)
#   else
#         If target completed file already there
#            delete the source file
#         else 
#            move source completed file to target dir
#         end
#   end
#=========================================================================================================
 
    if (( $source -ne '""') -and ($StudentCompletedFile) -and ($FullTargetName)){
            if (!(Test-Path $StudentCompletedFile)) {        
                   "{0,-12} {1,20} " -f "SOURCE MISSING:  ",   $StudentCompletedFile
            }
            else{            
                  if (!(Test-Path $CheckTargetName)) { 
                      #   "{0,-12} {1,20} " -f "SOURCE FOUND:  ",   $StudentCompletedFile    
                        "{0,-12} {1,40}" -f "TARGET MISSING:  ",   $FullTargetName
                          $command_var="move-item -Path " + $source + " -Destination " + $target 
                          $command_var |  Out-File  $command_file -append
                  }
                  else {
                        "{0,-12} {1,20}" -f "ALREADY THERE, USE:  ",  $target_dir
                         $command_var="remove-item " + $source  
                         $command_var |  Out-File  $command_file -append
                  } 
            }
      }
      #else{
      #      "{0,-12} {1,20} " -f "STUD COMPL:  ",   $StudentCompletedFile
      #      "{0,-12} {1,20} " -f "SOURCE    :  ",   $source
      #      "{0,-12} {1,20} " -f "TARGET    :  ",   $FullTargetName
      #}
}

"{0,22} {1,-4}" -f "Total Completed files Found: ", $cnt 
 
################################################################################################
#
#
#
################################################################################################
#exit
if ($cnt -gt 0)
{
    powershell.exe -file C:\Users\$env:UserName\Dropbox\Quest_Work\Batch\RemoveCompletedFilesCommands.ps1
} 
else
{
     "{0,22}" -f "No Completed files found!!!"  
}
 
   
