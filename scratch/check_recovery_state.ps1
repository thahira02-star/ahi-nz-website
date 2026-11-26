$path = 'C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\.system_generated\logs\transcript.jsonl'
$lines = Get-Content $path

Write-Host "=== USER INPUTS ON NOV 24-25 ==="
$idx = 0
foreach ($line in $lines) {
    $idx++
    if ($line -match '"type":"USER_INPUT"' -and ($line -match '2026-11-24' -or $line -match '2026-11-25')) {
        try {
            $obj = $line | ConvertFrom-Json
            $c = $obj.content -replace "`r`n", " " -replace "`n", " "
            if ($c.Length -gt 140) { $c = $c.Substring(0, 140) + "..." }
            Write-Host "[$idx] $($obj.created_at) | $c"
        } catch {
            Write-Host "[$idx] parse error"
        }
    }
}
