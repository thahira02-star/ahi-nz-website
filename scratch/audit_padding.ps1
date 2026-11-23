$files = @('final output/chiller-maintenance.html', 'final output/preventative-maintenance.html')

foreach ($fpath in $files) {
    Write-Host "===================="
    Write-Host $fpath
    Write-Host "===================="
    $text = [System.IO.File]::ReadAllText($fpath, [System.Text.Encoding]::UTF8)
    
    $matches = [regex]::Matches($text, '<section[^>]*class=["'']([^"'']+)["'']')
    $classes = @()
    foreach ($m in $matches) {
        $cNames = $m.Groups[1].Value.Split(' ')
        foreach ($cn in $cNames) {
            if ($cn -and $classes -notcontains $cn) {
                $classes += $cn
            }
        }
    }
    
    foreach ($cls in $classes) {
        $ruleRegex = [regex]('(?ms)\.' + [regex]::Escape($cls) + '\s*\{([^}]+)\}')
        $ruleMatch = $ruleRegex.Match($text)
        if ($ruleMatch.Success) {
            $body = $ruleMatch.Groups[1].Value
            $padLines = ($body.Split("`n") | Where-Object { $_ -match 'padding' }) -join '; '
            Write-Host ("." + $cls + " -> " + $padLines.Trim())
        } else {
            Write-Host ("." + $cls + " -> [NO DIRECT RULE]")
        }
    }
}
