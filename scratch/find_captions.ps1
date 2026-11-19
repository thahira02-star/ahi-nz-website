$files = @("index.html", "predictive-maintenance.html")
foreach ($f in $files) {
    Write-Host "================== $f =================="
    $lines = Get-Content $f
    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i] -match "hero-desc|hero-sub|section-desc|desc|subtitle|lead" -and $lines[$i] -match "max-width") {
            Write-Host "Line $($i+1): $($lines[$i].Trim())"
        }
    }
}
