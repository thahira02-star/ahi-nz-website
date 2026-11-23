Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795409845438_eb5aa38b.png"
$rawImg = [System.Drawing.Bitmap]::FromFile($srcPath)

# The hero section in media_1795409845438_eb5aa38b.png is roughly y=86 to y=472 (height 387)
$cropRect = New-Object System.Drawing.Rectangle(0, 86, $rawImg.Width, 387)
$bmp = $rawImg.Clone($cropRect, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
$rawImg.Dispose()

$w = $bmp.Width
$h = $bmp.Height

# Dark background color matching page hero background
$bgR = 8
$bgG = 18
$bgB = 32
$bgColor = [System.Drawing.Color]::FromArgb($bgR, $bgG, $bgB)

# 1. Fill left area (x=0 to 450) completely with solid dark navy #081220
for ($y = 0; $y -lt $h; $y++) {
    for ($x = 0; $x -lt 450; $x++) {
        $bmp.SetPixel($x, $y, $bgColor)
    }
}

# 2. Smoothly blend transition from x=450 to 500
for ($y = 0; $y -lt $h; $y++) {
    for ($x = 450; $x -lt 500; $x++) {
        $t = ($x - 450) / 50.0 # 0 at 450, 1 at 500
        $orig = $bmp.GetPixel($x, $y)
        $nR = [int]($bgR * (1.0 - $t) + $orig.R * $t)
        $nG = [int]($bgG * (1.0 - $t) + $orig.G * $t)
        $nB = [int]($bgB * (1.0 - $t) + $orig.B * $t)
        $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($nR, $nG, $nB))
    }
}

# 3. Inpaint any residual text in x=450..640, y=110..270
# In this region, replace any pixel with brightness > 30 with dark casing color (16, 16, 16)
$casingColor = [System.Drawing.Color]::FromArgb(16, 16, 16)
$inpaintedCount = 0

for ($y = 110; $y -lt 270; $y++) {
    for ($x = 450; $x -lt 640; $x++) {
        $c = $bmp.GetPixel($x, $y)
        $brightness = [Math]::Max($c.R, [Math]::Max($c.G, $c.B))
        if ($brightness -gt 30) {
            $bmp.SetPixel($x, $y, $casingColor)
            $inpaintedCount++
        }
    }
}
Write-Host "Inpainted residual text pixels: $inpaintedCount"

# 4. Remove bottom glare/reflection at y >= 340
for ($y = 340; $y -lt $h; $y++) {
    for ($x = 0; $x -lt $w; $x++) {
        $c = $bmp.GetPixel($x, $y)
        # If glare (bright white/gray strip)
        if ($c.R -gt 35 -or $c.G -gt 35 -or $c.B -gt 35) {
            $bmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(8, 12, 18))
        }
    }
}

# Save output to both root and final output
$outPaths = @(
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-hero-technician.jpg",
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-hero-clean.jpg",
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\final output\Reference files\preventative-hero-technician.jpg",
    "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\final output\Reference files\preventative-hero-clean.jpg"
)

$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]95)

foreach ($p in $outPaths) {
    $parent = [System.IO.Path]::GetDirectoryName($p)
    if (!(Test-Path $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    $bmp.Save($p, $jpegCodec, $encoderParams)
    Write-Host "Saved: $p"
}

$bmp.Dispose()
Write-Host "Done successfully!"
