Add-Type -AssemblyName System.Drawing

$p = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795414604878_72bdbeb3.png"
$img = [System.Drawing.Bitmap]::FromFile($p)

Write-Host "Sampling blue card colors:"
foreach ($x in @(550, 650, 750, 850)) {
    foreach ($y in @(50, 150, 250)) {
        $c = $img.GetPixel($x, $y)
        Write-Host "x=${x}, y=${y} R=$($c.R), G=$($c.G), B=$($c.B) -> #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
    }
}

Write-Host "Checking Download Brochure button:"
$btnTop = 0; $btnBottom = 0; $btnLeft = 0; $btnRight = 0
for ($y = 150; $y -lt 250; $y++) {
    for ($x = 510; $x -lt 700; $x++) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 245 -and $c.G -gt 245 -and $c.B -gt 245) {
            if ($btnTop -eq 0 -or $y -lt $btnTop) { $btnTop = $y }
            if ($y -gt $btnBottom) { $btnBottom = $y }
            if ($btnLeft -eq 0 -or $x -lt $btnLeft) { $btnLeft = $x }
            if ($x -gt $btnRight) { $btnRight = $x }
        }
    }
}
Write-Host "Button bounds: Left=$btnLeft, Right=$btnRight (Width=$($btnRight-$btnLeft)), Top=$btnTop, Bottom=$btnBottom (Height=$($btnBottom-$btnTop))"

$img.Dispose()
