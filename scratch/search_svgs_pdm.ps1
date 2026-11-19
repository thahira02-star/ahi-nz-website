$html = Get-Content -Raw "predictive-maintenance.html"
$matches = [regex]::Matches($html, '(?s)<svg[^>]*>.*?</svg>')
Write-Host "Found $($matches.Count) SVGs in predictive-maintenance.html"
foreach ($m in $matches) {
    if ($m.Value -match "polyline.*9.*17.*4.*12|check") {
        Write-Host "Check SVG found: $($m.Value)"
    }
}
