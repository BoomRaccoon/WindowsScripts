<#
.SYNOPSIS
    Sets hidden attribute on all files beginning with '.'
.DESCRIPTION
    If you want to change the starting location, make the change in the .ps1 file
.EXAMPLE
    just run the script
#>

Get-ChildItem "C:\" -recurse -force |
Where-Object {$_.name -like ".*" -and $_.attributes -match 'Hidden' -eq $false} |
Set-ItemProperty -name Attributes -value ([System.IO.FileAttributes]::Hidden)
