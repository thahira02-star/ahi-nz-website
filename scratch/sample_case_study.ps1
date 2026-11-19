Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Image]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1794918248125_53e726be.png")
$bmp = New-Object System.Drawing.Bitmap $img

Write-Host "Image size: $($bmp.Width) x $($bmp.Height)"

# Sample background color (top left, near 20, 20)
$bg = $bmp.GetPixel(20, 20)
Write-Host ("Background: #{0:X2}{1:X2}{2:X2}" -f $bg.R, $bg.G, $bg.B)

# Sample "CASE STUDY" text (around x: 110-180, y: 60-70)
for ($y = 60; $y -lt 75; $y += 2) {
    for ($x = 110; $x -lt 180; $x += 2) {
        $p = $bmp.GetPixel($x, $y)
        if ($p.B -gt 150 -and $p.R -lt 50) {
            Write-Host ("CASE STUDY blue pixel at ($x, $y): #{0:X2}{1:X2}{2:X2}" -f $p.R, $p.G, $p.B)
            break
        }
    }
}

# Sample "3 days" number color (around x: 110-180, y: 220-250)
for ($y = 220; $y -lt 250; $y += 2) {
    for ($x = 110; $x -lt 160; $x += 2) {
        $p = $bmp.GetPixel($x, $y)
        if ($p.B -gt 150 -and $p.R -lt 50) {
            Write-Host ("Stat blue pixel at ($x, $y): #{0:X2}{1:X2}{2:X2}" -f $p.R, $p.G, $p.B)
            break
        }
    }
}

# Sample quote mark color in the card (around x: 570-600, y: 100-120)
for ($y = 95; $y -lt 125; $y += 2) {
    for ($x = 570; $x -lt 610; $x += 2) {
        $p = $bmp.GetPixel($x, $y)
        if ($p.B -gt 150 -and $p.R -lt 50) {
            Write-Host ("Quote mark blue pixel at ($x, $y): #{0:X2}{1:X2}{2:X2}" -f $p.R, $p.G, $p.B)
            break
        }
    }
}

$bmp.Dispose()
$img.Dispose()
