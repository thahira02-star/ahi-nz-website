$path = "final output\predictive-maintenance.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

for ($i = 0; $i -lt $lines.Length; $i++) {
    $line = $lines[$i]
    if ($line.Contains("â") -or $line.Contains("Â")) {
        Write-Host "Line $($i+1): $line"
    }
}
