Add-Type -AssemblyName System.Drawing

$p1 = "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-banner-tech.jpg"
$img1 = [System.Drawing.Bitmap]::FromFile($p1)

$p2 = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795414604878_72bdbeb3.png"
$img2 = [System.Drawing.Bitmap]::FromFile($p2)

Write-Host "Image 1 (preventative-banner-tech.jpg): $($img1.Width) x $($img1.Height)"
Write-Host "Image 2 (media_1795414604878_72bdbeb3.png): $($img2.Width) x $($img2.Height)"

# In media_1795414604878_72bdbeb3.png, the photo is from x=35 to x=490 (width 455), y=15 to y=340 (height 325)
# Let's crop the exact photo from media_1795414604878_72bdbeb3.png!
$cropRect = New-Object System.Drawing.Rectangle(35, 15, 455, 325)
$photoFigma = $img2.Clone($cropRect, [System.Drawing.Imaging.PixelFormat]::Format24bppRgb)
Write-Host "Figma photo cropped: $($photoFigma.Width) x $($photoFigma.Height)"

# Sample pixel in center of rooftop sky (e.g. at x=100, y=50 in photo)
$c1 = $img1.GetPixel(150, 50)
$c2 = $photoFigma.GetPixel(100, 50)
Write-Host "Sky pixel in preventative-banner-tech: R=$($c1.R), G=$($c1.G), B=$($c1.B)"
Write-Host "Sky pixel in Figma screenshot: R=$($c2.R), G=$($c2.G), B=$($c2.B)"

$photoFigma.Dispose()
$img1.Dispose()
$img2.Dispose()
