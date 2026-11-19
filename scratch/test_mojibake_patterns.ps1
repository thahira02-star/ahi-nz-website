$path = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Check all occurrences of â†’
$arrowMatches = [regex]::Matches($content, 'â†[’\x27\x92]')
Write-Host "Found $($arrowMatches.Count) occurrences of â†'"

# Also check â†’
$arrowMatches2 = [regex]::Matches($content, 'â†’')
Write-Host "Found $($arrowMatches2.Count) occurrences of â†’"

# Check â€™
$quoteMatches = [regex]::Matches($content, 'â€™')
Write-Host "Found $($quoteMatches.Count) occurrences of â€™"

# Check â€”
$dashMatches = [regex]::Matches($content, 'â€”')
Write-Host "Found $($dashMatches.Count) occurrences of â€”"

# Check Â·
$dotMatches = [regex]::Matches($content, 'Â·')
Write-Host "Found $($dotMatches.Count) occurrences of Â·"
