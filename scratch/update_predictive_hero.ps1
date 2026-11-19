# Update Hero Section in predictive-maintenance.html
$ErrorActionPreference = "Stop"

$filePath = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Update Hero CSS
$oldCss = @"
    .hero-section {
      position: relative;
      width: 100%;
      min-height: 505px;
      background-color: var(--ahi-navy-primary);
      background-image: 
        linear-gradient(90deg, rgba(10, 24, 45, 0.92) 0%, rgba(10, 24, 45, 0.82) 42%, rgba(10, 24, 45, 0.3) 75%, rgba(10, 24, 45, 0) 100%),
        url('Reference files/hero section bg.png');
      background-position: center right;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      align-items: center;
      padding: 70px 0;
    }
"@

$newCss = @"
    .hero-section {
      position: relative;
      width: 100%;
      min-height: 480px;
      background-color: var(--ahi-navy-primary);
      background-image: 
        linear-gradient(90deg, rgba(10, 24, 45, 0.88) 0%, rgba(10, 24, 45, 0.78) 42%, rgba(10, 24, 45, 0.22) 70%, transparent 88%),
        url('Reference files/predictive hero section bg.png');
      background-position: center right;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      align-items: center;
      padding: 72px 0;
    }
"@

# 2. Update Hero HTML
# Find the entire S2 · HERO SECTION block
$heroStartToken = "<!-- ==========================================================================" + "`r`n" + "       S2 · HERO SECTION (EXACT SHARED LAYOUT & DIMENSIONS)"
$heroEndToken = "<!-- ==========================================================================" + "`r`n" + "       S3 · WHAT IS PREDICTIVE MAINTENANCE?"

$heroStartIdx = $content.IndexOf($heroStartToken)
if ($heroStartIdx -lt 0) {
    # Check normalized
    $contentNorm = $content.Replace("`r`n", "`n")
    $heroStartTokenNorm = "<!-- ==========================================================================`n       S2 · HERO SECTION (EXACT SHARED LAYOUT & DIMENSIONS)"
    $heroEndTokenNorm = "<!-- ==========================================================================`n       S3 · WHAT IS PREDICTIVE MAINTENANCE?"
    $heroStartIdx = $contentNorm.IndexOf($heroStartTokenNorm)
    $heroEndIdx = $contentNorm.IndexOf($heroEndTokenNorm)
} else {
    $contentNorm = $content.Replace("`r`n", "`n")
    $heroStartTokenNorm = "<!-- ==========================================================================`n       S2 · HERO SECTION (EXACT SHARED LAYOUT & DIMENSIONS)"
    $heroEndTokenNorm = "<!-- ==========================================================================`n       S3 · WHAT IS PREDICTIVE MAINTENANCE?"
    $heroStartIdx = $contentNorm.IndexOf($heroStartTokenNorm)
    $heroEndIdx = $contentNorm.IndexOf($heroEndTokenNorm)
}

if ($heroStartIdx -lt 0 -or $heroEndIdx -lt 0) {
    throw "Could not find hero section boundaries in $filePath"
}

$newHeroHtml = @"
  <!-- ==========================================================================
       S2 · HERO SECTION (EXACT REFERENCE: predictive hero section bg.png)
       ========================================================================== -->
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

# Replace CSS
$contentNorm = $contentNorm.Replace($oldCss.Replace("`r`n", "`n"), $newCss.Replace("`r`n", "`n"))

# Replace HTML
$beforeHero = $contentNorm.Substring(0, $heroStartIdx)
$afterHero = $contentNorm.Substring($heroEndIdx)
$finalContentNorm = $beforeHero + $newHeroHtml.Replace("`r`n", "`n") + $afterHero

[System.IO.File]::WriteAllText($filePath, $finalContentNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated final output\predictive-maintenance.html"

# Mirror to root
Copy-Item -Path $filePath -Destination "predictive-maintenance.html" -Force
Write-Output "Successfully mirrored to root predictive-maintenance.html"

