$path = "final output\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update Section 05 CSS and add Section 05B CSS
# Locate .importance-cards-grid through .btn-importance-cta:hover
$cssTargetStart = "    .importance-cards-grid {"
$cssTargetEnd = "    .btn-importance-cta:hover {"

$idxStart = $content.IndexOf($cssTargetStart)
$idxEnd = $content.IndexOf($cssTargetEnd)

if ($idxStart -lt 0 -or $idxEnd -lt 0) {
    Write-Error "Could not find CSS boundaries in $path"
    exit 1
}

# Find end of .btn-importance-cta:hover block
$idxEndBlock = $content.IndexOf("}", $idxEnd) + 1

$oldCssBlock = $content.Substring($idxStart, $idxEndBlock - $idxStart)

$newCssBlock = @"
    .importance-cards-grid {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 16px;
      margin-bottom: 0;
    }

    .importance-card {
      background-color: var(--ahi-white);
      border: 1px solid var(--ahi-border-light);
      border-radius: 5px;
      padding: 16px 16px 18px 16px;
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
    }

    .importance-card:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-hover);
      border-color: #CBD5E1;
    }

    .importance-card-icon {
      width: 34px;
      height: 34px;
      border-radius: 5px;
      background-color: #E2E8F0;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #163865;
      margin-bottom: 12px;
      flex-shrink: 0;
    }

    .importance-card-icon svg {
      width: 18px;
      height: 18px;
    }

    .importance-card-title {
      font-size: 15px;
      font-weight: 600;
      color: var(--ahi-text-heading);
      margin: 0;
      line-height: 1.35;
      letter-spacing: -0.01em;
    }

    /* ==========================================================================
       SECTION 05B · NATIONWIDE EMERGENCY HVAC DISPATCH (FULL-WIDTH NAVY BANNER)
       Spacing: Exactly 40px vertical spacing
       Layout: Full-Width Navy Banner with 2-Column Responsive Grid
       ========================================================================== */
    .section-dispatch-banner {
      width: 100%;
      background-color: #102F58;
      background-image: linear-gradient(135deg, #102F58 0%, #0A2240 100%);
      padding: 40px 0;
      border-top: 1px solid rgba(255, 255, 255, 0.08);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      position: relative;
    }

    .dispatch-banner-grid {
      display: grid;
      grid-template-columns: 460px 1fr;
      gap: 48px;
      align-items: center;
    }

    .dispatch-banner-media {
      position: relative;
      width: 100%;
      height: 310px;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 12px 30px -4px rgba(0, 0, 0, 0.35);
      border: 1px solid rgba(255, 255, 255, 0.12);
    }

    .dispatch-banner-img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      object-position: center 25%;
      display: block;
    }

    .dispatch-banner-content {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: flex-start;
      color: #FFFFFF;
    }

    .dispatch-banner-eyebrow {
      font-size: 12.5px;
      font-weight: 700;
      color: #93C5FD;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      margin-bottom: 10px;
      font-family: 'Montserrat', sans-serif;
    }

    .dispatch-banner-heading {
      font-size: 28px;
      font-weight: 700;
      color: #FFFFFF;
      line-height: 1.25;
      letter-spacing: -0.015em;
      margin: 0 0 14px 0;
      font-family: 'Montserrat', sans-serif;
    }

    .dispatch-banner-desc {
      font-size: 15px;
      color: rgba(255, 255, 255, 0.88);
      line-height: 1.6;
      margin: 0 0 24px 0;
      max-width: 580px;
      font-family: 'Montserrat', sans-serif;
    }

    .dispatch-banner-actions {
      display: flex;
      align-items: center;
      gap: 16px;
    }

    .btn-dispatch-cta {
      background-color: #FFFFFF;
      color: #163865;
      font-size: 14px;
      font-weight: 700;
      height: 44px;
      padding: 0 24px;
      border-radius: 6px;
      display: inline-flex;
      align-items: center;
      gap: 9px;
      box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15);
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
      text-decoration: none;
      font-family: 'Montserrat', sans-serif;
    }

    .btn-dispatch-cta svg {
      width: 16px;
      height: 16px;
      stroke: #163865;
      stroke-width: 2.5;
      transition: transform 0.2s ease;
    }

    .btn-dispatch-cta:hover {
      background-color: #F8FAFC;
      color: #0F2744;
      transform: translateY(-2px);
      box-shadow: 0 8px 22px rgba(0, 0, 0, 0.22);
    }

    .btn-dispatch-cta:hover svg {
      transform: translateX(3px);
    }
"@

$content = $content.Substring(0, $idxStart) + $newCssBlock + $content.Substring($idxEndBlock)
Write-Host "Updated main CSS block."

