$pdmFiles = @(
    "final output\predictive-maintenance.html",
    "predictive-maintenance.html"
)

foreach ($path in $pdmFiles) {
    if (Test-Path $path) {
        $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

        # 1. Replace corrupted arrow symbols
        $content = $content.Replace("â†’", "&rarr;")

        # 2. Replace corrupted apostrophes
        $content = $content.Replace("buildingâ€™s", "building's")
        $content = $content.Replace("hospitalâ€™s", "hospital's")
        $content = $content.Replace("â€™", "'")

        # 3. Replace corrupted em-dashes and en-dashes
        $content = $content.Replace("â€”", "&mdash;")
        $content = $content.Replace("â€“", "&ndash;")

        # 4. Replace corrupted middle dots
        $content = $content.Replace("Â·", "&middot;")

        # 5. Replace corrupted checkmarks and close icons
        $content = $content.Replace("âœ“", "&#10003;")
        $content = $content.Replace("âœ•", "&times;")

        # 6. Replace corrupted bullets
        $content = $content.Replace("â€¢", "&bull;")

        # 7. Also replace any literal '→' with '&rarr;' for 100% ASCII safety
        $content = $content.Replace("→", "&rarr;")

        [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated $path"
    }
}

# Now for index.html files: replace literal → with &rarr; so arrows never glitch
$indexFiles = @(
    "final output\index.html",
    "index.html"
)

foreach ($path in $indexFiles) {
    if (Test-Path $path) {
        $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        $content = $content.Replace("→", "&rarr;")
        [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated $path"
    }
}
