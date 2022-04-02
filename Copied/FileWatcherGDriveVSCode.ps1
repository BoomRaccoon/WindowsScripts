
function DoThings{
    $Object = "{0} was {1} at {2}" -f $Event.SourceEventArgs.FullPath, $Event.SourceEvent.Args.ChangeType, $Event.TimeGenerated
    $WriteHostParams= @{
        ForegroundColor='Green'
        BackgroundColor='Black'
        Object = $Object
    }
    Write-Host @WriteHostParams
}


$FileSystemWatcher = New-Object System.IO.FileSystemWatcher
$FileSystemWatcher | Get-Member -Type Properties,Event
$FileSystemWatcher.Path = "D:\Gdrive\VSCodeConfig"


Register-ObjectEvent -InputObject $FileSystemWatcher -EventName Changed  -Action {
    DoThings
}
