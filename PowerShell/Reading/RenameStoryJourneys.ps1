#----------------------------------------------------------------------------------------------------------
#RenameStoryJourneys.ps1
#Goal of this script is to rename Story Journeys book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Reading\Story Journeys\Story Journeys H"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*Glos*') -and !($file -like '*Code7*') -and !($file -like '*H.pdf*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitSource = $source -split "\\"
        $folderName = $splitSource[$splitSource.Length - 1]
        $newName = $folderName + "- " + $oldName.Substring(17)
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}