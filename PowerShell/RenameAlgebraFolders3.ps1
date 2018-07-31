$folderSource = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I"
$cnt = 1
while($cnt -lt 32) {
    $source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra " + $cnt
    $sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
    foreach($file in $sourceFiles) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitIndex = $oldName.IndexOf("  ")
        $newName = $oldName.Substring(0, $splitIndex) + "" + $oldName.Substring($splitIndex + 1)
        #$oldName
        $newName
        Rename-Item $initialPath -NewName $newName
    }
    $cnt = $cnt + 1
}
