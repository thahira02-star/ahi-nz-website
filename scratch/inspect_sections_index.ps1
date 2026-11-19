$html = Get-Content -Raw "index.html"
$sections = [regex]::Matches($html, '(?s)<section\b[^>]*>(.*?)</section>')
Write-Host "Found $($sections.Count) sections in index.html"
for ($idx = 0; $idx -lt $sections.Count; $idx++) {
    $sec = $sections[$idx].Value
    $mId = [regex]::Match($sec, 'id="([^"]+)"')
    $mClass = [regex]::Match($sec, 'class="([^"]+)"')
    $secName = "Section $idx id=" + $mId.Groups[1].Value + " class=" + $mClass.Groups[1].Value
    Write-Host "--- $secName ---"
    $headers = [regex]::Matches($sec, '(?s)<(h[1-3]|p|div)\s+class="([^"]*(?:heading|title|subtitle|desc|lead|caption)[^"]*)"[^>]*>(.*?)</\1>')
    foreach ($h in $headers) {
        $tag = $h.Groups[1].Value
        $cls = $h.Groups[2].Value
        $txt = [regex]::Replace($h.Groups[3].Value, '<[^>]+>', ' ').Trim()
        if ($txt.Length -gt 120) { $txt = $txt.Substring(0, 120) + "..." }
        Write-Host "  <$tag class='$cls'>: $txt"
    }
}
