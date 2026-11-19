$indexPath = "final output\index.html"
$content = Get-Content -Raw $indexPath

$content = [regex]::Replace($content, '(\.importance-banner-desc\s*\{[^}]*?margin-bottom:\s*20px;)', "`$1`r`n      max-width: 780px;")
$content = [regex]::Replace($content, '(\.form-panel-desc\s*\{[^}]*?margin-bottom:\s*30px;)', "`$1`r`n      max-width: 780px;")

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Updated final output\index.html and synced to index.html"
