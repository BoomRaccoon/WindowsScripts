$today = Get-Date -UFormat "%Y-%m-%d"
Get-Service | Select -Property name,displayname,status,starttype | where{$_.StartType -eq "Automatic"} | Out-File $env:USERPROFILE\Desktop\Services_Automatic_$today.txt
Get-Service | Select -Property name,displayname,status,starttype | where{$_.Status -eq "Running"} | Out-File $env:USERPROFILE\Desktop\Services_Running_$today.txt