#----------------------------------------------------------------------------------------------------------
#RenameGeometry.ps1
#Goal of this script is to rename Geometry book files by placing the hyphen in the correct place for parsing
#----------------------------------------------------------------------------------------------------------
$source = "C:\Users\$env:UserName\Mr. Ansh\PowerShell and Batch\Online Master\Math\Geometry\Geometry 22"
$sourceFiles = Get-ChildItem -Path $source -Recurse -ErrorAction SilentlyContinue -Force | Get-ChildItem -File
foreach($file in $sourceFiles) {
    if(!($file -like '*TEST*') -and !($file -like '*BOOK*')) {
        $initialPath = $file.FullName
        $splitFile = $file -split "\\"
        $oldName = $splitFile[$splitFile.Length - 1]
        $splitIndex = $oldName.IndexOf("nge ") + 3
        $newName = $oldName.Substring(0, $splitIndex) + "-" + $oldName.Substring($splitIndex)
        #$oldName
        $newName
        Rename-Item $initialPath -NewName $newName
    }
}