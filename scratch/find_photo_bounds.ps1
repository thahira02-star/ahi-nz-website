Add-Type -AssemblyName System.Drawing
$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795004128205_4a8ff49f.jpg"
$bytes = [System.IO.File]::ReadAllBytes($srcPath)
$ms = New-Object System.IO.MemoryStream(,$bytes)
$bmp = [System.Drawing.Bitmap]::FromStream($ms)

# Let's inspect horizontal scan at y = 200 from x = 500 to 1000
# and vertical scan at x = 750 from y = 50 to 500
# to find exact border of the photo (non-white, non-navy)
for ($x = 500; $x -lt 600; $x += 2) {
    $c = $bmp.GetPixel($x, 200)
    # Check when it stops being pure white (R>245, G>245, B>245)
    if ($c.R -lt 240 -or $c.G -lt 240 -or $c.B -lt 240) {
        Write-Output "Left border around x=$x (R=$($c.R), G=$($c.G), B=$($c.B))"
        break
    }
}

for ($x = 1000; $x -gt 900; $x -= 2) {
    $c = $bmp.GetPixel($x, 200)
    if ($c.R -lt 240 -or $c.G -lt 240 -or $c.B -lt 240) {
        Write-Output "Right border around x=$x (R=$($c.R), G=$($c.G), B=$($c.B))"
        break
    }
}

for ($y = 50; $y -lt 150; $y += 2) {
    $c = $bmp.GetPixel(750, $y)
    if ($c.R -lt 240 -or $c.G -lt 240 -or $c.B -lt 240) {
        Write-Output "Top border around y=$y (R=$($c.R), G=$($c.G), B=$($c.B))"
        break
    }
}

for ($y = 480; $y -gt 380; $y -= 2) {
    $c = $bmp.GetPixel(750, $y)
    if ($c.R -lt 240 -or $c.G -lt 240 -or $c.B -lt 240) {
        Write-Output "Bottom border around y=$y (R=$($c.R), G=$($c.G), B=$($c.B))"
        break
    }
}

$bmp.Dispose()
$ms.Dispose()
