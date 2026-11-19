$c = [System.IO.File]::ReadAllText("final output\index.html", [System.Text.Encoding]::UTF8)

$chars = $c.ToCharArray()
$nonAsciiSequences = @()
$currentSeq = ""
for ($i = 0; $i -lt $chars.Length; $i++) {
    $code = [int]$chars[$i]
    if ($code -gt 127) {
        $hex = "0x" + $code.ToString("X4")
        $currentSeq += "[$($chars[$i]) $hex] "
    } else {
        if ($currentSeq.Length -gt 0) {
            $nonAsciiSequences += $currentSeq
            $currentSeq = ""
        }
    }
}
if ($currentSeq.Length -gt 0) { $nonAsciiSequences += $currentSeq }

$uniqueSeqs = $nonAsciiSequences | Select-Object -Unique
Write-Host "Unique non-ASCII multi-char sequences in index.html:"
foreach ($seq in $uniqueSeqs) {
    Write-Host "  $seq"
}
