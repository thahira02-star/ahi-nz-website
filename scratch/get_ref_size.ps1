Add-Type -AssemblyName System.Drawing
$bytes = [System.IO.File]::ReadAllBytes('C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795104468661_fffe0a19.png')
$ms = New-Object System.IO.MemoryStream(,$bytes)
$img = [System.Drawing.Image]::FromStream($ms)
Write-Output "User Reference Size: $($img.Width) x $($img.Height)"
$img.Dispose()
$ms.Dispose()