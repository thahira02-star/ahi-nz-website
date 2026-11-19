$c = [System.IO.File]::ReadAllText("final output\predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$pos = $c.IndexOf("We tailor continuous")
if ($pos -ge 0) {
    $slice = $c.Substring($pos, 120)
    Write-Host "Slice: $slice"
    $chars = $slice.ToCharArray()
    foreach ($ch in $chars) {
        $code = [int]$ch
        if ($code -gt 127) {
            Write-Host "Char: $ch (0x$($code.ToString('X4')))"
        }
    }
}
