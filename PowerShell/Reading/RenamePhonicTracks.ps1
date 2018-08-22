#----------------------------------------------------------------------------------------------------------
#RenameDiscoverReading.ps1
#Goal of this script is to rename Phonic Tracks book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Reading\Phonic Tracks\Phonic Tracks 15 EE,IGH,OU"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*List*') -and !($file -like '*Code7*') -and !($file -like '*icTr*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitSource = $source -split "\\"
        $folderName = $splitSource[$splitSource.Length - 1]
        $newName = $folderName + "- " + $oldName.Substring(24)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}