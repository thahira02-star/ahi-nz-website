$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# 1. Update .what-is-grid to give the right column comfortable width
$oldGrid = @"
    .what-is-grid {
      display: grid;
      grid-template-columns: 1.05fr 1fr;
      gap: 56px;
      align-items: center;
    }
"@

$newGrid = @"
    .what-is-grid {
      display: grid;
      grid-template-columns: 460px 1fr;
      gap: 52px;
      align-items: center;
    }
"@

if ($content.Contains($oldGrid)) {
    $content = $content.Replace($oldGrid, $newGrid)
    Write-Host "Updated .what-is-grid column ratio"
} else {
    $content = [regex]::Replace($content, '(\.what-is-grid\s*\{[^}]*?grid-template-columns:\s*)[^;]+;', '${1}460px 1fr;')
    Write-Host "Updated .what-is-grid column ratio via regex"
}

# 2. Update .what-is-list-text to include desktop nowrap
$oldListText = @"
    .what-is-list-text {
      font-size: 15px;
      line-height: 1.55;
      color: var(--ahi-text-secondary);
      font-weight: 500;
    }
"@

$newListText = @"
    .what-is-list-text {
      font-size: 15px;
      line-height: 1.55;
      color: var(--ahi-text-secondary);
      font-weight: 500;
      white-space: nowrap;
    }

    @media (max-width: 1024px) {
      .what-is-list-text {
        white-space: normal;
      }
    }
"@

if ($content.Contains($oldListText)) {
    $content = $content.Replace($oldListText, $newListText)
    Write-Host "Updated .what-is-list-text with desktop nowrap"
} else {
    $content = [regex]::Replace($content, '(\.what-is-list-text\s*\{[^}]*?font-weight:\s*500;)', "`$1`r`n      white-space: nowrap;")
    Write-Host "Updated .what-is-list-text via regex"
}

# 3. Update the 4 bullet points in HTML with tick icons and 1-line concise copy
$oldListHtmlPattern = '(?s)<ul class="what-is-list">.*?</ul>'

$newListHtml = @"
<ul class="what-is-list">
            <li class="what-is-list-item">
              <span class="check-circle-blue" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
              </span>
              <span class="what-is-list-text">AHI Carrier Service offers nationwide commercial HVAC system repairs.</span>
            </li>
            <li class="what-is-list-item">
              <span class="check-circle-blue" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
              </span>
              <span class="what-is-list-text">Nationwide engineers providing rapid emergency and planned repair work.</span>
            </li>
            <li class="what-is-list-item">
              <span class="check-circle-blue" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
              </span>
              <span class="what-is-list-text">Extensive technical expertise minimizing commercial plant downtime.</span>
            </li>
            <li class="what-is-list-item">
              <span class="check-circle-blue" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
              </span>
              <span class="what-is-list-text">Fast, efficient repair response providing complete peace of mind.</span>
            </li>
          </ul>
"@

if ($content -match $oldListHtmlPattern) {
    $content = [regex]::Replace($content, $oldListHtmlPattern, $newListHtml.Trim())
    Write-Host "Successfully replaced what-is-list with tick icons and 1-line points."
} else {
    Write-Host "Error: what-is-list not found in HTML!"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
