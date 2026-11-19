$content = Get-Content -Raw "index.html"
# Look for classes like section-subtitle, section-desc, lead, etc.
$matches = [regex]::Matches($content, '<p class="([^"]*)"[^>]*>([^<]*)</p>')
foreach ($m in $matches) {
    Write-Host "Class: $($m.Groups[1].Value) | Length: $($m.Groups[2].Value.Length) | Text: $($m.Groups[2].Value.Trim())"
}
