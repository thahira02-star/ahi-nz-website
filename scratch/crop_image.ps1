Add-Type -AssemblyName System.Drawing
$b = [System.Drawing.Bitmap]::FromFile("Reference files/chiller-service-partnership.jpg")

Write-Host "Original dimensions:" $b.Width "x" $b.Height

# Crop the top 596 pixels (which contains only the actual photo, removing the white wave and navy bar at the bottom)
$cropRect = New-Object System.Drawing.Rectangle(0, 0, $b.Width, 596)
$cropped = $b.Clone($cropRect, $b.PixelFormat)

$cropped.Save("Reference files/chiller-service-partnership-clean.jpg", [System.Drawing.Imaging.ImageFormat]::Jpeg)
Write-Host "Saved Reference files/chiller-service-partnership-clean.jpg (" $cropped.Width "x" $cropped.Height ")"

$cropped.Dispose()
$b.Dispose()
