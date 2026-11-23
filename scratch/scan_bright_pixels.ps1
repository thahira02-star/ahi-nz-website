Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Bitmap]::FromFile("c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-hero-technician.jpg")
Write-Host "Scanning for bright text in x=400..650, y=100..300:"

$found = @()
for ($y = 100; $y -lt 300; $y += 5) {
    for ($x = 420; $x -lt 650; $x += 5) {
        $c = $img.GetPixel($x, $y)
        # Text is white/light gray: R > 150, G > 150, B > 150
        if ($c.R -gt 150 -and $c.G -gt 150 -and $c.B -gt 150) {
            $found += [PSCustomObject]@{ X = $x; Y = $y; R = $c.R; G = $c.G; B = $c.B }
        }
    }
}
Write-Host "Found $($found.Count) bright pixels in this region."
if ($found.Count -gt 0) {
    $minX = ($found | Measure-Object -Property X -Minimum).Minimum
    $maxX = ($found | Measure-Object -Property X -Maximum).Maximum
    $minY = ($found | Measure-Object -Property Y -Minimum).Minimum
    $maxY = ($found | Measure-Object -Property Y -Maximum).Maximum
    Write-Host "X range: $minX to $maxX, Y range: $minY to $maxY"
}

# Also check bottom 40px for glare
$glareCount = 0
for ($y = 350; $y -lt 387; $y++) {
    for ($x = 0; $x -lt 1024; $x += 20) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 100 -and $c.G -gt 100 -and $c.B -gt 100) {
            $glareCount++
        }
    }
}
Write-Host "Bottom glare pixels count: $glareCount"

$img.Dispose()
