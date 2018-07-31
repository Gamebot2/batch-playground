$folderSource = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I"
$cnt = 1
while($cnt -lt 32) {
    $source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra " + $cnt
    $sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
    foreach($file in $sourceFiles) {
        if(!($file -like '*TEST*') -and !($file -like '*BOOK*') -and !($file -like '*Notes*') -and !($file -like '*class*')) {
            $initialPath = $file.FullName
            $splitPath = $initialPath -split "\\"
            $fileName = $splitPath[$splitPath.Length-1]
            $splitName = $fileName -split "-"
            $folderName = $splitName[0]
            $newName = $folderSource + "\" + $folderName
            Rename-Item -Path $source -NewName $newName
            $newName
            $cnt = $cnt + 1
            break
        }
    }
}
