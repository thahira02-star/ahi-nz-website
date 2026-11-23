Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795410905116_a4b5f5a5.jpg"
$img = [System.Drawing.Bitmap]::FromFile($srcPath)
Write-Host "media_1795410905116_a4b5f5a5.jpg Width: $($img.Width), Height: $($img.Height)"
$img.Dispose()
