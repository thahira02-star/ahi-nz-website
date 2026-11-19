$lines = Get-Content -Path "final output\predictive-maintenance.html"
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match "font-weight:\s*(700|bold)") {
        $start = [Math]::Max(0, $i - 4)
        $end = [Math]::Min($lines.Length - 1, $i + 2)
        Write-Host "=== Line $($i+1) ==="
        for ($j = $start; $j -le $end; $j++) {
            Write-Host "$($j+1): $($lines[$j])"
        }
    }
}
