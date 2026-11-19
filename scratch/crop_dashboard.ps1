Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1794902300449_5ebe6204.jpg"
$bmp = New-Object System.Drawing.Bitmap($srcPath)

# Bounding box: X: 96 to 487 (width 391), Y: 80 to 384 (height 304)
# Let's crop slightly inside the rounded border if we want square corners or keep full
$cropRect = New-Object System.Drawing.Rectangle(96, 80, 391, 304)
$cropped = $bmp.Clone($cropRect, $bmp.PixelFormat)

$destPath1 = "Reference files\predictive dashboard monitoring.png"
$destPath2 = "final output\Reference files\predictive dashboard monitoring.png"

$cropped.Save($destPath1, [System.Drawing.Imaging.ImageFormat]::Png)
$cropped.Save($destPath2, [System.Drawing.Imaging.ImageFormat]::Png)

$cropped.Dispose()
$bmp.Dispose()

Write-Output "Successfully cropped and saved predictive dashboard monitoring.png"

