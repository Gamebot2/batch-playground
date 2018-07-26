$source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Pre-Algebra\Pre Algebra 8"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $length = $oldName.IndexOf("8")
        $newName = $oldName.Substring(0, 3) + " " + $oldName.Substring(4, $length -3) + "- " + $oldName.Substring($oldName.IndexOf("8 ") + 2)
        $oldName
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}