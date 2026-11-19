# Fine-tune hero section typography and dimensions in predictive-maintenance.html
$filePath = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

$oldCssPart = @"
    .hero-content-column {
      max-width: 620px;
      color: var(--ahi-white);
    }

    .hero-heading {
      font-size: 48px;
      font-weight: 600;
      line-height: 1.18;
      letter-spacing: -0.02em;
      margin-bottom: 18px;
      color: var(--ahi-white);
    }

    .hero-subtitle {
      font-size: 16px;
      font-weight: 400;
      line-height: 1.6;
      color: rgba(255, 255, 255, 0.92);
      margin-bottom: 32px;
      max-width: 580px;
    }
"@

$newCssPart = @"
    .hero-content-column {
      max-width: 700px;
      color: var(--ahi-white);
    }

    .hero-heading {
      font-size: 42px;
      font-weight: 600;
      line-height: 1.2;
      letter-spacing: -0.015em;
      margin-bottom: 16px;
      color: var(--ahi-white);
    }

    .hero-subtitle {
      font-size: 16px;
      font-weight: 400;
      line-height: 1.55;
      color: #ffffff;
      margin-bottom: 28px;
      max-width: 640px;
    }
"@

$contentNorm = $content.Replace("`r`n", "`n")
$oldNorm = $oldCssPart.Replace("`r`n", "`n")
$newNorm = $newCssPart.Replace("`r`n", "`n")

if ($contentNorm.Contains($oldNorm)) {
    $contentNorm = $contentNorm.Replace($oldNorm, $newNorm)
    [System.IO.File]::WriteAllText($filePath, $contentNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
    Copy-Item -Path $filePath -Destination "predictive-maintenance.html" -Force
    Write-Output "Successfully fine-tuned hero styling and mirrored to root!"
} else {
    Write-Warning "Could not find exact oldCssPart in $filePath"
}

