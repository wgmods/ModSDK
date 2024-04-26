Add-Type -AssemblyName System.Windows.Forms

function Get-Folder( $allowFolderCreation, $description ) {
    $OK = [System.Windows.Forms.DialogResult]::OK

    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $dialog.Description = $description
    $dialog.ShowNewFolderButton = $allowFolderCreation
    $dialog.SelectedPath = pwd
    if ( $dialog.ShowDialog() -ne $OK ) { exit 1 }
    return $dialog.SelectedPath
}

$inputFolder = Get-Folder $false "Select your mod root folder"
$outputFolder = Get-Folder $true "Select packed geometry destanation"

Write-Host $inputFolder '->' $outputFolder
./geometrypack.exe --verbose --tree $inputFolder $outputFolder
Pause
