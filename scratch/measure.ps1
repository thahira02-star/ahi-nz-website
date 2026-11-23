Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 1,1
$g = [System.Drawing.Graphics]::FromImage($bmp)
$style = [System.Drawing.FontStyle]'Regular'
$font = New-Object System.Drawing.Font ("Arial", [float]13.5, $style)
$str = "With certified engineers stationed across New Zealand, AHI Carrier delivers 24/7 rapid emergency dispatch, expert diagnostics, and genuine Carrier parts to minimise downtime."

$sf = New-Object System.Drawing.StringFormat

foreach ($w in @(520, 550, 580, 600, 620, 640, 660, 680, 700, 720, 750, 800)) {
    $size = [System.Drawing.SizeF]::new($w, 1000)
    $charsFitted = 0
    $linesFilled = 0
    $measured = $g.MeasureString($str, $font, $size, $sf, [ref]$charsFitted, [ref]$linesFilled)
    Write-Host "Width $w px => Lines: $linesFilled, Height: $($measured.Height), Chars: $charsFitted"
}
