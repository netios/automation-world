param($minutes = 540)

$myshell = New-Object -com "Wscript.Shell"


for ($i = 0; $i -lt $minutes; $i++) {
    $valSec = Get-Random -Minimum 50 -Maximum 70
    Start-Sleep -Seconds $valSec
    $myshell.sendkeys("{F13}")

    # $valSec = Get-Random -Minimum 55 -Maximum 65
    # $valMov = Get-Random -Minimum 2 -Maximum 5
    # Start-Sleep -Seconds $valSec
    # $Pos = [System.Windows.Forms.Cursor]::Position
    # [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((($Pos.X) + $valMov), $Pos.Y)
    # Start-Sleep -Seconds $valSec
    # $Pos = [System.Windows.Forms.Cursor]::Position
    # [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point((($Pos.X) - $valMov), $Pos.Y)
    $myshell.AppActivate('플랫폼인프라팀')
    $myshell.AppActivate('Comm.Email')
    $myshell.AppActivate('원내비_CherryTree.ctb')
}
