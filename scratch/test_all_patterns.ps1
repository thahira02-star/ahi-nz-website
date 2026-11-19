$path = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Arrow: â†’
$m_arrow = [string][char]0x00E2 + [char]0x2020 + [char]0x2019
Write-Host "Arrow found: $($content.Contains($m_arrow))"

# 2. Em dash: â€”
$m_emdash = [string][char]0x00E2 + [char]0x20AC + [char]0x201D
Write-Host "Em-dash found: $($content.Contains($m_emdash))"

# 3. En dash: â€“
# let's find the exact char after 0x20AC
$pos = $content.IndexOf("Hospital in Auckland")
if ($pos -ge 0) {
    $slice = $content.Substring($pos, 40)
    Write-Host "Hospital line slice:"
    for ($i = 0; $i -lt $slice.Length; $i++) {
        $ch = $slice[$i]
        $code = [int][char]$ch
        if ($code -gt 127) {
            Write-Host "  Char: $ch (0x$($code.ToString('X4')))"
        }
    }
}

# 4. Apostrophe in building's
$pos2 = $content.IndexOf("building")
if ($pos2 -ge 0) {
    $slice2 = $content.Substring($pos2, 25)
    Write-Host "Building slice:"
    for ($i = 0; $i -lt $slice2.Length; $i++) {
        $ch = $slice2[$i]
        $code = [int][char]$ch
        if ($code -gt 127) {
            Write-Host "  Char: $ch (0x$($code.ToString('X4')))"
        }
    }
}
