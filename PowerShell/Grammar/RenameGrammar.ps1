#----------------------------------------------------------------------------------------------------------
#RenameAlgebra.ps1
#Goal of this script is to rename Algebra book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Grammar\Quest Grammar 2\Grammar 2A\1 page"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*') -and !($file -like '*h.pdf*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $newName = "G" + $oldName.Substring(1, 8) + $oldName.Substring(10, 1) + "- " + $oldName.Substring(12)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}