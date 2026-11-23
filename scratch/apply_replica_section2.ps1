$filePath = "final output/chiller-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. New CSS for Section 2
$newCss = @"
    /* ==========================================================================
       SECTION 2 · WHAT IS CHILLER MAINTENANCE?
       Exact Replica of Figma Specification (media_1795361825880_f38d9760.jpg)
       ========================================================================== */
    .section-service-partnership {
      padding: 68px 0;
      background-color: #FFFFFF;
      position: relative;
    }

    .partnership-grid-2col {
      display: grid;
      grid-template-columns: 1.05fr 0.95fr;
      gap: 44px;
      align-items: center;
    }

    .partnership-left-content {
      display: flex;
      flex-direction: column;
    }

    .partnership-title {
      font-family: 'Montserrat', sans-serif;
      font-size: 34px;
      font-weight: 700;
      color: #0D0D0D;
      line-height: 1.22;
      letter-spacing: -0.015em;
      margin-bottom: 16px;
      max-width: 530px;
    }

    .partnership-lead {
      font-family: 'Montserrat', sans-serif;
      font-size: 14px;
      font-weight: 400;
      color: #475569;
      line-height: 1.6;
      margin-bottom: 28px;
      max-width: 530px;
    }

    .partnership-cards-3row {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 14px;
      width: 100%;
    }

    .site-scope-card {
      background: #FFFFFF;
      border: 1px solid #E2E8F0;
      border-radius: 5px;
      padding: 22px 14px 20px 14px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
      transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .site-scope-card:hover {
      border-color: #BFDBFE;
      box-shadow: 0 6px 16px rgba(16, 47, 88, 0.06);
      transform: translateY(-2px);
    }

    .site-scope-icon-box {
      width: 36px;
      height: 36px;
      background: #EFF6FF;
      color: #163865;
      border-radius: 5px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 14px;
    }

    .site-scope-title {
      font-family: 'Montserrat', sans-serif;
      font-size: 13.5px;
      font-weight: 700;
      color: #0D0D0D;
      margin-bottom: 6px;
      line-height: 1.35;
    }

    .site-scope-desc {
      font-family: 'Montserrat', sans-serif;
      font-size: 12px;
      font-weight: 400;
      color: #64748B;
      line-height: 1.45;
    }

    .partnership-right-image {
      position: relative;
      width: 100%;
    }

    .partnership-photo-frame {
      border-radius: 5px;
      overflow: hidden;
      border: 1px solid #E2E8F0;
      box-shadow: 0 4px 16px rgba(16, 47, 88, 0.06);
      background-color: #F8FAFC;
    }

    .partnership-photo-frame img {
      width: 100%;
      height: 380px;
      object-fit: cover;
      object-position: center;
      display: block;
    }
"@

# 2. Find start and end of Section 2 CSS
$cssStartMarker = "/* ==========================================================================`r`n       SECTION 2 · WHAT IS CHILLER MAINTENANCE?"
if (-not $content.Contains($cssStartMarker)) {
  $cssStartMarker = "/* ==========================================================================`n       SECTION 2 · WHAT IS CHILLER MAINTENANCE?"
}

$cssEndMarker = "/* ==========================================================================`r`n       SECTION 3 · WHAT WE DO"
if (-not $content.Contains($cssEndMarker)) {
  $cssEndMarker = "/* ==========================================================================`n       SECTION 3 · WHAT WE DO"
}

$idxCssStart = $content.IndexOf($cssStartMarker)
$idxCssEnd = $content.IndexOf($cssEndMarker)

if ($idxCssStart -ge 0 -and $idxCssEnd -gt $idxCssStart) {
  Write-Host "Found CSS block at $idxCssStart to $idxCssEnd"
  $content = $content.Substring(0, $idxCssStart) + $newCss + "`r`n`r`n    " + $content.Substring($idxCssEnd)
} else {
  Write-Error "Could not locate Section 2 CSS markers! idxCssStart=$idxCssStart, idxCssEnd=$idxCssEnd"
  exit 1
}

# 3. New HTML for Section 2
$newHtml = @"
  <!-- ==========================================================================
       SECTION 2 · WHAT IS CHILLER MAINTENANCE?
       Exact Replica of Figma Specification (media_1795361825880_f38d9760.jpg)
       ========================================================================== -->
  <section class="section-service-partnership" id="what-is-chiller-maintenance" aria-labelledby="partnership-title">
    <div class="container">
      <div class="partnership-grid-2col">
        
        <!-- Left Column: Eyebrow + Heading + Desc + 3 Scope Cards -->
        <div class="partnership-left-content">
          <span class="section-eyebrow">WHAT IS CHILLER MAINTENANCE</span>
          <h2 id="partnership-title" class="partnership-title">Service Partnership, shaped around<br>your site.</h2>
          <p class="partnership-lead">
            AHI Carrier delivers a carefully managed service partnership tailored to your exact operational needs.
          </p>

          <div class="partnership-cards-3row">
            <!-- Card 1 -->
            <div class="site-scope-card">
              <div class="site-scope-icon-box" aria-hidden="true">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                  <rect x="2" y="6" width="20" height="12" rx="2"></rect>
                  <line x1="2" y1="13" x2="22" y2="13"></line>
                  <line x1="7" y1="16" x2="17" y2="16"></line>
                </svg>
              </div>
              <h3 class="site-scope-title">Single Split System</h3>
              <p class="site-scope-desc">For a single unit, on a single site.</p>
            </div>

            <!-- Card 2 -->
            <div class="site-scope-card">
              <div class="site-scope-icon-box" aria-hidden="true">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 21V5a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v16"></path>
                  <line x1="9" y1="9" x2="9.01" y2="9"></line>
                  <line x1="15" y1="9" x2="15.01" y2="9"></line>
                  <line x1="9" y1="13" x2="9.01" y2="13"></line>
                  <line x1="15" y1="13" x2="15.01" y2="13"></line>
                  <line x1="9" y1="17" x2="9.01" y2="17"></line>
                  <line x1="15" y1="17" x2="15.01" y2="17"></line>
                </svg>
              </div>
              <h3 class="site-scope-title">Single Building / Chiller</h3>
              <p class="site-scope-desc">For a building that can't afford downtime.</p>
            </div>

            <!-- Card 3 -->
            <div class="site-scope-card">
              <div class="site-scope-icon-box" aria-hidden="true">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                  <rect x="3" y="10" width="7" height="11" rx="1"></rect>
                  <rect x="14" y="4" width="7" height="17" rx="1"></rect>
                  <line x1="6" y1="14" x2="6.01" y2="14"></line>
                  <line x1="6" y1="17" x2="6.01" y2="17"></line>
                  <line x1="17" y1="8" x2="17.01" y2="8"></line>
                  <line x1="17" y1="12" x2="17.01" y2="12"></line>
                  <line x1="17" y1="16" x2="17.01" y2="16"></line>
                </svg>
              </div>
              <h3 class="site-scope-title">Multi-site • Multi-chiller</h3>
              <p class="site-scope-desc">For portfolios, managed as one partnership.</p>
            </div>
          </div>
        </div>

        <!-- Right Column: Rooftop Chiller Servicing Photo -->
        <div class="partnership-right-image">
          <div class="partnership-photo-frame">
            <img src="Reference files/chiller-service-partnership.jpg" alt="Certified Carrier technician servicing a commercial rooftop chiller with manifold gauges" loading="lazy">
          </div>
        </div>

      </div>
    </div>
  </section>
"@

$htmlStartMarker = "<!-- ==========================================================================`r`n         SECTION 2 · WHAT IS CHILLER MAINTENANCE?"
if (-not $content.Contains($htmlStartMarker)) {
  $htmlStartMarker = "<!-- ==========================================================================`n         SECTION 2 · WHAT IS CHILLER MAINTENANCE?"
}
if (-not $content.Contains($htmlStartMarker)) {
  $htmlStartMarker = "<section class=""section-service-partnership"""
}

$htmlEndMarker = "<!-- ==========================================================================`r`n         SECTION 2 · BUILDING CONFIDENCE"
if (-not $content.Contains($htmlEndMarker)) {
  $htmlEndMarker = "<!-- ==========================================================================`n         SECTION 2 · BUILDING CONFIDENCE"
}

$idxHtmlStart = $content.IndexOf($htmlStartMarker)
$idxHtmlEnd = $content.IndexOf($htmlEndMarker)

if ($idxHtmlStart -ge 0 -and $idxHtmlEnd -gt $idxHtmlStart) {
  Write-Host "Found HTML block at $idxHtmlStart to $idxHtmlEnd"
  $content = $content.Substring(0, $idxHtmlStart) + $newHtml.Trim() + "`r`n`r`n  " + $content.Substring($idxHtmlEnd)
} else {
  Write-Error "Could not locate Section 2 HTML markers! idxHtmlStart=$idxHtmlStart, idxHtmlEnd=$idxHtmlEnd"
  exit 1
}

[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Updated $filePath"

# 4. Synchronize to root chiller-maintenance.html
[System.IO.File]::WriteAllBytes("chiller-maintenance.html", [System.IO.File]::ReadAllBytes($filePath))
Write-Host "Synchronized to root chiller-maintenance.html"
