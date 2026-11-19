$files = @("index.html", "predictive-maintenance.html")
foreach ($f in $files) {
    Write-Host "=== $f ==="
    $lines = Get-Content $f
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match "arrow|btn-arrow") {
            Write-Host "Line $($i+1): $($lines[$i].Trim())"
        }
    }
}
