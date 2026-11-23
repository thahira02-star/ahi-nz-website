Add-Type -AssemblyName System.Drawing

$img1 = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-tech.jpg")
$img2 = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-photo-exact.jpg")

# Sample top-center pixel of both
$c1 = $img1.GetPixel(275, 50)
$c2 = $img2.GetPixel(200, 40)
Write-Host "img1 pixel: R=$($c1.R), G=$($c1.G), B=$($c1.B)"
Write-Host "img2 pixel: R=$($c2.R), G=$($c2.G), B=$($c2.B)"

$img1.Dispose()
$img2.Dispose()
