$html = Get-Content -Raw "final output\index.html"

# Let's inspect sections 01 to 08 in final output\index.html
$secPatterns = @(
    'section-what-is',
    'section-reasons-trust',
    'section-how-it-works',
    'section-importance',
    'section-emergencies',
    'section-industries',
    'section-form-wrapper',
    'section-other-services'
)

foreach ($p in $secPatterns) {
    if ($html -match "(?s)(<section[^>]*class=""[^""]*$p[^""]*""[^>]*>.*?</section>)") {
        $sec = $matches[1]
        Write-Host "================ $p ================"
        # print first 500 chars
        $preview = if ($sec.Length -gt 600) { $sec.Substring(0, 600) } else { $sec }
        Write-Host $preview
    }
}
