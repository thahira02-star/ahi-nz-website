$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# Update grid-template-columns and .what-is-photo-wrapper width to 480px
$content = [regex]::Replace($content, '(\.what-is-grid\s*\{[^}]*?grid-template-columns:\s*)[^;]+;', '${1}480px 1fr;')
$content = [regex]::Replace($content, '(\.what-is-photo-wrapper\s*\{)', "`$1`r`n      width: 480px;`r`n      max-width: 100%;")

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Updated photo width to 480px in final output\index.html and synced to index.html"
