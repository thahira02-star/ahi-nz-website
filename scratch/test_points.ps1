Add-Type -AssemblyName System.Drawing
$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795004128205_4a8ff49f.jpg"
$bytes = [System.IO.File]::ReadAllBytes($srcPath)
$ms = New-Object System.IO.MemoryStream(,$bytes)
$bmp = [System.Drawing.Bitmap]::FromStream($ms)

# Let's check coordinates around x=540
# The photo is on the right:
# Let's inspect x=985 to 995, y=70 to 420
# Let's print colors at specific test points:
Write-Output "x=545, y=100: $($bmp.GetPixel(545, 100))"
Write-Output "x=980, y=100: $($bmp.GetPixel(980, 100))"
Write-Output "x=985, y=100: $($bmp.GetPixel(985, 100))"
Write-Output "x=990, y=100: $($bmp.GetPixel(990, 100))"
Write-Output "x=700, y=70: $($bmp.GetPixel(700, 70))"
Write-Output "x=700, y=75: $($bmp.GetPixel(700, 75))"
Write-Output "x=700, y=410: $($bmp.GetPixel(700, 410))"
Write-Output "x=700, y=415: $($bmp.GetPixel(700, 415))"
Write-Output "x=700, y=420: $($bmp.GetPixel(700, 420))"
Write-Output "x=700, y=425: $($bmp.GetPixel(700, 425))"

$bmp.Dispose()
$ms.Dispose()
