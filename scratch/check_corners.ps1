Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-photo-exact.jpg")
Write-Host "Corner pixels:"
$tl = $img.GetPixel(0, 0)
$tr = $img.GetPixel($img.Width - 1, 0)
$bl = $img.GetPixel(0, $img.Height - 1)
$br = $img.GetPixel($img.Width - 1, $img.Height - 1)
Write-Host "TL: R=$($tl.R), G=$($tl.G), B=$($tl.B)"
Write-Host "TR: R=$($tr.R), G=$($tr.G), B=$($tr.B)"
Write-Host "BL: R=$($bl.R), G=$($bl.G), B=$($bl.B)"
Write-Host "BR: R=$($br.R), G=$($br.G), B=$($br.B)"
$img.Dispose()
