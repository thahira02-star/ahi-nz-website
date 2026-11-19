$files = @("index.html", "predictive-maintenance.html")
foreach ($f in $files) {
    Write-Host "=== $f ==="
    $lines = Get-Content $f
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match "check-circle|polyline points=.*20 6 9 17 4 12|points=.*9 17 4 12|checkmark") {
            Write-Host "Line $($i+1): $($lines[$i].Trim())"
        }
    }
}
