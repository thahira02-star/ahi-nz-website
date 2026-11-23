Add-Type -AssemblyName System.Drawing

$src = [System.Drawing.Bitmap]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795412700453_d8bbe134.png")
Write-Host "Uploaded image Width: $($src.Width), Height: $($src.Height)"
$src.Dispose()
