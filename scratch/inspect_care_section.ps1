Add-Type -AssemblyName System.Drawing

$img1 = [System.Drawing.Bitmap]::FromFile("C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.user_uploaded\media_1795410499221_47f3cf5a.jpg")
Write-Host "Uploaded image Width: $($img1.Width), Height: $($img1.Height)"
$img1.Dispose()

if (Test-Path "Reference files\preventative-care-tech.jpg") {
    $img2 = [System.Drawing.Bitmap]::FromFile("Reference files\preventative-care-tech.jpg")
    Write-Host "preventative-care-tech.jpg Width: $($img2.Width), Height: $($img2.Height)"
    $img2.Dispose()
}
