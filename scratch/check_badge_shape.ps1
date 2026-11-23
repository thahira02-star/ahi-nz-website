Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795410499221_47f3cf5a.jpg")

Write-Host "Checking badge pixels..."
# In media_1795410499221_47f3cf5a.jpg, the badge is around y=180..240, x=58..300
for ($y = 190; $y -le 240; $y += 10) {
    # find rightmost dark blue pixel in row y
    $rx = 0
    for ($x = 200; $x -lt 350; $x++) {
        $c = $src.GetPixel($x, $y)
        # dark navy badge is R < 30, G < 60, B > 50
        if ($c.R -lt 30 -and $c.B -gt 50) {
            $rx = $x
        }
    }
    Write-Host "y=$y, right edge x=$rx"
}
$src.Dispose()
