Get-ChildItem -Path C:\Users\BoomRaccoon\AppData\Local\Temp -Recurse | foreach { $_.Delete() }