# 2. Update .section-emergencies padding from 0 0 40px 0 to 40px 0
$targetEmCss = ".section-emergencies {`r`n      background-color: var(--ahi-white);`r`n      padding: 0 0 40px 0;"
if (-not $content.Contains($targetEmCss)) {
    $targetEmCss = ".section-emergencies {`n      background-color: var(--ahi-white);`n      padding: 0 0 40px 0;"
}
$replaceEmCss = ".section-emergencies {`r`n      background-color: var(--ahi-white);`r`n      padding: 40px 0;"
if ($content.Contains($targetEmCss)) {
    $content = $content.Replace($targetEmCss, $replaceEmCss)
    Write-Host "Updated .section-emergencies padding to 40px 0."
}

# 3. Update media queries for importance-banner
$mqTarget = @"
      .importance-banner {
        grid-template-columns: 1fr;
        height: auto;
        min-height: auto;
      }
      .importance-banner-media {
        height: 240px;
        min-height: 240px;
      }
      .importance-banner-content {
        padding: 24px 22px;
      }
"@
$mqReplace = @"
      .dispatch-banner-grid {
        grid-template-columns: 1fr;
        gap: 28px;
      }
      .dispatch-banner-media {
        height: 250px;
      }
      .dispatch-banner-heading {
        font-size: 24px;
      }
"@
if ($content.Contains($mqTarget)) {
    $content = $content.Replace($mqTarget, $mqReplace)
    Write-Host "Updated 900px media query."
}

# Also 580px media query
$mqTarget580 = "      .importance-banner-heading {`r`n        font-size: 22px;`r`n      }"
if (-not $content.Contains($mqTarget580)) {
    $mqTarget580 = "      .importance-banner-heading {`n        font-size: 22px;`n      }"
}
$mqReplace580 = "      .dispatch-banner-heading {`r`n        font-size: 22px;`r`n      }`r`n      .dispatch-banner-media {`r`n        height: 200px;`r`n      }"
if ($content.Contains($mqTarget580)) {
    $content = $content.Replace($mqTarget580, $mqReplace580)
    Write-Host "Updated 580px media query."
}

# 4. Update HTML: Replace .importance-banner inside section-importance with separate section-dispatch-banner
$htmlTargetStart = "      <!-- Feature Banner: Image on Left, Navy Panel & CTA on Right -->"
$htmlTargetEnd = "  <!-- ==========================================================================`r`n       SECTION 06 · COMMON HVAC EMERGENCIES (LIGHT THEME)"
if (-not $content.Contains($htmlTargetEnd)) {
    $htmlTargetEnd = "  <!-- ==========================================================================`n       SECTION 06 · COMMON HVAC EMERGENCIES (LIGHT THEME)"
}

$hIdxStart = $content.IndexOf($htmlTargetStart)
$hIdxEnd = $content.IndexOf($htmlTargetEnd)

if ($hIdxStart -lt 0 -or $hIdxEnd -lt 0) {
    Write-Error "Could not find HTML boundaries: hStart=$hIdxStart, hEnd=$hIdxEnd"
    exit 1
}

$newHtmlBlock = @"
    </div>
  </section>

  <!-- ==========================================================================
       SECTION 05B · NATIONWIDE EMERGENCY HVAC DISPATCH (FULL-WIDTH NAVY BANNER)
       Spacing: Exactly 40px vertical spacing
       ========================================================================== -->
  <section class="section-dispatch-banner" aria-label="Nationwide Emergency Dispatch">
    <div class="container">
      <div class="dispatch-banner-grid">
        <div class="dispatch-banner-media">
          <img src="Reference files/imp of emergency hvac.jpeg" alt="AHI Carrier certified emergency HVAC engineer conducting diagnostic repairs on rooftop commercial equipment" class="dispatch-banner-img" loading="lazy">
        </div>

        <div class="dispatch-banner-content">
          <span class="dispatch-banner-eyebrow">24/7 NATIONWIDE RESPONSE</span>
          <h2 class="dispatch-banner-heading">Fast, nationwide emergency HVAC repairs to keep your facility running.</h2>
          <p class="dispatch-banner-desc">With certified engineers stationed across New Zealand, AHI Carrier delivers 24/7 rapid emergency dispatch, expert diagnostics, and genuine Carrier parts to minimise downtime.</p>
          <div class="dispatch-banner-actions">
            <a href="#request-repair" class="btn-dispatch-cta">
              <span>Book a Service Call</span>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <line x1="5" y1="12" x2="19" y2="12"></line>
                <polyline points="12 5 19 12 12 19"></polyline>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

  
"@

$content = $content.Substring(0, $hIdxStart) + $newHtmlBlock + $content.Substring($hIdxEnd)
Write-Host "Updated HTML block."

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Wrote updated content to $path."

# Mirror to root index.html
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Mirrored to index.html."
