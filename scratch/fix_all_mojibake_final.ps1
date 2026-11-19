$seq_arrow   = [string][char]0x00E2 + [char]0x2020 + [char]0x2019 # â†’
$seq_arrow2  = [string][char]0x2192                               # →
$seq_apos    = [string][char]0x00E2 + [char]0x20AC + [char]0x2122 # â€™
$seq_emdash  = [string][char]0x00E2 + [char]0x20AC + [char]0x201D # â€”
$seq_endash  = [string][char]0x00E2 + [char]0x20AC + [char]0x201C # â€“
$seq_dot     = [string][char]0x00C2 + [char]0x00B7                # Â·
$seq_check   = [string][char]0x00E2 + [char]0x0153 + [char]0x201C # âœ“
$seq_close   = [string][char]0x00E2 + [char]0x0153 + [char]0x2022 # âœ•
$seq_bullet  = [string][char]0x00E2 + [char]0x20AC + [char]0x00A2 # â€¢

$pdmFiles = @(
    "final output\predictive-maintenance.html",
    "predictive-maintenance.html"
)

foreach ($path in $pdmFiles) {
    if (Test-Path $path) {
        $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

        $content = $content.Replace($seq_arrow,  "&rarr;")
        $content = $content.Replace($seq_arrow2, "&rarr;")
        $content = $content.Replace($seq_apos,   "'")
        $content = $content.Replace($seq_emdash, "&mdash;")
        $content = $content.Replace($seq_endash, "&ndash;")
        $content = $content.Replace($seq_dot,    "&middot;")
        $content = $content.Replace($seq_check,  "&#10003;")
        $content = $content.Replace($seq_close,  "&times;")
        $content = $content.Replace($seq_bullet, "&bull;")

        [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Cleaned all corrupted symbols in $path"
    }
}

$indexFiles = @(
    "final output\index.html",
    "index.html"
)

foreach ($path in $indexFiles) {
    if (Test-Path $path) {
        $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

        # Replace literal → with &rarr; so arrows never corrupt
        $content = $content.Replace($seq_arrow2, "&rarr;")

        [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated arrows in $path"
    }
}
