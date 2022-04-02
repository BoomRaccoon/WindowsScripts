$mypath = $args[0]

$from = Get-Content -Path H:\UE_Projects\FolderColors.txt
$fullpath = $mypath + "\Saved\Config\WindowsEditor\EditorPerProjectUserSettings.ini"
Write-Output $fullpath

try{
    Add-Content -Path $fullpath -Value $from
}

catch{
    Write-Output "Can't add FolderColors"
}
Start-Sleep -Seconds 3