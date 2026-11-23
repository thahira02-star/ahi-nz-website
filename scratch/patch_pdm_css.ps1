$path = "final output\predictive-maintenance.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match '\.equipment-section-header \.section-title-h2') {
        # update color in the next few lines
        for ($j = $i; $j -lt $i + 8; $j++) {
            if ($lines[$j] -match 'color:\s*#163568;') {
                $lines[$j] = $lines[$j] -replace '#163568', '#0d0d0d'
                Write-Host "Updated heading color at line $j to #0d0d0d"
                break
            }
        }
    }
}

# Now find the block starting with .equipment-dir-item { around line 2310
# and ending at line 2460
$startIdx = -1
$endIdx = -1
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match '^\s*\.equipment-dir-item\s*\{' -and $i -gt 2250 -and $i -lt 2350) {
        $startIdx = $i
    }
    if ($lines[$i] -match 'SECTION 07 &middot; REQUEST SERVICE' -and $i -gt 2400 -and $i -lt 2500) {
        $endIdx = $i - 3
        break
    }
}

Write-Host "startIdx: $startIdx, endIdx: $endIdx"

if ($startIdx -gt 0 -and $endIdx -gt $startIdx) {
    $newCssLines = @(
'    .equipment-dir-item {',
'      display: flex;',
'      flex-direction: column;',
'      background-color: #FFFFFF;',
'      border: 1px solid #E2E8F0;',
'      border-radius: 12px;',
'      padding: 12px;',
'      box-sizing: border-box;',
'      box-shadow: 0 2px 8px rgba(16, 47, 88, 0.04);',
'      cursor: pointer;',
'      position: relative;',
'      transition: all 0.25s ease;',
'    }',
'',
'    .equipment-dir-item:hover {',
'      border-color: #38BDF8;',
'      box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15), 0 10px 24px -4px rgba(22, 56, 101, 0.10);',
'      transform: translateY(-3px);',
'    }',
'',
'    /* Carefully Proportioned Machinery Photo Frame */',
'    .equipment-photo-frame {',
'      width: 100%;',
'      height: 110px;',
'      border-radius: 8px;',
'      overflow: hidden;',
'      position: relative;',
'      background-color: #F1F5F9;',
'      margin-bottom: 12px;',
'    }',
'',
'    .equipment-machinery-img {',
'      width: 100%;',
'      height: 100%;',
'      object-fit: cover;',
'      display: block;',
'      transition: transform 0.3s ease;',
'    }',
'',
'    .equipment-dir-item:hover .equipment-machinery-img {',
'      transform: scale(1.05);',
'    }',
'',
'    /* Item Typographic Content */',
'    .equipment-item-body {',
'      padding: 0;',
'      display: flex;',
'      flex-direction: column;',
'      flex: 1;',
'    }',
'',
'    .equipment-asset-code {',
'      font-size: 10.5px;',
'      font-weight: 700;',
'      color: #64748B;',
'      letter-spacing: 0.08em;',
'      text-transform: uppercase;',
'      margin-bottom: 4px;',
'    }',
'',
'    .equipment-item-title {',
'      font-family: ''Montserrat'', sans-serif;',
'      font-size: 13px;',
'      font-weight: 700;',
'      color: #163865;',
'      line-height: 1.3;',
'      margin: 0 0 10px 0;',
'      white-space: nowrap;',
'      overflow: hidden;',
'      text-overflow: ellipsis;',
'      text-align: left;',
'    }',
'',
'    /* Wrapped Metric Chips Grid Layout: 2 chips on row 1, 1 chip on row 2 */',
'    .equipment-metrics-list {',
'      display: flex;',
'      flex-wrap: wrap;',
'      gap: 6px;',
'      width: 100%;',
'      margin-top: auto;',
'    }',
'',
'    .equipment-metric-chip {',
'      display: inline-flex;',
'      align-items: center;',
'      justify-content: center;',
'      text-align: center;',
'      background-color: #F8FAFC;',
'      border: 1px solid #E2E8F0;',
'      border-radius: 6px;',
'      padding: 4px 8px;',
'      font-family: ''Montserrat'', sans-serif;',
'      font-size: 10.5px;',
'      font-weight: 500;',
'      color: #475569;',
'      line-height: 1.2;',
'      box-sizing: border-box;',
'      white-space: nowrap;',
'      transition: all 0.2s ease;',
'    }',
'',
'    .equipment-dir-item:hover .equipment-metric-chip {',
'      background-color: #EFF6FF;',
'      border-color: #BFDBFE;',
'      color: #163865;',
'    }',
''
    )

    $allLines = [System.Collections.Generic.List[string]]::new()
    for ($i = 0; $i -lt $startIdx; $i++) {
        $allLines.Add($lines[$i])
    }
    foreach ($nl in $newCssLines) {
        $allLines.Add($nl)
    }
    for ($i = $endIdx + 1; $i -lt $lines.Length; $i++) {
        $allLines.Add($lines[$i])
    }

    [System.IO.File]::WriteAllLines($path, $allLines, [System.Text.Encoding]::UTF8)
    Write-Host "Successfully replaced CSS lines!"
}
