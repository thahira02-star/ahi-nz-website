Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

$installedFonts = (New-Object System.Drawing.Text.InstalledFontCollection).Families | Select-Object -ExpandProperty Name
$hasMontserrat = $installedFonts -contains "Montserrat"
Write-Host "Has Montserrat installed: $hasMontserrat"

$fontName = if ($hasMontserrat) { "Montserrat" } else { "Segoe UI" }
$font = New-Object System.Drawing.Font($fontName, 16, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$text = "When climate control failure threatens operations, patient care, or cold-chain logistics, AHI Carrier dispatches certified master engineers and mobile chiller units within minutes."

$singleSize = [System.Windows.Forms.TextRenderer]::MeasureText($text, $font)
Write-Host "$fontName single line width: $($singleSize.Width) px, height: $($singleSize.Height) px"

$boxSize = [System.Windows.Forms.TextRenderer]::MeasureText($text, $font, [System.Drawing.Size]::new(780, 10000), [System.Windows.Forms.TextFormatFlags]::WordBreak)
Write-Host "$fontName wrapped in 780px: Width=$($boxSize.Width), Height=$($boxSize.Height)"
$lines = [Math]::Round($boxSize.Height / $singleSize.Height)
Write-Host "Number of lines: $lines"
