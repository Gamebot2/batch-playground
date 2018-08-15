#----------------------------------------------------------------------------------------------------------
#RenameWordProblems2.ps1
#Goal of this script is to rename Word Problems book files from 9 through Exit by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Word Problems\Word Problems 10"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*asdfasdf*') -and !($file -like '*complete*') -and !($file -like '*adsfasdfads*') -and !($file -like '*asdfasdf*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $oldName
        $newName = "Word Problems 10" + $oldName.substring(8, 1) + ".pdf"
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}