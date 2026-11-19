$content = Get-Content -Raw -Path "final output\predictive-maintenance.html"

$sections = @(
    "hero-section",
    "section-what-is",
    "section-pdm-savings",
    "section-how-it-works",
    "section-industry-focus",
    "section-calm-ops",
    "section-case-study",
    "section-pdm-equipment",
    "section-form-wrapper",
    "section-other-services"
)

foreach ($s in $sections) {
    if ($content -match "\.$s\s*\{([^}]+)\}") {
        $body = $matches[1]
        Write-Host "=== $s ==="
        foreach ($line in $body.Split("`n")) {
            if ($line -match "padding|margin") {
                Write-Host "   $($line.Trim())"
            }
        }
    } else {
        Write-Host "=== $s NOT FOUND ==="
    }
}
