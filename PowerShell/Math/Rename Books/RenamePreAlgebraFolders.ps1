#----------------------------------------------------------------------------------------------------------
#RenamePreAlgebraFolders.ps1
#Goal of this script is to rename all Pre Algebra folders so they match the titles of the books, i.e. 
#the part of the book title that precedes the hyphen.
#----------------------------------------------------------------------------------------------------------
$folderSource = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Pre-Algebra"
$cnt = 4
while($cnt -lt 28) {
    $source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Pre-Algebra\Pre Algebra " + $cnt
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
