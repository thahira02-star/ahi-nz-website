Add-Type -AssemblyName System.Drawing

$techImg = [System.Drawing.Bitmap]::FromFile("c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-hero-technician.jpg")
Write-Host "preventative-hero-technician.jpg Width: $($techImg.Width), Height: $($techImg.Height)"
$techImg.Dispose()
