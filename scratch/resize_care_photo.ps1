Add-Type -AssemblyName System.Drawing

$srcPath = "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-care-photo-exact.jpg"
$orig = [System.Drawing.Bitmap]::FromFile($srcPath)

$targetW = 597
$targetH = 392

$targetBmp = New-Object System.Drawing.Bitmap($targetW, $targetH, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
$g = [System.Drawing.Graphics]::FromImage($targetBmp)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality

$g.DrawImage($orig, 0, 0, $targetW, $targetH)
$g.Dispose()
$orig.Dispose()

$outPaths = @(
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-care-photo-exact.jpg",
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\final output\Reference files\preventative-care-photo-exact.jpg"
)

$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]98)

foreach ($p in $outPaths) {
    $targetBmp.Save($p, $jpegCodec, $encoderParams)
    Write-Host "Saved: $p"
}
$targetBmp.Dispose()
Write-Host "Resized to exact 597x392 successfully."
