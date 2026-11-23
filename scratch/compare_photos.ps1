Add-Type -AssemblyName System.Drawing

$img1 = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-tech.jpg")
$img2 = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-photo-exact.jpg")

Write-Host "img1 (preventative-care-tech.jpg): $($img1.Width)x$($img1.Height)"
Write-Host "img2 (cropped from screenshot): $($img2.Width)x$($img2.Height)"

$img1.Dispose()
$img2.Dispose()
