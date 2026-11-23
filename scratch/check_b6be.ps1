Add-Type -AssemblyName System.Drawing

$p = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795400090187_b6be2973.png"
if (Test-Path $p) {
    $img = [System.Drawing.Bitmap]::FromFile($p)
    Write-Host "media_1795400090187_b6be2973.png: $($img.Width) x $($img.Height)"
    $img.Dispose()
} else {
    Write-Host "File not found"
}
