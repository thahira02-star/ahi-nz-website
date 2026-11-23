Add-Type -AssemblyName System.Drawing
$bytes = [System.IO.File]::ReadAllBytes('Reference files/imp of emergency hvac.jpeg')
$ms = New-Object System.IO.MemoryStream(,$bytes)
$img = [System.Drawing.Image]::FromStream($ms)
Write-Output "Image Size: $($img.Width) x $($img.Height)"
$img.Dispose()
$ms.Dispose()