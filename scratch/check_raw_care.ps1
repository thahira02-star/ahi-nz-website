Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-tech.jpg")
Write-Host "preventative-care-tech.jpg size: $($img.Width) x $($img.Height)"
# check if it has the badge
$c = $img.GetPixel(50, $img.Height - 30)
Write-Host "Pixel at bottom-left: R=$($c.R), G=$($c.G), B=$($c.B)"
$img.Dispose()
