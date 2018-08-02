#----------------------------------------------------------------------------------------------------------
#AssignBooksGrammar.ps1
#The goal of this massive script is to automatically assign students appropriate grammar books simply by gleaning
#information from the books that are already in their folder. The script is intended to make it easier for 
#instructors to assign books by automatically copying, pasting, and renaming appropriate files
#----------------------------------------------------------------------------------------------------------
$env:UserName
$target = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Ansh Jain\Grammar"

$cnt = (Get-ChildItem -Path $target | Measure-Object).Count
"The number of files in the folder is " + $cnt

#Objective 2: Check if the number is less than 6 with a conditional
while($cnt -lt 6) {

#Objective 3: Obtain the names of all the files in the folder
$fileNameArray = (Get-ChildItem -Path $target -Name)

#Objective 4: Manipulate one of the file names to obtain a variable that is just "Horizontal Addition 1"
$initialName = $fileNameArray[0]
$beforeDash = ($initialName -split "-")[1]
$splitName = $beforeDash -split " "
$arrayLength = $splitName.Length
$titleArray = $splitName[2..$arrayLength]
$title = ""
foreach ($part in $titleArray) {
    $title = $title + $part + " "
}
$title = $title.TrimEnd(" ")
#$title
#Objective 5: Create a variable that accesses the online master source and retrieve all files from that folder
$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master"
$sourceFolder = Get-ChildItem -Path $source -Filter $title -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
$lastPage = 0
foreach ($file in $sourceFolder) {
    if(($file -like '*TEST*') -or ($file -like '*BOOK*') -or ($file -like '*ANS*')) {
        #Write-Host $file
    } else {
        Write-Host $file
        $splitTitle = $file -split "-"
        $lastElem = $splitTitle[$splitTitle.Length-1]
        $index = $lastElem.IndexOf(".") - 1
        $endIntStringArray = $lastElem[0..$index]
        $endIntString = ""
        foreach ($portion in $endIntStringArray) {
            $endIntString = $endIntString + $portion
        }
        try {
            $endInt = [int]$endIntString
        } catch {
            
        }
        
        if ($endInt -gt $lastPage) {
            $lastPage = $endInt
        }
    }
}


#Objective 6: Use original file name to extract an integer for the last page in the folder
$maxEndInt = 0
foreach($file in $fileNameArray) {
    $splitTitle = $file -split "-"
    $startIntString = $splitTitle[$splitTitle.Length-2]
    $lastElem = $splitTitle[$splitTitle.Length-1]
    $index = $lastElem.IndexOf(".") - 1
    $endIntStringArray = $lastElem[0..$index]
    $endIntString = ""
    foreach ($portion in $endIntStringArray) {
        $endIntString = $endIntString + $portion
    }
    $startInt = [int]$startIntString
    $endInt = [int]$endIntString
    if ($endInt -gt $maxEndInt) {
        $maxEndInt = $endInt
    }
}

#Objective 7: Pinpoint the new file based on the last page of the file that's already in the student's folder
$nextPage = $maxEndInt + 1
$sourceFile = ""
foreach($file in $sourceFolder) {
    $splitTitle = $file -split "-"
    $startIntString = $splitTitle[1]
    $startIntString = $startIntString.Trim(" ")
        if($startIntString -eq [string]$nextPage) {
            Write-Host $file
            $sourceFile = $file
            break
        }
    
}

#Objective 8: Figure out how to copy file from source to target
Get-ChildItem -Path $source -Filter $title -Recurse -ErrorAction SilentlyContinue -Force | % {
    $sourceFolderPath = $_.FullName
}


#Objective 9: Create a target file path variable for copying that also includes the day and date appended to the start of the file name
$fullDate = ($fileNameArray[$fileNameArray.Length-1] -split (" "))[0]
$month = [int](($fullDate -split ("-"))[0].Trim(" "))
$day = [int](($fullDate -split ("-"))[1].Trim(" ")) + 1

if($day -eq 29) {
    if($month -eq 2) {
        $day = 1
        $month = 3
    } 
}
if ($day -eq 31) {
    if(($month -eq 4) -or ($month -eq 6) -or ($month -eq 9) -or ($month -eq 11)) {
        $day = 1
        $month = $month + 1
    } 
}
if ($day -eq 32) {
    if(($month -eq 1) -or ($month -eq 3) -or ($month -eq 5) -or ($month -eq 7) -or ($month -eq 8) -or ($month -eq 10) -or ($month -eq 12)) {
        $day = 1
        if($month -eq 12) {
            $month = 1
        } else {
            $month = $month + 1
        }
    }
}

$dayString = Get-Date -Month $month -Day $day -UFormat %a
if($dayString -eq "Sun") {
    $day = $day + 1
    $dayString = "Mon"
}
$dateString = Get-Date -Month $month -Day $day -UFormat %e
$dateString = $dateString.Trim(" ")
$monthString = Get-Date -Month $month -Day $day -UFormat %m
$monthValue = [int]$monthString
if($monthValue -lt 10) {
    $monthString = $monthString[1..2]
}

$prefix = ""
$prefix = $prefix + $monthString + "-" + $dateString + " " + $dayString + " "
$sourceFilePath = $sourceFile.FullName
$finalTarget = $target + "\" + $prefix + $sourceFile


Copy-Item $sourceFilePath -Destination $finalTarget

$cnt = $cnt + 1
#$cnt
} 


