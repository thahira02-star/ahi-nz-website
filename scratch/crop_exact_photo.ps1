Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795410499221_47f3cf5a.jpg")

$cropRect = New-Object System.Drawing.Rectangle(59, 33, 404, 265)
$cropped = $src.Clone($cropRect, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)

$outPath1 = "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-care-photo-exact.jpg"
$outPath2 = "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\final output\Reference files\preventative-care-photo-exact.jpg"

$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]95)

$cropped.Save($outPath1, $jpegCodec, $encoderParams)
$cropped.Save($outPath2, $jpegCodec, $encoderParams)
$cropped.Dispose()
$src.Dispose()
Write-Host "Pristine cropped photo saved."
