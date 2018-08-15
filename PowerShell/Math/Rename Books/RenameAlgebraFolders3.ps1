#----------------------------------------------------------------------------------------------------------
#RenameAlgebraFolders3.ps1
#Goal of this script is to remove periods from the middle of Algebra book files for a cleaner look
#----------------------------------------------------------------------------------------------------------
$folderSource = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I"
$cnt = 1
while($cnt -lt 32) {
    $source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra " + $cnt
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
