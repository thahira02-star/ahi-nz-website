$lines = Get-Content "final output\index.html"
for ($i=0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match "SECTION \d\d") {
        Write-Output "$($i + 1): $($lines[$i])"
    }
}
