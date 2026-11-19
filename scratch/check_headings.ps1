$content = Get-Content -Raw -Path "final output\predictive-maintenance.html"

# Find all heading tags and their classes in HTML
$pattern = '<(h[1-6])[^>]*class="([^"]*)"[^>]*>'
$matches = [regex]::Matches($content, $pattern)
$headingClasses = @{}
foreach ($m in $matches) {
    $tag = $m.Groups[1].Value
    $cls = $m.Groups[2].Value
    foreach ($c in $cls.Split(' ')) {
        if ($c) { $headingClasses[$c] = $tag }
    }
}

Write-Host "Found heading classes:"
foreach ($k in $headingClasses.Keys) {
    Write-Host "$k ($($headingClasses[$k]))"
}
