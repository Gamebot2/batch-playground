#----------------------------------------------------------------------------------------------------------
#RenameBusyReaders.ps1
#Goal of this script is to rename Busy Readers book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Reading\Busy Reader\Busy Reader L"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*List*') -and !($file -like '*BOOK*') -and !($file -like '*Code7*') -and !($file -like '*6 R*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $newName = $oldName.Substring(0, 13) + "- " + $oldName.Substring(14)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}