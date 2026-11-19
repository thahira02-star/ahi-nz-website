# Update Section 01 in final output\predictive-maintenance.html
$ErrorActionPreference = "Stop"

$filePath = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. New CSS for Section 01
$oldCssToken = "/* ==========================================================================" + "`n" + "       SECTION 01 · WHAT IS PREDICTIVE MAINTENANCE?"
$nextCssToken = "/* ==========================================================================" + "`n" + "       SECTION 02 · WHY PREDICTIVE MAINTENANCE MATTERS"

$contentNorm = $content.Replace("`r`n", "`n")

$cssStartPos = $contentNorm.IndexOf($oldCssToken)
$cssEndPos = $contentNorm.IndexOf($nextCssToken, $cssStartPos)

if ($cssStartPos -lt 0 -or $cssEndPos -lt 0) {
    throw "Could not find Section 01 CSS boundaries in $filePath"
}

$newCss = @"
/* ==========================================================================
       SECTION 01 · WHAT IS PREDICTIVE MAINTENANCE?
       Reference: media_1794902300449_5ebe6204.jpg
       Corner Radii: Strictly 5px on all cards and images
       ========================================================================== */
    .section-what-is {
      background-color: var(--ahi-neutral-bg);
      padding: 72px 0;
    }

    .what-is-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 56px;
      align-items: center;
    }

    .what-is-photo-wrapper {
      border-radius: 5px;
      overflow: hidden;
      box-shadow: 0 10px 25px -5px rgba(16, 47, 88, 0.08), 0 4px 10px -4px rgba(16, 47, 88, 0.04);
      border: 1px solid var(--ahi-border-light);
      background-color: var(--ahi-white);
    }

    .what-is-photo {
      width: 100%;
      height: auto;
      max-height: 440px;
      object-fit: cover;
      display: block;
      border-radius: 5px;
    }

    .what-is-content {
      display: flex;
      flex-direction: column;
    }

    .what-is-heading {
      font-size: 36px;
      font-weight: 600;
      color: var(--ahi-text-heading);
      letter-spacing: -0.015em;
      line-height: 1.25;
      margin-bottom: 24px;
    }

    .what-is-cards-stack {
      display: flex;
      flex-direction: column;
      gap: 14px;
      width: 100%;
    }

    .what-is-card {
      background-color: #FFFFFF;
      border: 1px solid var(--ahi-border-light);
      border-radius: 5px;
      padding: 20px 24px;
      display: flex;
      align-items: flex-start;
      gap: 20px;
      box-shadow: 0 1px 3px rgba(16, 47, 88, 0.04);
      transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;
    }

    .what-is-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 18px rgba(16, 47, 88, 0.08);
      border-color: #CBD5E1;
    }

    .what-is-card-num {
      font-family: var(--font-family);
      font-size: 18px;
      font-weight: 700;
      color: #B20E27;
      min-width: 26px;
      line-height: 1.35;
      flex-shrink: 0;
    }

    .what-is-card-body {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .what-is-card-title {
      font-family: var(--font-family);
      font-size: 16px;
      font-weight: 600;
      color: var(--ahi-text-heading);
      line-height: 1.35;
      margin: 0;
    }

    .what-is-card-desc {
      font-size: 14px;
      color: var(--ahi-text-muted);
      line-height: 1.5;
      margin: 0;
    }

    
"@

$beforeCss = $contentNorm.Substring(0, $cssStartPos)
$afterCss = $contentNorm.Substring($cssEndPos)
$contentNorm = $beforeCss + $newCss + $afterCss

# 2. New HTML for Section 01
$oldHtmlToken = "<!-- ==========================================================================" + "`n" + "       SECTION 01 · WHAT IS PREDICTIVE MAINTENANCE?"
$nextHtmlToken = "<!-- ==========================================================================" + "`n" + "       SECTION 02 · WHY PREDICTIVE MAINTENANCE MATTERS"

$htmlStartPos = $contentNorm.IndexOf($oldHtmlToken)
$htmlEndPos = $contentNorm.IndexOf($nextHtmlToken, $htmlStartPos)

if ($htmlStartPos -lt 0 -or $htmlEndPos -lt 0) {
    throw "Could not find Section 01 HTML boundaries in $filePath"
}

$newHtml = @"
<!-- ==========================================================================
       SECTION 01 · WHAT IS PREDICTIVE MAINTENANCE?
       Reference: media_1794902300449_5ebe6204.jpg
       Corner Radii: Strictly 5px on all cards and images (No eyebrow text)
       ========================================================================== -->
  <section class="section-what-is" aria-labelledby="what-is-pdm-heading">
    <div class="container">
      <div class="what-is-grid">
        
        <div class="what-is-photo-wrapper">
          <img src="Reference files/predictive dashboard monitoring.png" alt="HVAC monitoring dashboard displaying live temperature, vibration, and performance trends" class="what-is-photo" loading="lazy">
        </div>

        <div class="what-is-content">
          <h2 id="what-is-pdm-heading" class="what-is-heading">Maintenance, timed by data — not by guesswork.</h2>

          <div class="what-is-cards-stack">
            
            <div class="what-is-card">
              <span class="what-is-card-num">01</span>
              <div class="what-is-card-body">
                <h3 class="what-is-card-title">We monitor live equipment data</h3>
                <p class="what-is-card-desc">Temperature, vibration, pressure, airflow.</p>
              </div>
            </div>

            <div class="what-is-card">
              <span class="what-is-card-num">02</span>
              <div class="what-is-card-body">
                <h3 class="what-is-card-title">We spot early signs of wear</h3>
                <p class="what-is-card-desc">Before failure, before disruption.</p>
              </div>
            </div>

            <div class="what-is-card">
              <span class="what-is-card-num">03</span>
              <div class="what-is-card-body">
                <h3 class="what-is-card-title">We act only when data says so</h3>
                <p class="what-is-card-desc">No unnecessary visits. No surprise breakdowns.</p>
              </div>
            </div>

          </div>
        </div>

      </div>
    </div>
  </section>

  
"@

$beforeHtml = $contentNorm.Substring(0, $htmlStartPos)
$afterHtml = $contentNorm.Substring($htmlEndPos)
$finalContentNorm = $beforeHtml + $newHtml + $afterHtml

[System.IO.File]::WriteAllText($filePath, $finalContentNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated final output\predictive-maintenance.html with Section 01 redesign!"

# Mirror to root predictive-maintenance.html
Copy-Item -Path $filePath -Destination "predictive-maintenance.html" -Force
Write-Output "Successfully mirrored to root predictive-maintenance.html!"

