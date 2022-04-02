
$timeDelay=$args[0]
if($timeDelay -eq $null)
{
    $timeDelay=Read-Host -Prompt "Enter time in seconds untill shutdown"
}

shutdown -s -t $timeDelay /f