$files = @(
    "final output\index.html",
    "index.html",
    "final output\predictive-maintenance.html",
    "predictive-maintenance.html"
)

foreach ($f in $files) {
    if (Test-Path $f) {
        $matches = Select-String -Path $f -Pattern 'â'
        Write-Host "$f has $($matches.Count) lines with 'â'"
        if ($matches.Count -gt 0) {
            $matches | Select-Object -First 10 | ForEach-Object {
                Write-Host "  Line $($_.LineNumber): $($_.Line.Trim())"
            }
        }
    }
}
