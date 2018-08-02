#----------------------------------------------------------------------------------------------------------
#RenameAlgebra.ps1
#Goal of this script is to rename Algebra book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------

$letters = @('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T')
$cnt = 0

while($cnt -lt 21) {
    $source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Grammar\Quest Grammar 3\Grammar 3" + $letters[$cnt] + "\2 Page"
    $cnt = $cnt + 1
    $sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
    foreach($file in $sourceFiles) {
        if(!($file -like '*TEST*') -and !($file -like '*BOOK*')) {
            $initialPath = $file.FullName
            $splitFile = $file -split "\\"
            $oldName = $splitFile[$splitFile.Length - 1]
            $newName = "G" + $oldName.Substring(1, 6) + " " + $oldName.Substring(7, 2) + "- " + $oldName.Substring(10)
            $newName
            Rename-Item $initialPath -NewName $newName
        }
    }
}
