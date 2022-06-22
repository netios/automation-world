param($minutes = 540)

$myshell = New-Object -com "Wscript.Shell"


for ($i = 0; $i -lt $minutes; $i++) {
    $valSec = Get-Random -Minimum 50 -Maximum 70
    Start-Sleep -Seconds $valSec
    $myshell.sendkeys("{F13}")
    $myshell.AppActivate('---request--window---here---')
}
