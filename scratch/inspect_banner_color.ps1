Add-Type -AssemblyName System.Drawing

$p = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795413372762_ea4b1dc1.jpg"
$img = [System.Drawing.Bitmap]::FromFile($p)

# Let's inspect rows around y=300..400, x=600..900
for ($x = 600; $x -le 900; $x += 100) {
    $c = $img.GetPixel($x, 350)
    Write-Host "x=$x, y=350: R=$($c.R), G=$($c.G), B=$($c.B) -> #$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
}

# Left margin of the content
for ($x = 0; $x -lt 100; $x++) {
    $c = $img.GetPixel($x, 50)
    if ($c.R -lt 200) {
        Write-Host "Content left edge: $x px"
        break
    }
}

$img.Dispose()
