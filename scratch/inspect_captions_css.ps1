$files = @("index.html", "predictive-maintenance.html")
foreach ($f in $files) {
    Write-Host "================== $f =================="
    $css = Get-Content -Raw $f
    $matches = [regex]::Matches($css, '(?s)(\.[a-zA-Z0-9_-]*(?:desc|subtitle|lead|caption)[a-zA-Z0-9_-]*\s*\{[^}]+\})')
    foreach ($m in $matches) {
        $rule = $m.Groups[1].Value
        # filter to rules that have font-size or color or max-width or text-align
        if ($rule -match "max-width|text-align") {
            Write-Host $rule.Trim()
            Write-Host "---"
        }
    }
}
