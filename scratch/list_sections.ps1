$content = Get-Content -Raw -Path "final output\predictive-maintenance.html"
$matches = [regex]::Matches($content, '<section[^>]*class="([^"]*)"[^>]*>')
foreach ($m in $matches) {
    Write-Host $m.Groups[1].Value
}
