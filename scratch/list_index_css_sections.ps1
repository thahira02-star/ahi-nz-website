$lines = Get-Content "final output\index.html"
for ($i=1200; $i -lt 2200; $i++) {
    if ($lines[$i] -match "SECTION \d\d") {
        Write-Output "$($i + 1): $($lines[$i])"
    }
}
