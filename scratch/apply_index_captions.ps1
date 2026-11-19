$indexPath = "final output\index.html"
$content = Get-Content -Raw $indexPath

# 1. Update .hero-subtitle max-width: 580px -> max-width: 780px
$oldHero = @"
    .hero-subtitle {
      font-size: 16px;
      font-weight: 400;
      line-height: 1.6;
      color: #E2E8F0;
      margin-bottom: 30px;
      max-width: 580px;
    }
"@

$newHero = @"
    .hero-subtitle {
      font-size: 16px;
      font-weight: 400;
      line-height: 1.6;
      color: #E2E8F0;
      margin-bottom: 30px;
      max-width: 780px;
    }
"@

if ($content.Contains($oldHero)) {
    $content = $content.Replace($oldHero, $newHero)
    Write-Host "Replaced hero-subtitle max-width: 580px -> 780px"
} else {
    Write-Host "Warning: oldHero not found exactly, trying regex"
    $content = [regex]::Replace($content, '(\.hero-subtitle\s*\{[^}]*?max-width:\s*)580px;', '${1}780px;')
}

# 2. Update .form-panel-desc to ensure max-width: 780px
$oldForm = @"
    .form-panel-desc {
      font-size: 14px;
      color: var(--ahi-text-light);
      line-height: 1.6;
      margin-bottom: 30px;
    }
"@

$newForm = @"
    .form-panel-desc {
      font-size: 14px;
      color: var(--ahi-text-light);
      line-height: 1.6;
      margin-bottom: 30px;
      max-width: 780px;
    }
"@

if ($content.Contains($oldForm)) {
    $content = $content.Replace($oldForm, $newForm)
    Write-Host "Replaced form-panel-desc with max-width: 780px"
} else {
    Write-Host "Warning: oldForm not found"
}

# 3. Update .importance-banner-desc to ensure max-width: 780px
$oldImp = @"
    .importance-banner-desc {
      font-size: 14px;
      color: rgba(255, 255, 255, 0.9);
      line-height: 1.55;
      margin-bottom: 20px;
    }
"@

$newImp = @"
    .importance-banner-desc {
      font-size: 14px;
      color: rgba(255, 255, 255, 0.9);
      line-height: 1.55;
      margin-bottom: 20px;
      max-width: 780px;
    }
"@

if ($content.Contains($oldImp)) {
    $content = $content.Replace($oldImp, $newImp)
    Write-Host "Replaced importance-banner-desc with max-width: 780px"
} else {
    Write-Host "Warning: oldImp not found"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Saved final output\index.html"

Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Copied to index.html"
