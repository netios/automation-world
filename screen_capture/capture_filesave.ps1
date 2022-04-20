function Set-ClipboardFromScreenshot ([Drawing.Rectangle]$Bounds) {
  $bmp = New-Object Drawing.Bitmap $Bounds.width, $Bounds.height
  $graphics = [Drawing.Graphics]::FromImage($bmp)
  $graphics.CopyFromScreen($Bounds.Location, [Drawing.Point]::Empty, $Bounds.size)
  [Windows.Forms.Clipboard]::SetImage($bmp)
}

Set-ClipboardFromScreenshot ( [Drawing.Rectangle]::FromLTRB(-1918,66,-895,735) )
