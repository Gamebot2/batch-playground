$folderSource = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I"
$cnt = 1
while($cnt -lt 32) {
    $source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra 1 booklet " + $cnt
    $splitName = $source -split " "
    $newNum = $splitName[$splitName.Length-1]
    $newName = "Algebra " + $newNum
    $source
    $newName
    Rename-Item -Path $source -NewName $newName
    $cnt = $cnt + 1
}
