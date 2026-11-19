$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# ==============================================================================
# 1. Update .check-circle-blue SVGs to Arrow Icon SVGs
# ==============================================================================
$checkSvg = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>'
$arrowSvg = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>'

$countBefore = ([regex]::Matches($content, [regex]::Escape($checkSvg))).Count
Write-Host "Found $countBefore checkmark SVGs matching exact pattern in index.html"

if ($countBefore -gt 0) {
    $content = $content.Replace($checkSvg, $arrowSvg)
    Write-Host "Successfully replaced $countBefore checkmark SVGs with arrow SVGs."
}

# ==============================================================================
# 2. Add / Update CSS for Eyebrows and Left Alignment
# ==============================================================================
$cssToAdd = @"
    /* ==========================================================================
       SECTION EYEBROWS & LEFT-ALIGNED SECTION HEADERS (CONSISTENCY WITH PDM)
       ========================================================================== */
    .section-eyebrow,
    .what-is-kicker,
    .reasons-trust-kicker,
    .how-it-works-kicker,
    .importance-kicker,
    .emergencies-kicker,
    .industries-kicker,
    .form-panel-kicker,
    .services-kicker {
      font-family: 'Montserrat', sans-serif;
      font-size: 13px;
      font-weight: 600;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: #64748B;
      margin-bottom: 12px;
      display: inline-block;
      line-height: 1.2;
    }

    .section-header-left {
      text-align: left;
      margin-bottom: 36px;
    }

    .section-header-left .section-title-h2 {
      text-align: left;
      margin-bottom: 12px;
    }

    .section-header-left .section-lead-text {
      margin: 0;
      max-width: 780px;
      text-align: left;
    }
"@

# Inject after .hero-button-cluster or in main styles block
$content = [regex]::Replace($content, '(\.hero-button-cluster\s*\{[^}]+\})', "`$1`r`n`r`n$cssToAdd")

# ==============================================================================
# 3. Update Existing Centered Header CSS to Left-Aligned
# ==============================================================================
# reasons-trust-header
$content = [regex]::Replace($content, '(\.reasons-trust-header\s*\{[^}]*?text-align:\s*)center;', '${1}left;')
# reasons-trust-subtitle
$content = [regex]::Replace($content, '(\.reasons-trust-subtitle\s*\{[^}]*?margin:\s*)0\s+auto;', '${1}0;')

# how-it-works-header
$content = [regex]::Replace($content, '(\.how-it-works-header\s*\{[^}]*?text-align:\s*)center;', '${1}left;')

# importance-header
$content = [regex]::Replace($content, '(\.importance-header\s*\{[^}]*?text-align:\s*)center;', '${1}left;')

# ==============================================================================
# 4. Insert Section Eyebrows into HTML
# ==============================================================================
# Section 01: What is Emergency HVAC Repair
$oldSec1 = '<div class="what-is-content">' + "`r`n" + '          <h2 id="what-is-heading" class="what-is-heading">'
$newSec1 = '<div class="what-is-content">' + "`r`n" + '          <span class="section-eyebrow what-is-kicker">WHAT IS EMERGENCY HVAC REPAIR</span>' + "`r`n" + '          <h2 id="what-is-heading" class="what-is-heading">'

if ($content.Contains($oldSec1)) {
    $content = $content.Replace($oldSec1, $newSec1)
    Write-Host "Added eyebrow to Section 01 (What is Emergency HVAC Repair)"
} else {
    $content = [regex]::Replace($content, '(<div class="what-is-content">\s*)(<h2 id="what-is-heading")', "`$1<span class=""section-eyebrow what-is-kicker"">WHAT IS EMERGENCY HVAC REPAIR</span>`r`n          `$2")
    Write-Host "Added eyebrow to Section 01 via regex"
}

# Section 02: Why AHI Carrier
$content = [regex]::Replace($content, '(<div class="reasons-trust-header">\s*)(<h2 id="reasons-heading")', "`$1<span class=""section-eyebrow reasons-trust-kicker"">WHY AHI CARRIER</span>`r`n        `$2")
Write-Host "Added eyebrow to Section 02 (Why AHI Carrier)"

# Section 03: How it works
$content = [regex]::Replace($content, '(<div class="how-it-works-header">\s*)(<h2 id="how-it-works-heading")', "`$1<span class=""section-eyebrow how-it-works-kicker"">DISPATCH WORKFLOW</span>`r`n        `$2")
Write-Host "Added eyebrow to Section 03 (How It Works)"

# Section 04: The Importance of Fast, Efficient HVAC Repair
$content = [regex]::Replace($content, '(<div class="importance-header">\s*)(<h2 id="importance-heading")', "`$1<span class=""section-eyebrow importance-kicker"">OPERATIONAL CONTINUITY</span>`r`n        `$2")
Write-Host "Added eyebrow to Section 04 (Importance)"

# Section 05: Common HVAC Emergencies We Resolve
$content = [regex]::Replace($content, '<div class="section-header-center">(\s*<h2 id="emergencies-heading")', "<div class=""section-header-left"">`r`n        <span class=""section-eyebrow emergencies-kicker"">EMERGENCY CLASSIFICATIONS</span>`$1")
Write-Host "Added eyebrow and left-aligned Section 05 (Common Emergencies)"

# Section 06: Industries We Support Across New Zealand
$content = [regex]::Replace($content, '<div class="section-header-center">(\s*<h2 id="industries-heading")', "<div class=""section-header-left"">`r`n        <span class=""section-eyebrow industries-kicker"">CRITICAL SECTOR UPTIME</span>`$1")
Write-Host "Added eyebrow and left-aligned Section 06 (Industries We Support)"

# Section 07: Form Panel Kicker -> Ensure it uses section-eyebrow
$content = [regex]::Replace($content, '<span class="form-panel-top-kicker">GET STARTED</span>', '<span class="section-eyebrow form-panel-kicker">24/7 RAPID DISPATCH</span>')
Write-Host "Updated eyebrow for Section 07 (Form Panel)"

# Section 08: Explore Other Services
$content = [regex]::Replace($content, '(<div class="services-header-row">\s*)<h2 id="other-services-title" class="section-title-h2">Explore Other Services</h2>', "`$1<div>`r`n          <span class=""section-eyebrow services-kicker"">COMPREHENSIVE HVAC SUPPORT</span>`r`n          <h2 id=""other-services-title"" class=""section-title-h2"">Explore Other Services</h2>`r`n        </div>")
Write-Host "Added eyebrow to Section 08 (Explore Other Services)"

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html successfully."
