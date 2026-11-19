Add-Type -AssemblyName System.Drawing
$srcPath = "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795004128205_4a8ff49f.jpg"
Write-Output "Checking exists: $(Test-Path $srcPath)"
if (Test-Path $srcPath) {
    $bytes = [System.IO.File]::ReadAllBytes($srcPath)
    Write-Output "Read bytes: $($bytes.Length)"
    $ms = New-Object System.IO.MemoryStream(,$bytes)
    $img = [System.Drawing.Image]::FromStream($ms)
    Write-Output "Image size: $($img.Width) x $($img.Height)"
    
    # In media_1795004128205_4a8ff49f.jpg (1024 x 576 or similar):
    # The hospital photo is located on the right side.
    # Let's calculate the bounding box for the hospital photo.
    # We will also save the cropped image into Reference files/auckland-hospital.jpg
    $img.Dispose()
    $ms.Dispose()
}
