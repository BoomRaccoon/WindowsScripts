[System.Collections.ArrayList]$Hashes = @()
$Hashes.Clear()
$hTable=@{}

function MetaData()
{
    Get-ChildItem -Path $env:appdata\Code\User\snippets | foreach {
        
        $hTable[$_.BaseName] = $_.LastWriteTime
    }

}

function MakeShortPath()
{
    foreach($HashItem in $Hashes)
    {
        $HashItem.Path = [System.IO.Path]::GetFileName($HashItem.Path)
    }
}

function WriteFile()
{
    #($hTable | Select-Object Hash, Path | ConvertTo-Csv -Delimiter ':' -NoTypeInformation | Select-Object -Skip 1).replace('"','') | Out-File -Force "D:\Gdrive\VSCodeConfig\FileHashes"
    try{
        Get-Item -Force -Path "D:\Gdrive\VSCodeConfig\FileHashes"
        $hTable.GetEnumerator() | Sort-Object -Property Name  | out-string | Set-Content -Force -Path "D:\Gdrive\VSCodeConfig\FileHashes"
    }
    catch{
        $hTable.GetEnumerator() | Sort-Object -Property Name | Out-String | Out-File -Force "D:\Gdrive\VSCodeConfig\FileHashes"
    }
}

function MakeHidden()
{
    try {
        $file = Get-Item -Force "D:\Gdrive\VSCodeConfig\FileHashes"
        if ($file.Attributes.ToString() -Split ", " -Contains "Hidden") {
            
        }
        else {
            $file.Attributes += "Hidden"                    
        }
    }
    catch {
        return
    }
}


MetaData
WriteFile
MakeHidden

#foreach($line in Get-Content -Path $env:appdata\Code\User\snippets\FileHashes)
#{
#    $pos = $line.IndexOf(":")
#    $SavedHash = $line.Substring(0, $pos)
#
#}

#Get-Content -Path $env:appdata\Code\User\snippets\FileHashes