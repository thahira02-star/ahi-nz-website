Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap(1, 1)
$g = [System.Drawing.Graphics]::FromImage($bmp)

$testTitles = @(
  # Existing exact text
  "Water & Air-Cooled Chillers",
  "Variable Refrigerant Flow (VRF)",
  "Air Handling Units (AHU)",
  "Industrial Cooling Towers",
  "Rooftop Packaged HVAC Units",
  "Hydronic Pumping Stations",
  # Shortened variants
  "Chiller Systems",
  "VRF Systems",
  "Air Handling Units",
  "Cooling Towers",
  "Rooftop HVAC Units",
  "Hydronic Pumps"
)

$font = New-Object System.Drawing.Font("Montserrat", 11, [System.Drawing.FontStyle]::Bold)
foreach ($t in $testTitles) {
  $sz = $g.MeasureString($t, $font)
  Write-Output ("{0,-35} : {1:N1} px" -f $t, $sz.Width)
}

$font.Dispose()
$g.Dispose()
$bmp.Dispose()