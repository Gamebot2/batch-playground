﻿$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra 31"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitIndex = $oldName.IndexOf("ons ") + 3
        $newName = $oldName.Substring(0, $splitIndex) + "-" + $oldName.Substring($splitIndex)
        #$oldName
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}