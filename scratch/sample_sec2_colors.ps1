Add-Type -AssemblyName System.Drawing
$filePath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1794982118200_d4c77f17.png"
$img = [System.Drawing.Bitmap]::FromFile($filePath)

# Sample background color (top-left)
$c = $img.GetPixel(30, 30)
Write-Output "Section BG: R=$($c.R), G=$($c.G), B=$($c.B) -> #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"

# Sample number color inside card 1 (around x=100, y=260)
for ($y=240; $y -le 280; $y+=5) {
    for ($x=70; $x -le 110; $x+=5) {
        $c = $img.GetPixel($x, $y)
        if ($c.B -gt 50 -and $c.R -lt 50) {
            Write-Output "Card Number: R=$($c.R), G=$($c.G), B=$($c.B) -> #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
            break
        }
    }
}

# Sample icon circle bg inside card 1 (around x=225, y=260)
for ($y=245; $y -le 275; $y+=5) {
    for ($x=210; $x -le 235; $x+=5) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 220 -and $c.B -gt 240) {
            Write-Output "Icon Circle BG: R=$($c.R), G=$($c.G), B=$($c.B) -> #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
            break
        }
    }
}

$img.Dispose()
