$pdmPath = "final output\predictive-maintenance.html"
$content = Get-Content -Raw $pdmPath

$content = [regex]::Replace($content, '(\.calm-ops-desc\s*\{[^}]*?max-width:\s*)820px;', '${1}780px;')
$content = [regex]::Replace($content, '(\.equipment-lead-text\s*\{[^}]*?max-width:\s*)760px;', '${1}780px;')

[System.IO.File]::WriteAllText($pdmPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\predictive-maintenance.html" "predictive-maintenance.html" -Force
Write-Host "Updated final output\predictive-maintenance.html and synced to root"
