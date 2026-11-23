Add-Type -AssemblyName System.Drawing
$bytes = [System.IO.File]::ReadAllBytes('C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795104468661_fffe0a19.png')
$ms = New-Object System.IO.MemoryStream(,$bytes)
$src = [System.Drawing.Bitmap]::FromStream($ms)

# Crop the right half
$rect = New-Object System.Drawing.Rectangle(450, 0, 574, 393)
$crop = $src.Clone($rect, $src.PixelFormat)
$crop.Save('scratch\ref_right_half.png', [System.Drawing.Imaging.ImageFormat]::Png)

Write-Output "Saved scratch\ref_right_half.png"
$crop.Dispose()
$src.Dispose()
$ms.Dispose()