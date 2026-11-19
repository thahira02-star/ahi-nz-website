$lines = Get-Content -Path "final output\predictive-maintenance.html" -Encoding utf8
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "â|Â|Ã") {
        Write-Host "$($i+1): $($lines[$i].Trim())"
    }
}
