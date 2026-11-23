$path = "final output\predictive-maintenance.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

# Find where the duplicate starts
$dupStart = -1
$dupEnd = -1

for ($i = 4340; $i -lt 4400; $i++) {
    if ($lines[$i] -match '^\s*</div>' -and $lines[$i+1] -match 'Image Placeholder') {
        $dupStart = $i + 1
        break
    }
}

for ($i = $dupStart; $i -lt $dupStart + 200; $i++) {
    if ($lines[$i] -match '^\s*</div>' -and $lines[$i+1] -match '^\s*</div>' -and $lines[$i+2] -match '^\s*</section>') {
        $dupEnd = $i
        break
    }
}

Write-Host "dupStart: $dupStart, dupEnd: $dupEnd"

if ($dupStart -gt 0 -and $dupEnd -ge $dupStart) {
    $cleanLines = [System.Collections.Generic.List[string]]::new()
    for ($i = 0; $i -lt $dupStart; $i++) {
        $cleanLines.Add($lines[$i])
    }
    for ($i = $dupEnd + 1; $i -lt $lines.Length; $i++) {
        $cleanLines.Add($lines[$i])
    }

    [System.IO.File]::WriteAllLines($path, $cleanLines, [System.Text.Encoding]::UTF8)
    Write-Host "Removed duplicate lines from $dupStart to $dupEnd!"
}
