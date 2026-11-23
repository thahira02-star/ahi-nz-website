Add-Type -AssemblyName System.Drawing
$b = [System.Drawing.Bitmap]::FromFile("Reference files/chiller-service-partnership.jpg")
Write-Host "Width:" $b.Width "Height:" $b.Height

$cBottomMid = $b.GetPixel([int]($b.Width / 2), [int]($b.Height - 5))
$cBottomLeft = $b.GetPixel(10, [int]($b.Height - 5))
$cTopMid = $b.GetPixel([int]($b.Width / 2), 10)

Write-Host "Bottom Mid:" $cBottomMid
Write-Host "Bottom Left:" $cBottomLeft
Write-Host "Top Mid:" $cTopMid
$b.Dispose()
