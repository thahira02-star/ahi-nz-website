$content = Get-Content -Raw -Path "final output\predictive-maintenance.html"

$classes = @(
    "hero-heading",
    "what-is-heading",
    "what-is-card-title",
    "pdm-savings-title",
    "pdm-savings-label",
    "pdm-process-heading",
    "pdm-process-card-title",
    "industry-focus-title",
    "industry-card-heading",
    "calm-ops-title",
    "calm-hero-title",
    "calm-card-title",
    "case-study-title",
    "section-title-h2",
    "industry-card-title",
    "form-panel-title",
    "service-card-title",
    "mega-services-heading"
)

foreach ($c in $classes) {
    if ($content -match "\.$c\s*\{([^}]+)\}") {
        $body = $matches[1]
        if ($body -match "font-weight:\s*([^;]+);") {
            Write-Host "$c -> font-weight: $($matches[1].Trim())"
        } else {
            Write-Host "$c -> NO font-weight (inherits or default)"
        }
    } else {
        Write-Host "$c -> rule not matched directly"
    }
}
