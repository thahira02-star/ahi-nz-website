$path = "final output\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update CSS for Section 03
$cssTargetStart = "    /* ==========================================================================`r`n       SECTION 03 · HOW IT WORKS"
if (-not $content.Contains($cssTargetStart)) {
    $cssTargetStart = "    /* ==========================================================================`n       SECTION 03 · HOW IT WORKS"
}

$cssTargetEnd = "    /* ==========================================================================`r`n       SECTION 05 · THE IMPORTANCE OF FAST REPAIR"
if (-not $content.Contains($cssTargetEnd)) {
    $cssTargetEnd = "    /* ==========================================================================`n       SECTION 05 · THE IMPORTANCE OF FAST REPAIR"
}

$idxStart = $content.IndexOf($cssTargetStart)
$idxEnd = $content.IndexOf($cssTargetEnd)

if ($idxStart -lt 0 -or $idxEnd -lt 0) {
    Write-Error "Could not find Section 03 CSS boundaries"
    exit 1
}

$newCss = @"
    /* ==========================================================================
       SECTION 03 · HOW IT WORKS (VERTICAL TIMELINE · LIGHT THEME)
       Spacing: Exactly 40px vertical spacing
       Reference: media_1795074640692_03d3e40b.png (Light Theme Adaptation - Minimal Canvas)
       ========================================================================== */
    .section-how-it-works {
      background-color: var(--ahi-neutral-bg);
      padding: 40px 0;
      border-top: 1px solid var(--ahi-border-light);
      border-bottom: 1px solid var(--ahi-border-light);
    }

    .hiw-timeline-grid {
      display: grid;
      grid-template-columns: 360px 1fr;
      gap: 56px;
      align-items: start;
    }

    /* Left Column: Heading & Subtitle */
    .hiw-left-col {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      padding-top: 2px;
    }

    .how-it-works-kicker {
      margin-bottom: 8px;
    }

    .how-it-works-title {
      font-size: 38px;
      font-weight: 700;
      color: var(--ahi-text-heading);
      letter-spacing: -0.015em;
      line-height: 1.18;
      margin-bottom: 14px;
      text-align: left;
    }

    .how-it-works-desc {
      font-size: 15.5px;
      color: var(--ahi-text-secondary);
      line-height: 1.6;
      margin-bottom: 0;
      max-width: 330px;
      text-align: left;
    }

    /* Right Column: Timeline track & cards */
    .hiw-timeline-track {
      position: relative;
      display: flex;
      flex-direction: column;
      gap: 16px;
      padding-left: 48px;
    }

    /* Vertical connector line - precisely centered with circles at x = 18px */
    .hiw-timeline-track::before {
      content: '';
      position: absolute;
      left: 17px;
      top: 43px;
      bottom: 43px;
      width: 2px;
      background-color: #CBD5E1;
      border-radius: 2px;
      z-index: 1;
    }

    .hiw-card-wrapper {
      position: relative;
    }

    /* Circular node - perfectly centered at x = 18px (48px - 30px = 18px) */
    .hiw-card-wrapper::before {
      content: '';
      position: absolute;
      left: -30px;
      top: 50%;
      transform: translate(-50%, -50%);
      width: 16px;
      height: 16px;
      border-radius: 50%;
      background-color: #FFFFFF;
      border: 3.5px solid #163865;
      box-shadow: 0 0 0 4px #EFF6FF;
      z-index: 2;
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .hiw-card-wrapper:hover::before {
      background-color: #163865;
      border-color: #FFFFFF;
      box-shadow: 0 0 0 5px rgba(22, 56, 101, 0.22);
      transform: translate(-50%, -50%) scale(1.15);
    }

    /* Horizontal Step Card - Minimal & Professional */
    .hiw-step-card {
      background-color: #FFFFFF;
      border: 1px solid #E2E8F0;
      border-radius: 12px;
      padding: 20px 26px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 20px;
      box-shadow: 0 2px 8px -2px rgba(16, 47, 88, 0.04), 0 1px 3px rgba(16, 47, 88, 0.02);
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .hiw-step-card:hover {
      border-color: #93C5FD;
      box-shadow: 0 10px 24px -4px rgba(22, 56, 101, 0.08), 0 4px 8px -2px rgba(22, 56, 101, 0.03);
      transform: translateX(5px);
    }

    .hiw-step-left {
      display: flex;
      align-items: center;
      gap: 18px;
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
      width: 44px;
      height: 44px;
      border-radius: 50%;
      background-color: #EFF6FF;
      border: 1px solid #DBEAFE;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      color: #163865;
      transition: all 0.25s ease;
    }

    .hiw-step-card:hover .hiw-step-icon-badge {
      background-color: #163865;
      color: #FFFFFF;
      border-color: #163865;
      transform: scale(1.05);
    }

    .hiw-step-icon-badge svg {
      width: 20px;
      height: 20px;
    }

    .hiw-step-content {
      display: flex;
      flex-direction: column;
    }

    .hiw-step-title {
      font-size: 16.5px;
      font-weight: 700;
      color: var(--ahi-text-heading);
      margin: 0 0 3px 0;
      line-height: 1.3;
      font-family: 'Montserrat', sans-serif;
    }

    .hiw-step-desc {
      font-size: 14px;
      color: var(--ahi-text-secondary);
      line-height: 1.5;
      margin: 0;
      font-family: 'Montserrat', sans-serif;
    }

    .hiw-step-badge {
      font-size: 13.5px;
      font-weight: 600;
      color: var(--ahi-text-secondary, #64748B);
      background: transparent;
      border: none;
      padding: 0;
      border-radius: 0;
      box-shadow: none;
      white-space: nowrap;
      flex-shrink: 0;
      cursor: default;
      pointer-events: none;
      user-select: none;
      font-family: 'Montserrat', sans-serif;
      letter-spacing: -0.01em;
      transition: color 0.2s ease;
    }

    .hiw-step-card:hover .hiw-step-badge {
      background: transparent;
      border: none;
      box-shadow: none;
      color: #163865;
    }

    @media (max-width: 900px) {
      .hiw-timeline-grid {
        grid-template-columns: 1fr;
        gap: 32px;
      }
      .how-it-works-desc {
        max-width: 100%;
      }
    }

    @media (max-width: 580px) {
      .hiw-timeline-track {
        padding-left: 36px;
      }
      .hiw-timeline-track::before {
        left: 11px;
      }
      .hiw-card-wrapper::before {
        left: -24px;
        width: 14px;
        height: 14px;
      }
      .hiw-step-card {
        padding: 16px 18px;
        flex-direction: column;
        align-items: flex-start;
        gap: 14px;
      }
      .hiw-step-badge {
        align-self: flex-start;
      }
    }

"@

$content = $content.Substring(0, $idxStart) + $newCss + $content.Substring($idxEnd)
Write-Host "Updated CSS for Section 03."

# 2. Update HTML for Section 03: Remove hiw-trust-pills
$htmlTargetStart = "<div class=""hiw-left-col"">"
$htmlTargetEnd = "<!-- Right Column: Vertical Timeline Track with 3 Step Cards -->"

$hStart = $content.IndexOf($htmlTargetStart)
$hEnd = $content.IndexOf($htmlTargetEnd)

if ($hStart -lt 0 -or $hEnd -lt 0) {
    Write-Error "Could not find HTML boundaries for hiw-left-col"
    exit 1
}

$newLeftColHtml = @"
<div class="hiw-left-col">
          <span class="section-eyebrow how-it-works-kicker">EMERGENCY HVAC REPAIR</span>
          <h2 id="how-it-works-heading" class="how-it-works-title">How it works</h2>
          <p class="how-it-works-desc">Clear, fast and easy to follow — even on a phone.</p>
        </div>

        
"@

$content = $content.Substring(0, $hStart) + $newLeftColHtml + $content.Substring($hEnd)
Write-Host "Updated HTML for Section 03 (removed trust pills, aligned left col)."

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Wrote updated content to $path."

# Mirror to root index.html
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Mirrored to index.html."
