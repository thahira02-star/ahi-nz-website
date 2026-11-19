# Replace Hero Section in final output\predictive-maintenance.html
$ErrorActionPreference = "Stop"

$filePath = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Update CSS for hero background image
$oldBg = "url('Reference files/hero section bg.png');"
$newBg = "linear-gradient(90deg, rgba(10, 24, 45, 0.88) 0%, rgba(10, 24, 45, 0.78) 42%, rgba(10, 24, 45, 0.22) 70%, transparent 88%),`r`n        url('Reference files/predictive hero section bg.png');"

# In CSS, the background-image block:
$oldCssBg = "linear-gradient(90deg, rgba(10, 24, 45, 0.92) 0%, rgba(10, 24, 45, 0.82) 42%, rgba(10, 24, 45, 0.3) 75%, rgba(10, 24, 45, 0) 100%),`r`n        url('Reference files/hero section bg.png');"
$newCssBg = "linear-gradient(90deg, rgba(10, 24, 45, 0.88) 0%, rgba(10, 24, 45, 0.78) 42%, rgba(10, 24, 45, 0.22) 70%, transparent 88%),`r`n        url('Reference files/predictive hero section bg.png');"

# Normalize newlines
$contentNorm = $content.Replace("`r`n", "`n")
$oldCssBgNorm = "linear-gradient(90deg, rgba(10, 24, 45, 0.92) 0%, rgba(10, 24, 45, 0.82) 42%, rgba(10, 24, 45, 0.3) 75%, rgba(10, 24, 45, 0) 100%),`n        url('Reference files/hero section bg.png');"
$newCssBgNorm = "linear-gradient(90deg, rgba(10, 24, 45, 0.88) 0%, rgba(10, 24, 45, 0.78) 42%, rgba(10, 24, 45, 0.22) 70%, transparent 88%),`n        url('Reference files/predictive hero section bg.png');"

if ($contentNorm.Contains($oldCssBgNorm)) {
    $contentNorm = $contentNorm.Replace($oldCssBgNorm, $newCssBgNorm)
    Write-Output "Updated CSS background image"
} else {
    Write-Warning "Could not find exact oldCssBgNorm, checking simple replace"
    $contentNorm = $contentNorm.Replace("url('Reference files/hero section bg.png');", "url('Reference files/predictive hero section bg.png');")
}

# 2. Replace Hero HTML section
$heroStartToken = '<section class="hero-section"'
$heroStartPos = $contentNorm.IndexOf($heroStartToken)

$nextSectionToken = '<!-- ==========================================================================' + "`n" + '       SECTION 01 · WHAT IS PREDICTIVE MAINTENANCE?'
$nextSectionPos = $contentNorm.IndexOf($nextSectionToken)

if ($heroStartPos -lt 0 -or $nextSectionPos -lt 0) {
    throw "Could not find hero section boundaries in contentNorm"
}

# Find the </section> right before $nextSectionPos
$heroEndPos = $contentNorm.LastIndexOf('</section>', $nextSectionPos) + '</section>'.Length

$newHeroHtml = @"
<section class="hero-section" aria-labelledby="hero-pdm-title">
    <div class="container">
      <div class="hero-content-column">
        <h1 id="hero-pdm-title" class="hero-heading">Predictive Maintenance service</h1>
        <p class="hero-subtitle">Predictive HVAC maintenance uses IoT sensors, real-time data analytics, and machine learning to monitor equipment conditions and forecast failures before they happen</p>
        
        <div class="hero-button-cluster">
          <a href="#request-consultation" class="btn-hero-primary">Request a Service</a>
        </div>
      </div>
    </div>
  </section>
"@

$beforeHero = $contentNorm.Substring(0, $heroStartPos)
$afterHero = $contentNorm.Substring($heroEndPos)

$finalNorm = $beforeHero + $newHeroHtml.Replace("`r`n", "`n") + $afterHero

[System.IO.File]::WriteAllText($filePath, $finalNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated $filePath"

# Mirror to root predictive-maintenance.html
Copy-Item -Path $filePath -Destination "predictive-maintenance.html" -Force
Write-Output "Successfully mirrored to root predictive-maintenance.html"

