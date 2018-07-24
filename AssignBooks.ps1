$env:UserName
$target = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Ansh Jain\MATH"
#Objective 1: Count the number of files in the specified target directory
$cnt = (Get-ChildItem -Path $target | Measure-Object).Count
"The number of files in the folder is " + $cnt

#Objective 2: Check if the number is less than 6 with a conditional
if($cnt -lt 6) {
    "There are not enough files in the folder."
} else {
    "There are already enough files in the folder: no additions needed."
}

#Objective 3: Obtain the names of all the files in the folder
$fileNameArray = (Get-ChildItem -Path $target -Name)
foreach ($name in $fileNameArray) {
    #Write-Host $name
}

<#
$nameArray = $name -split " "
$date = $nameArray[0]
$day = $nameArray[1]
$title = $nameArray[2] + " " + $nameArray[3] + " " + $nameArray[4] + $nameArray[5]
$date
$day
$title
#>

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
$title

#Objective 5: Create a variable that accesses the online master source
$source = "C:\Users\$env:UserName\Dropbox\Online Master\Math\Horizontal Addition (Quest)\$title"
Get-ChildItem -Path $source
