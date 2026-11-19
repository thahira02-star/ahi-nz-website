# Update Section 01 card names and content in predictive-maintenance.html
$ErrorActionPreference = "Stop"

$filePath = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Update CSS
$oldCss = @"
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

$newCss = @"
    .what-is-cards-stack {
      display: flex;
      flex-direction: column;
      gap: 16px;
      width: 100%;
    }

    .what-is-card {
      background-color: #FFFFFF;
      border: 1px solid var(--ahi-border-light);
      border-radius: 5px;
      padding: 22px 28px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
      box-shadow: 0 1px 3px rgba(16, 47, 88, 0.04);
      transition: transform 0.18s ease, box-shadow 0.18s ease, border-color 0.18s ease;
    }

    .what-is-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 18px rgba(16, 47, 88, 0.08);
      border-color: #CBD5E1;
    }

    .what-is-card-left {
      display: flex;
      align-items: center;
      gap: 24px;
    }

    .what-is-card-num {
      font-family: var(--font-family);
      font-size: 20px;
      font-weight: 700;
      color: #0284C7;
      min-width: 28px;
      line-height: 1;
      flex-shrink: 0;
    }

    .what-is-card-body {
      display: flex;
      flex-direction: column;
      gap: 4px;
    }

    .what-is-card-title {
      font-family: var(--font-family);
      font-size: 17px;
      font-weight: 700;
      color: var(--ahi-text-heading);
      line-height: 1.35;
      margin: 0;
    }

    .what-is-card-desc {
      font-size: 14.5px;
      color: var(--ahi-text-body);
      line-height: 1.5;
      margin: 0;
    }

    .what-is-card-arrow {
      font-size: 18px;
      color: #94A3B8;
      font-weight: 500;
      flex-shrink: 0;
      transition: color 0.18s ease, transform 0.18s ease;
    }

    .what-is-card:hover .what-is-card-arrow {
      color: #163865;
      transform: translateX(4px);
    }
"@

# 2. Update HTML
$oldHtml = @"
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
"@

$newHtml = @"
          <div class="what-is-cards-stack">
            
            <div class="what-is-card">
              <div class="what-is-card-left">
                <span class="what-is-card-num">01</span>
                <div class="what-is-card-body">
                  <h3 class="what-is-card-title">Sensors</h3>
                  <p class="what-is-card-desc">Live vibration, temperature and energy signals.</p>
                </div>
              </div>
              <span class="what-is-card-arrow" aria-hidden="true">→</span>
            </div>

            <div class="what-is-card">
              <div class="what-is-card-left">
                <span class="what-is-card-num">02</span>
                <div class="what-is-card-body">
                  <h3 class="what-is-card-title">Data</h3>
                  <p class="what-is-card-desc">Patterns reveal wear long before failure.</p>
                </div>
              </div>
              <span class="what-is-card-arrow" aria-hidden="true">→</span>
            </div>

            <div class="what-is-card">
              <div class="what-is-card-left">
                <span class="what-is-card-num">03</span>
                <div class="what-is-card-body">
                  <h3 class="what-is-card-title">Action</h3>
                  <p class="what-is-card-desc">One clear next step, at the right time.</p>
                </div>
              </div>
              <span class="what-is-card-arrow" aria-hidden="true">→</span>
            </div>

          </div>
"@

$contentNorm = $content.Replace("`r`n", "`n")
$oldCssNorm = $oldCss.Replace("`r`n", "`n")
$newCssNorm = $newCss.Replace("`r`n", "`n")
$oldHtmlNorm = $oldHtml.Replace("`r`n", "`n")
$newHtmlNorm = $newHtml.Replace("`r`n", "`n")

if (-not $contentNorm.Contains($oldCssNorm)) {
    throw "Could not find oldCss in $filePath"
}
if (-not $contentNorm.Contains($oldHtmlNorm)) {
    throw "Could not find oldHtml in $filePath"
}

$contentNorm = $contentNorm.Replace($oldCssNorm, $newCssNorm)
$contentNorm = $contentNorm.Replace($oldHtmlNorm, $newHtmlNorm)

[System.IO.File]::WriteAllText($filePath, $contentNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated $filePath with Sensors / Data / Action cards!"

# Mirror to root
Copy-Item -Path $filePath -Destination "predictive-maintenance.html" -Force
Write-Output "Successfully mirrored to root predictive-maintenance.html!"

