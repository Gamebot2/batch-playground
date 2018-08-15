#----------------------------------------------------------------------------------------------------------
#RenameWordProblems.ps1
#Goal of this script is to rename Word Problems book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Word Problems\Word Problems K\Word Problems KH"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*asdfasdf*') -and !($file -like '*complete*') -and !($file -like '*Quest*') -and !($file -like '*H.pdf*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $newName = $oldName.substring(0, 15) + $oldName.Substring(16, 1) + "- " + $oldName.Substring(18)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}