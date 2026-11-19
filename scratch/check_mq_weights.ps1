$matches = Select-String -Path "final output\predictive-maintenance.html" -Pattern "font-weight"
foreach ($m in $matches) {
    if ($m.LineNumber -gt 2700) {
        Write-Host "$($m.LineNumber): $($m.Line.Trim())"
    }
}
