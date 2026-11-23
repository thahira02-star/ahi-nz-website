Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795409845438_eb5aa38b.png"
$img = [System.Drawing.Bitmap]::FromFile($srcPath)
Write-Host "Source Width: $($img.Width), Height: $($img.Height)"

# Let's crop and examine
# In media_1795409845438_eb5aa38b.png, where is the hero section?
# Let's check pixel colors along a vertical line to find the header and hero boundaries.
for ($y = 0; $y -lt $img.Height; $y += 20) {
    $c = $img.GetPixel(500, $y)
    Write-Host "y=$y : R=$($c.R) G=$($c.G) B=$($c.B)"
}
$img.Dispose()
