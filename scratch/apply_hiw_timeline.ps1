$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# 1. New CSS for How It Works (Vertical Timeline - Light Theme)
$newCss = @"
    /* ==========================================================================
       SECTION 03 · HOW IT WORKS (VERTICAL TIMELINE · LIGHT THEME)
       Spacing: Exactly 40px vertical spacing
       Reference: media_1795074640692_03d3e40b.png (Light Theme Adaptation)
       ========================================================================== */
    .section-how-it-works {
      background-color: var(--ahi-neutral-bg);
      padding: 40px 0;
      border-top: 1px solid var(--ahi-border-light);
      border-bottom: 1px solid var(--ahi-border-light);
    }

    .hiw-master-panel {
      background-color: var(--ahi-white);
      border: 1px solid var(--ahi-border-light);
      border-radius: var(--radius-lg, 12px);
      padding: 44px 48px;
      box-shadow: 0 4px 20px -4px rgba(16, 47, 88, 0.06), 0 2px 6px -2px rgba(16, 47, 88, 0.04);
    }

    .hiw-timeline-grid {
      display: grid;
      grid-template-columns: 340px 1fr;
      gap: 48px;
      align-items: center;
    }

    /* Left Column: Heading & Trust Badges */
    .hiw-left-col {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .how-it-works-title {
      font-size: 38px;
      font-weight: 700;
      color: var(--ahi-text-heading);
      letter-spacing: -0.015em;
      line-height: 1.2;
      margin-bottom: 14px;
      text-align: left;
    }

    .how-it-works-desc {
      font-size: 15.5px;
      color: var(--ahi-text-secondary);
      line-height: 1.6;
      margin-bottom: 24px;
      max-width: 320px;
      text-align: left;
    }

    .hiw-trust-pills {
      display: flex;
      align-items: center;
      gap: 10px;
      flex-wrap: wrap;
    }

    .hiw-trust-pill {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      padding: 6px 14px;
      background-color: #EFF6FF;
      border: 1px solid #BFDBFE;
      border-radius: 20px;
      font-size: 13px;
      font-weight: 600;
      color: #163865;
    }

    .hiw-trust-pill svg {
      width: 13px;
      height: 13px;
      stroke: #163865;
      stroke-width: 2.5;
    }

    /* Right Column: Timeline track & cards */
    .hiw-timeline-track {
      position: relative;
      display: flex;
      flex-direction: column;
      gap: 16px;
      padding-left: 36px;
    }

    /* Vertical connector line */
    .hiw-timeline-track::before {
      content: '';
      position: absolute;
      left: 6px;
      top: 40px;
      bottom: 40px;
      width: 2px;
      background-color: #CBD5E1;
    }

    .hiw-card-wrapper {
      position: relative;
    }

    /* White circle node on the vertical line */
    .hiw-card-wrapper::before {
      content: '';
      position: absolute;
      left: -36px;
      top: 50%;
      transform: translate(-50%, -50%);
      width: 14px;
      height: 14px;
      border-radius: 50%;
      background-color: #FFFFFF;
      border: 3.5px solid #163865;
      box-shadow: 0 0 0 3px #EFF6FF;
      z-index: 2;
      transition: all 0.2s ease;
    }

    .hiw-card-wrapper:hover::before {
      background-color: #163865;
      border-color: #FFFFFF;
      box-shadow: 0 0 0 4px rgba(22, 56, 101, 0.2);
    }

    /* Horizontal Step Card */
    .hiw-step-card {
      background-color: #F8FAFC;
      border: 1px solid var(--ahi-border-light);
      border-radius: var(--radius-md, 8px);
      padding: 18px 24px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 18px;
      transition: all 0.2s ease;
    }

    .hiw-step-card:hover {
      background-color: #FFFFFF;
      border-color: #93C5FD;
      box-shadow: 0 6px 18px rgba(22, 56, 101, 0.08);
      transform: translateX(4px);
    }

    .hiw-step-left {
      display: flex;
      align-items: center;
      gap: 16px;
    }

    .hiw-step-num {
      font-size: 20px;
      font-weight: 700;
      color: #163865;
      opacity: 0.85;
      min-width: 28px;
      font-family: 'Montserrat', sans-serif;
      letter-spacing: -0.02em;
    }

    .hiw-step-icon-badge {
      width: 42px;
      height: 42px;
      border-radius: 50%;
      background-color: #EFF6FF;
      border: 1px solid #DBEAFE;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      color: #163865;
      transition: all 0.2s ease;
    }

    .hiw-step-card:hover .hiw-step-icon-badge {
      background-color: #163865;
      color: #FFFFFF;
      border-color: #163865;
    }

    .hiw-step-icon-badge svg {
      width: 19px;
      height: 19px;
    }

    .hiw-step-content {
      display: flex;
      flex-direction: column;
    }

    .hiw-step-title {
      font-size: 16px;
      font-weight: 700;
      color: var(--ahi-text-heading);
      margin: 0 0 3px 0;
      line-height: 1.3;
      font-family: 'Montserrat', sans-serif;
    }

    .hiw-step-desc {
      font-size: 13.5px;
      color: var(--ahi-text-secondary);
      line-height: 1.5;
      margin: 0;
      font-family: 'Montserrat', sans-serif;
    }

    .hiw-step-badge {
      font-size: 12px;
      font-weight: 600;
      color: #163865;
      background-color: #FFFFFF;
      border: 1px solid #CBD5E1;
      padding: 5px 13px;
      border-radius: 20px;
      white-space: nowrap;
      flex-shrink: 0;
      transition: all 0.2s ease;
      font-family: 'Montserrat', sans-serif;
    }

    .hiw-step-card:hover .hiw-step-badge {
      background-color: #163865;
      color: #FFFFFF;
      border-color: #163865;
    }

    @media (max-width: 900px) {
      .hiw-master-panel {
        padding: 32px 24px;
      }
      .hiw-timeline-grid {
        grid-template-columns: 1fr;
        gap: 32px;
      }
      .how-it-works-desc {
        max-width: 100%;
      }
      .hiw-step-card {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
      }
      .hiw-step-badge {
        align-self: flex-start;
      }
    }
"@

# Replace old CSS block between SECTION 03 · HOW IT WORKS and SECTION 04 / SECTION 05 · IMPORTANCE
$cssPattern = '(?s)/\* ==========================================================================\s+SECTION 03 · HOW IT WORKS.*?/\* ==========================================================================\s+SECTION 05 · THE IMPORTANCE'
if ($content -match $cssPattern) {
    $content = [regex]::Replace($content, $cssPattern, "$newCss`r`n`r`n    /* ==========================================================================`r`n       SECTION 05 · THE IMPORTANCE")
    Write-Host "Successfully replaced CSS for How It Works."
} else {
    Write-Host "Warning: CSS pattern match failed, trying broader pattern"
    $cssPattern2 = '(?s)\.section-how-it-works\s*\{.*?\.process-step-desc\s*\{[^}]+\}'
    $content = [regex]::Replace($content, $cssPattern2, $newCss)
    Write-Host "Replaced via fallback CSS regex."
}

# 2. New HTML for Section 03 How It Works
$newHtml = @"
  <!-- ==========================================================================
       SECTION 04 · HOW IT WORKS (LIGHT THEME VERTICAL TIMELINE)
       Spacing: Exactly 40px vertical spacing
       Reference: media_1795074640692_03d3e40b.png (Light Theme Adaptation)
       ========================================================================== -->
  <section class="section-how-it-works" aria-labelledby="how-it-works-heading">
    <div class="container">
      <div class="hiw-master-panel">
        <div class="hiw-timeline-grid">
          
          <!-- Left Column: Heading, Subtitle & Trust Badges -->
          <div class="hiw-left-col">
            <span class="section-eyebrow how-it-works-kicker">EMERGENCY HVAC REPAIR</span>
            <h2 id="how-it-works-heading" class="how-it-works-title">How it works</h2>
            <p class="how-it-works-desc">Clear, fast and easy to follow — even on a phone.</p>
            
            <div class="hiw-trust-pills">
              <span class="hiw-trust-pill">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                Nationwide
              </span>
              <span class="hiw-trust-pill">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                Genuine parts
              </span>
            </div>
          </div>

          <!-- Right Column: Vertical Timeline Track with 3 Step Cards -->
          <div class="hiw-timeline-track">
            
            <!-- Step 01: Call / Book -->
            <div class="hiw-card-wrapper">
              <div class="hiw-step-card">
                <div class="hiw-step-left">
                  <span class="hiw-step-num">01</span>
                  <div class="hiw-step-icon-badge" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                    </svg>
                  </div>
                  <div class="hiw-step-content">
                    <h3 class="hiw-step-title">Call / Book</h3>
                    <p class="hiw-step-desc">Call 0800 247 266 or Book a Service Call.</p>
                  </div>
                </div>
                <span class="hiw-step-badge">Call us</span>
              </div>
            </div>

            <!-- Step 02: Fast Dispatch -->
            <div class="hiw-card-wrapper">
              <div class="hiw-step-card">
                <div class="hiw-step-left">
                  <span class="hiw-step-num">02</span>
                  <div class="hiw-step-icon-badge" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon>
                    </svg>
                  </div>
                  <div class="hiw-step-content">
                    <h3 class="hiw-step-title">Fast Dispatch</h3>
                    <p class="hiw-step-desc">Nationwide engineer dispatched for fast, efficient response.</p>
                  </div>
                </div>
                <span class="hiw-step-badge">We dispatch</span>
              </div>
            </div>

            <!-- Step 03: Repair & Back Online -->
            <div class="hiw-card-wrapper">
              <div class="hiw-step-card">
                <div class="hiw-step-left">
                  <span class="hiw-step-num">03</span>
                  <div class="hiw-step-icon-badge" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                    </svg>
                  </div>
                  <div class="hiw-step-content">
                    <h3 class="hiw-step-title">Repair &amp; Back Online</h3>
                    <p class="hiw-step-desc">Genuine Carrier parts, shortest downtime.</p>
                  </div>
                </div>
                <span class="hiw-step-badge">You're back online</span>
              </div>
            </div>

          </div>

        </div>
      </div>
    </div>
  </section>
"@

$htmlPattern = '(?s)<section class="section-how-it-works".*?</section>'
if ($content -match $htmlPattern) {
    $content = [regex]::Replace($content, $htmlPattern, $newHtml.Trim())
    Write-Host "Successfully replaced HTML for How It Works."
} else {
    Write-Host "Error: HTML pattern not found!"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
