$files = @(
    "final output\index.html",
    "final output\predictive-maintenance.html"
)

foreach ($f in $files) {
    $text = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    $matches = [regex]::Matches($text, '[^\x00-\x7F]')
    Write-Host "$f has $($matches.Count) non-ASCII characters"
    $unique = $matches | ForEach-Object { $_.Value } | Select-Object -Unique
    Write-Host "Unique: $($unique -join ' ')"
}
