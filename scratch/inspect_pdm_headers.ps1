$htmlPdm = Get-Content -Raw "predictive-maintenance.html"
$sections = [regex]::Matches($htmlPdm, '(?s)<section\b[^>]*>(.*?)</section>')
Write-Host "Found $($sections.Count) sections in predictive-maintenance.html"

for ($idx = 0; $idx -lt $sections.Count; $idx++) {
    $sec = $sections[$idx].Value
    $mId = [regex]::Match($sec, 'id="([^"]+)"')
    $mClass = [regex]::Match($sec, 'class="([^"]+)"')
    Write-Host "=== Section $idx (id='$($mId.Groups[1].Value)', class='$($mClass.Groups[1].Value)') ==="
    
    # Check eyebrow
    $eyebrowMatch = [regex]::Match($sec, '(?s)<span[^>]*class="[^"]*eyebrow[^"]*"[^>]*>(.*?)</span>')
    if ($eyebrowMatch.Success) {
        Write-Host "  EYEBROW: $($eyebrowMatch.Groups[1].Value.Trim())"
    } else {
        Write-Host "  EYEBROW: NONE"
    }
    
    # Check heading
    $headingMatch = [regex]::Match($sec, '(?s)<(h[12])[^>]*class="([^"]*)"[^>]*>(.*?)</\1>')
    if ($headingMatch.Success) {
        $tag = $headingMatch.Groups[1].Value
        $cls = $headingMatch.Groups[2].Value
        $txt = [regex]::Replace($headingMatch.Groups[3].Value, '<[^>]+>', ' ').Trim()
        Write-Host "  HEADING <$tag class='$cls'>: $txt"
    }
    
    # Check subtitle / desc
    $descMatch = [regex]::Match($sec, '(?s)<p[^>]*class="([^"]*(?:desc|subtitle|lead)[^"]*)"[^>]*>(.*?)</p>')
    if ($descMatch.Success) {
        $cls = $descMatch.Groups[1].Value
        $txt = [regex]::Replace($descMatch.Groups[2].Value, '<[^>]+>', ' ').Trim()
        Write-Host "  DESC <p class='$cls'>: $txt"
    }
}
