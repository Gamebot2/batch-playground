#----------------------------------------------------------------------------------------------------------
#RenamePreAlgebra.ps1
#Goal of this script is to rename Pre Algebra book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Pre-Algebra\Pre Algebra 27"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*') -and !($file -like '*Notes*') -and !($file -like '*class*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $length = $oldName.IndexOf("w C ")
        $newName = $oldName.Substring(0, 3) + " " + $oldName.Substring(4, $length - 1) + "- " + $oldName.Substring($oldName.IndexOf("w C ") + 4)
        $oldName
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}