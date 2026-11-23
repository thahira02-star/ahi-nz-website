Add-Type -AssemblyName System.Drawing

$img = [System.Drawing.Bitmap]::FromFile("c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-hero-technician.jpg")

Write-Host "Checking technician boundary..."
for ($y = 50; $y -le 350; $y += 50) {
    $line = "y=${y} "
    for ($x = 420; $x -le 680; $x += 40) {
        $c = $img.GetPixel($x, $y)
        $line += "x=${x}:($($c.R),$($c.G),$($c.B)) "
    }
    Write-Host $line
}

$img.Dispose()
