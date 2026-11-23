Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile((Resolve-Path "Reference files\chiller-hero-clean.jpg"))
Write-Host "chiller-hero-clean.jpg: $($img.Width) x $($img.Height)"
$img.Dispose()

$img2 = [System.Drawing.Image]::FromFile((Resolve-Path "Reference files\chiller-hero-bg.jpg"))
Write-Host "chiller-hero-bg.jpg: $($img2.Width) x $($img2.Height)"
$img2.Dispose()
