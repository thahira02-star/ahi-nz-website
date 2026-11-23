Add-Type -AssemblyName System.Drawing

$p = "c:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\Reference files\preventative-banner-tech.jpg"
if (Test-Path $p) {
    $img = [System.Drawing.Bitmap]::FromFile($p)
    Write-Host "preventative-banner-tech.jpg: $($img.Width) x $($img.Height)"
    $img.Dispose()
} else {
    Write-Host "Not found"
}
