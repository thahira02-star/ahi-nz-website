Add-Type -AssemblyName System.Drawing
Get-ChildItem -Path 'scratch\chiller_slices' -Filter *.jpg | ForEach-Object {
    $img = [System.Drawing.Image]::FromFile($_.FullName)
    Write-Host "$($_.Name) : $($img.Width) x $($img.Height)"
    $img.Dispose()
}
