Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap(1, 1)
$g = [System.Drawing.Graphics]::FromImage($bmp)

$headings = @(
  "Water & Air-Cooled Chillers",
  "Variable Refrigerant Flow (VRF)",
  "Air Handling Units (AHU)",
  "Industrial Cooling Towers",
  "Rooftop Packaged HVAC Units",
  "Hydronic Pumping Stations"
)

foreach ($size in @(10.5, 11, 11.5, 12, 12.5, 13)) {
  $font = New-Object System.Drawing.Font("Montserrat", $size, [System.Drawing.FontStyle]::Bold)
  Write-Output "=== FONT SIZE $size pt ==="
  foreach ($h in $headings) {
    $sz = $g.MeasureString($h, $font)
    Write-Output ("{0,-35} : {1:N1} px" -f $h, $sz.Width)
  }
  $font.Dispose()
}

$g.Dispose()
$bmp.Dispose()