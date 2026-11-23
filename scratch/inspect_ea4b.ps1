Add-Type -AssemblyName System.Drawing

$p = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795413372762_ea4b1dc1.jpg"
$img = [System.Drawing.Bitmap]::FromFile($p)
Write-Host "Uploaded screenshot Width: $($img.Width) x Height: $($img.Height)"

# Sample the right banner background color (e.g. at x=700, y=280)
$c = $img.GetPixel(700, 280)
Write-Host "Banner navy color: R=$($c.R), G=$($c.G), B=$($c.B) -> Hex: #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"

# Sample the equipment pill border color
$pillBorder = $img.GetPixel(50, 160)
Write-Host "Pill border color: R=$($pillBorder.R), G=$($pillBorder.G), B=$($pillBorder.B)"

$img.Dispose()
