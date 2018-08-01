#----------------------------------------------------------------------------------------------------------
#RenameBMFolders.ps1
#Goal of this script is to rename all Beginning Math folders so they match the titles of the books, i.e. 
#the part of the book title that precedes the hyphen.
#----------------------------------------------------------------------------------------------------------
$folderSource = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Beginning Math (Quest)"
$cnt = 1
while($cnt -lt 11) {
    $source = "C:\Users\QLOWORKSTATION5\Mr. Ansh\PowerShell and Batch\Online Master\Math\Beginning Math (Quest)\Quest BM Booklet " + $cnt
    $newName = "Quest BM " + $cnt
    $newName
    Rename-Item -Path $source -NewName $newName
    $cnt = $cnt + 1
}
