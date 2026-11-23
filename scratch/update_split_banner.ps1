$path = "final output/preventative-maintenance.html"
$c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Fix em dash
$c = $c.Replace("AHI Carrier â€” A Carrier Joint Venture Company", "AHI Carrier — A Carrier Joint Venture Company")

# Add mobile responsive rules for split-banner
$oldRule = ".split-banner-card { grid-template-columns: 1fr; }"
$newRule = ".split-banner-card { grid-template-columns: 1fr; height: auto; min-height: auto; }`r`n      .split-banner-media { height: 320px; min-height: 320px; }`r`n      .split-banner-content { height: auto; min-height: auto; padding: 40px 32px; }"

if ($c.Contains($oldRule)) {
    $c = $c.Replace($oldRule, $newRule)
}

[System.IO.File]::WriteAllText($path, $c, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated final output/preventative-maintenance.html successfully"
