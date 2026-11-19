Add-Type -AssemblyName System.Drawing
$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795004128205_4a8ff49f.jpg"
$bytes = [System.IO.File]::ReadAllBytes($srcPath)
$ms = New-Object System.IO.MemoryStream(,$bytes)
$srcBmp = [System.Drawing.Bitmap]::FromStream($ms)

$rect = New-Object System.Drawing.Rectangle(540, 72, 448, 346)
$cropped = $srcBmp.Clone($rect, $srcBmp.PixelFormat)

$out1 = "Reference files\auckland-hospital.jpg"
$out2 = "final output\Reference files\auckland-hospital.jpg"

$cropped.Save($out1, [System.Drawing.Imaging.ImageFormat]::Jpeg)
$cropped.Save($out2, [System.Drawing.Imaging.ImageFormat]::Jpeg)

Write-Output "Successfully cropped and saved to $out1 and $out2"
Write-Output "Cropped dimensions: $($cropped.Width) x $($cropped.Height)"

$cropped.Dispose()
$srcBmp.Dispose()
$ms.Dispose()
