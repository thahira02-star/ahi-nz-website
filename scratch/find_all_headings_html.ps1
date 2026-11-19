$content = Get-Content -Raw -Path "final output\predictive-maintenance.html"
$pattern = '<(h[1-6])([^>]*)>([\s\S]*?)<\/\1>'
$matches = [regex]::Matches($content, $pattern)
foreach ($m in $matches) {
    $tag = $m.Groups[1].Value
    $attrs = $m.Groups[2].Value
    $text = $m.Groups[3].Value.Trim()
    if ($text.Length -gt 50) { $text = $text.Substring(0, 50) + "..." }
    Write-Host "<$tag $attrs> : $text"
}
