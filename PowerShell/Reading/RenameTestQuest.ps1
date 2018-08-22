#----------------------------------------------------------------------------------------------------------
#RenameStoryJourneys.ps1
#Goal of this script is to rename Test Quest book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Reading\Test Quest\Test Quest 3\Test Quest 3H"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*asdfadwsf*') -and !($file -like '*Glos*') -and !($file -like '*Code7*') -and !($file -like '*H.pdf*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitSource = $source -split "\\"
        $folderName = $splitSource[$splitSource.Length - 1]
        $newName = $folderName + "- " + $oldName.Substring(14)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}