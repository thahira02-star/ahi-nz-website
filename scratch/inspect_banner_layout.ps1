Add-Type -AssemblyName System.Drawing

$p = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795414604878_72bdbeb3.png"
$img = [System.Drawing.Bitmap]::FromFile($p)
Write-Host "Uploaded screenshot Width: $($img.Width) x Height: $($img.Height)"

# Let's inspect where the banner is in this image
# Find non-white bounds
$minX = $img.Width; $maxX = 0; $minY = $img.Height; $maxY = 0
for ($y = 0; $y -lt $img.Height; $y += 5) {
    for ($x = 0; $x -lt $img.Width; $x += 5) {
        $c = $img.GetPixel($x, $y)
        # Check if not background white/near-white
        if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
            if ($x -lt $minX) { $minX = $x }
            if ($x -gt $maxX) { $maxX = $x }
            if ($y -lt $minY) { $minY = $y }
            if ($y -gt $maxY) { $maxY = $y }
        }
    }
}
Write-Host "Banner bounds: X: $minX to $maxX (Width: $($maxX - $minX)), Y: $minY to $maxY (Height: $($maxY - $minY))"

# Check the seam between photo and navy card (around the middle)
for ($x = $minX + 200; $x -lt $maxX - 200; $x += 5) {
    $c = $img.GetPixel($x, ($minY + $maxY) / 2)
    # The navy card has high blue, low red
    if ($c.R -lt 40 -and $c.B -gt 70) {
        Write-Host "Navy card begins at X: $x"
        break
    }
}

# Check bottom edge of left photo vs bottom edge of navy card
# At X = minX + 100 (in photo), where is the bottom?
$photoBottomY = 0
for ($y = $maxY; $y -gt $minY; $y--) {
    $c = $img.GetPixel($minX + 100, $y)
    if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
        $photoBottomY = $y
        break
    }
}

# At X = maxX - 100 (in navy card), where is the bottom?
$navyBottomY = 0
for ($y = $maxY; $y -gt $minY; $y--) {
    $c = $img.GetPixel($maxX - 100, $y)
    if ($c.R -lt 250 -or $c.G -lt 250 -or $c.B -lt 250) {
        $navyBottomY = $y
        break
    }
}

Write-Host "Photo bottom Y: $photoBottomY, Navy bottom Y: $navyBottomY"

$img.Dispose()
