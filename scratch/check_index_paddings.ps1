$content = Get-Content -Raw -Path "final output\index.html"

$sections = @(
    "hero-section",
    "section-what-is",
    "section-reasons-trust",
    "section-how-it-works",
    "section-importance",
    "section-emergencies",
    "section-industries",
    "section-form-wrapper",
    "section-other-services"
)

Write-Host "=== CHECKING SECTION PADDINGS IN final output\index.html ==="
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
