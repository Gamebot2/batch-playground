#----------------------------------------------------------------------------------------------------------
#RenameAlgebra.ps1
#Goal of this script is to rename Grammar book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Grammar\Grammar 6\Grammar 6R"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*') -and !($file -like '*Link*') -and !($file -like '*6 R*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $newName = "G" + $oldName.Substring(1, 8) + $oldName.Substring(9, 1) + "- " + $oldName.Substring(11)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}