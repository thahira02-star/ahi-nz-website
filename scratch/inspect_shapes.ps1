Add-Type -AssemblyName System.Drawing
$b = [System.Drawing.Bitmap]::FromFile("Reference files/chiller-service-partnership.jpg")

# Scan up from bottom at x = 645 (middle)
$midX = [int]($b.Width / 2)
$navyHeight = 0
$whiteHeight = 0

for ($y = $b.Height - 1; $y -ge 0; $y--) {
    $p = $b.GetPixel($midX, $y)
    # Check if close to navy #163865 (R=22, G=56, B=101)
    if ($p.R -lt 50 -and $p.G -lt 80 -and $p.B -gt 70) {
        $navyHeight++
    } else {
        Write-Host "Navy ended at y = $y, total navy height = $navyHeight, color at y is: $p"
        break
    }
}

# Scan above navy
$startY = $b.Height - 1 - $navyHeight
for ($y = $startY; $y -ge 0; $y--) {
    $p = $b.GetPixel($midX, $y)
    # Check if close to white (R>245, G>245, B>245)
    if ($p.R -gt 240 -and $p.G -gt 240 -and $p.B -gt 240) {
        $whiteHeight++
    } else {
        Write-Host "White ended at y = $y, total white height = $whiteHeight, color at y is: $p"
        break
    }
}

$b.Dispose()
