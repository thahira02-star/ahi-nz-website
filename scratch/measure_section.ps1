Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795410499221_47f3cf5a.jpg")

Write-Host "Uploaded image Width: $($src.Width), Height: $($src.Height)"

# 1. Left image bounding box
# Let's find left edge of photo (non-white pixel near y=100)
$leftX = 0
for ($x = 0; $x -lt 200; $x++) {
    $c = $src.GetPixel($x, 100)
    if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
        $leftX = $x
        break
    }
}

# Right edge of photo
$photoRightX = 0
for ($x = 400; $x -lt 600; $x++) {
    $c = $src.GetPixel($x, 100)
    if ($c.R -gt 250 -and $c.G -gt 250 -and $c.B -gt 250) {
        $photoRightX = $x
        break
    }
}

# Right column start (where text starts)
$textStartX = 0
for ($x = $photoRightX; $x -lt 600; $x++) {
    $c = $src.GetPixel($x, 100)
    if ($c.R -lt 200) {
        $textStartX = $x
        break
    }
}

# Right edge of rightmost card
$cardsRightX = 0
for ($x = $src.Width - 1; $x -gt 700; $x--) {
    $c = $src.GetPixel($x, 230)
    if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
        $cardsRightX = $x
        break
    }
}

Write-Host "Left photo X: $leftX to $photoRightX (Width: $($photoRightX - $leftX))"
Write-Host "Text start X: $textStartX (Gap: $($textStartX - $photoRightX))"
Write-Host "Cards right X: $cardsRightX (Total width: $($cardsRightX - $leftX))"
Write-Host "Right margin: $($src.Width - $cardsRightX)"

$src.Dispose()
