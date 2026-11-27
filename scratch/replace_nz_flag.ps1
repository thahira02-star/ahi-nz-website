$whiteNzFlag = @'
<svg width="18" height="12" viewBox="0 0 24 16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" style="flex-shrink:0;" aria-hidden="true">
              <rect x="0.75" y="0.75" width="22.5" height="14.5" rx="1.5" stroke-width="1.4"/>
              <path d="M1 1L11.5 8M11.5 1L1 8" stroke-width="1"/>
              <path d="M6.25 1V8M1 4.5H11.5" stroke-width="1.3"/>
              <circle cx="18" cy="3.5" r="0.85" fill="currentColor" stroke="none"/>
              <circle cx="15.5" cy="6.8" r="0.85" fill="currentColor" stroke="none"/>
              <circle cx="20.5" cy="6.2" r="0.8" fill="currentColor" stroke="none"/>
              <circle cx="18" cy="12" r="0.95" fill="currentColor" stroke="none"/>
            </svg>
'@

$pattern = '(?s)(<a href="#nz" class="utility-link" aria-label="New Zealand region selector" aria-haspopup="true">\s*)<svg .*?</svg>(\s*<span>New Zealand</span>)'

foreach ($file in @("index.html", "chiller-maintenance.html", "planned-hvac-maintenance.html", "predictive-maintenance.html", "preventative-maintenance.html")) {
  $path = (Resolve-Path $file).Path
  $txt = [System.IO.File]::ReadAllText($path)
  if ($txt -match $pattern) {
    $txt = [regex]::Replace($txt, $pattern, ('$1' + $whiteNzFlag + '$2'), 1)
    [System.IO.File]::WriteAllText($path, $txt, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output "Updated $file"
  } else {
    Write-Error "Pattern not found in $file"
  }
}
