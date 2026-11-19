$css = Get-Content -Raw "index.html"
# find classes:
$classes = @(
    "hero-subtitle",
    "reasons-trust-subtitle",
    "section-lead-text",
    "importance-banner-desc",
    "form-panel-desc",
    "what-is-desc",
    "process-subtitle"
)
foreach ($c in $classes) {
    if ($css -match "(?s)\.$c\s*\{([^}]+)\}") {
        Write-Host "=== .$c ==="
        Write-Host $matches[1].Trim()
    } else {
        Write-Host "=== .$c NOT FOUND IN CSS ==="
    }
}
