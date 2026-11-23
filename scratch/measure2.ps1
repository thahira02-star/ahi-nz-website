Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 1,1
$g = [System.Drawing.Graphics]::FromImage($bmp)
$style = [System.Drawing.FontStyle]'Regular'
$pfc = New-Object System.Drawing.Text.PrivateFontCollection
# Check if Montserrat is in system fonts
$font = New-Object System.Drawing.Font ("Montserrat", [float]13.5, $style)
Write-Host "Font family name: $($font.FontFamily.Name)"

$str = "With certified engineers stationed across New Zealand, AHI Carrier delivers 24/7 rapid emergency dispatch, expert diagnostics, and genuine Carrier parts to minimise downtime."

for ($w = 700; $w -le 780; $w += 10) {
    $sf = New-Object System.Drawing.StringFormat
    $size = [System.Drawing.SizeF]::new($w, 1000)
    $charsFitted = 0
    $linesFilled = 0
    $measured = $g.MeasureString($str, $font, $size, $sf, [ref]$charsFitted, [ref]$linesFilled)
    Write-Host "Width $w px => Lines: $linesFilled"
}
