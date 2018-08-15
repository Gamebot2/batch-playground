#----------------------------------------------------------------------------------------------------------
#RenameAlgebraFolders1.ps1
#Goal of this script is to rename Algebra folders from "Algebra 1 Booklet 31" to simpler name to work with
#such as "Algebra 31". Secondary purpose is to remove the "Book" from the name so the renaming file does 
#not get it confused with the BOOK files.
#----------------------------------------------------------------------------------------------------------
$folderSource = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I"
$cnt = 1
while($cnt -lt 32) {
    $source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Algebra I\Algebra 1 booklet " + $cnt
    $splitName = $source -split " "
    $newNum = $splitName[$splitName.Length-1]
    $newName = "Algebra " + $newNum
    $source
    $newName
    Rename-Item -Path $source -NewName $newName
    $cnt = $cnt + 1
}
