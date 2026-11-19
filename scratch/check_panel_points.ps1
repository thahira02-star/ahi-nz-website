$content = Get-Content -Raw "final output\predictive-maintenance.html"
$panels = @("panel-hospitals", "panel-hospitality", "panel-datacenters", "panel-manufacturing", "panel-retail", "panel-commercial")
foreach ($p in $panels) {
    Write-Host "=== $p ==="
    if ($content -match "id=`"$p`"[\s\S]*?<ul class=`"industry-points-list`">([\s\S]*?)</ul>") {
        $list = $matches[1]
        $items = [regex]::Matches($list, '<span>([^<]+)</span>\s*</li>')
        foreach ($it in $items) {
            $t = $it.Groups[1].Value.Trim()
            $words = $t.Split(" ")
            Write-Host "  ($($t.Length) chars, $($words.Count) words): $t"
        }
    }
}
