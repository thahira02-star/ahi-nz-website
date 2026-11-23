Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile((Resolve-Path "Reference files\chiller maintenance service.png"))
Write-Host "chiller maintenance service.png: $($img.Width) x $($img.Height)"
$img.Dispose()

$img2 = [System.Drawing.Image]::FromFile((Resolve-Path "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795158334407_e087deda.png"))
Write-Host "media_1795158334407_e087deda.png: $($img2.Width) x $($img2.Height)"
$img2.Dispose()
