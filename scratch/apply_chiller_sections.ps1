$path = "final output\chiller-maintenance.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update CSS for .section-confidence-banner and .process-stages-grid
$oldCss = @'
    /* Customer Confidence & Operational Value Matrix (8-Column Grid) */
    .confidence-banner-box {
      background-color: var(--ahi-navy-dark);
      border-radius: var(--radius-sm);
      color: var(--ahi-white);
      padding: 48px;
      box-shadow: var(--shadow-card);
    }
'@

$newCss = @'
    /* Customer Confidence & Operational Value Matrix (8-Column Grid) */
    .section-confidence-banner {
      background-color: #113D6B;
      padding: 64px 0;
      color: var(--ahi-white);
    }

    .confidence-banner-box {
      background-color: transparent;
      border-radius: 0;
      color: var(--ahi-white);
      padding: 0;
      box-shadow: none;
    }
'@

if ($content.Contains($oldCss)) {
    $content = $content.Replace($oldCss, $newCss)
    Write-Host "Updated .section-confidence-banner CSS"
} else {
    Write-Host "Old CSS pattern not found"
}

# Update grid repeat(6, 1fr) to repeat(5, 1fr)
$oldGridCss = "    .process-stages-grid {`r`n      display: grid;`r`n      grid-template-columns: repeat(6, 1fr);"
$newGridCss = "    .process-stages-grid {`r`n      display: grid;`r`n      grid-template-columns: repeat(5, 1fr);"
if ($content.Contains($oldGridCss)) {
    $content = $content.Replace($oldGridCss, $newGridCss)
    Write-Host "Updated .process-stages-grid CSS to 5 columns"
} else {
    # Try with \n only
    $oldGridCssLF = "    .process-stages-grid {`n      display: grid;`n      grid-template-columns: repeat(6, 1fr);"
    $newGridCssLF = "    .process-stages-grid {`n      display: grid;`n      grid-template-columns: repeat(5, 1fr);"
    if ($content.Contains($oldGridCssLF)) {
        $content = $content.Replace($oldGridCssLF, $newGridCssLF)
        Write-Host "Updated .process-stages-grid CSS to 5 columns (LF)"
    }
}

# 2. Extract section boundaries
# Find start of section-what-we-do and start of section-contract-offering
$posWhatWeDo = $content.IndexOf('<section class="section-what-we-do"')
$posWhyMaintain = $content.IndexOf('<section class="section-why-maintain"')
$posContractOffering = $content.IndexOf('<section class="section-contract-offering"')

Write-Host "posWhatWeDo: $posWhatWeDo, posWhyMaintain: $posWhyMaintain, posContractOffering: $posContractOffering"

if ($posWhatWeDo -gt 0 -and $posWhyMaintain -gt $posWhatWeDo -and $posContractOffering -gt $posWhyMaintain) {
    # Find the comment before what-we-do
    $commentWhatWeDo = $content.LastIndexOf('<!-- ===', $posWhatWeDo)
    
    # We want to replace from $commentWhatWeDo up to $posContractOffering with the new Section 2 and Section 3
    $prefix = $content.Substring(0, $commentWhatWeDo)
    $suffix = $content.Substring($posContractOffering)
    
    $newSection2And3 = @'
    <!-- ==========================================================================
         SECTION 2 · BUILDING CONFIDENCE (8-PILLAR VALUE GRID)
         Full-width standalone dark navy container (#113D6B)
         ========================================================================== -->
    <section class="section-confidence-banner" id="building-confidence" aria-labelledby="confidence-title">
      <div class="container">
        <div class="confidence-banner-box">
          <div class="confidence-header">
            <span class="section-eyebrow" style="color: #60A5FA; display: block; margin-bottom: 12px;">BUILDING CONFIDENCE</span>
            <h2 id="confidence-title" class="confidence-title">Maintenance is not a cost line. It is building confidence.</h2>
            <p class="confidence-subtitle">Agreements tailored to your needs - just like your HVAC systems themselves:</p>
          </div>

          <div class="confidence-grid-8col">
            <!-- Benefit 1 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path><polyline points="9 12 11 14 15 10"></polyline></svg>
              </div>
              <h3 class="confidence-benefit-title">Legal Compliance</h3>
              <p class="confidence-benefit-desc">Comprehensive service logs and F-Gas reporting that satisfy building BWOF compliance obligations.</p>
            </div>

            <!-- Benefit 2 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
              </div>
              <h3 class="confidence-benefit-title">Life-cycle Planning</h3>
              <p class="confidence-benefit-desc">Forward multi-year visibility into equipment condition, component wear, and planned capital replacement.</p>
            </div>

            <!-- Benefit 3 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              </div>
              <h3 class="confidence-benefit-title">Asset Management</h3>
              <p class="confidence-benefit-desc">One centralized digital record of every chiller asset, service visit, oil sample, and engineering recommendation.</p>
            </div>

            <!-- Benefit 4 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path></svg>
              </div>
              <h3 class="confidence-benefit-title">Reduced Energy Costs</h3>
              <p class="confidence-benefit-desc">Clean, calibrated heat exchangers demand significantly less electrical power to deliver the exact same cooling ton.</p>
            </div>

            <!-- Benefit 5 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
              </div>
              <h3 class="confidence-benefit-title">Enhanced Efficiency</h3>
              <p class="confidence-benefit-desc">Precision-tuned thermodynamic controls, approach temperatures, and refrigerant charges visit after visit.</p>
            </div>

            <!-- Benefit 6 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z"></path><path d="M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12"></path></svg>
              </div>
              <h3 class="confidence-benefit-title">Environmental Protection</h3>
              <p class="confidence-benefit-desc">Responsible refrigerant handling, continuous leak vigilance, and compliant recovery procedures.</p>
            </div>

            <!-- Benefit 7 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
              </div>
              <h3 class="confidence-benefit-title">Minimal Disruption</h3>
              <p class="confidence-benefit-desc">Planned service windows scheduled strictly around building operating hours and sensitive commercial occupants.</p>
            </div>

            <!-- Benefit 8 -->
            <div class="confidence-benefit-item">
              <div class="confidence-icon-circle" aria-hidden="true">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line></svg>
              </div>
              <h3 class="confidence-benefit-title">Maintenance Management</h3>
              <p class="confidence-benefit-desc">End-to-end scheduling coordination, dispatch logistics, and ongoing warranty administration handled seamlessly.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ==========================================================================
         SECTION 3 · WHY MAINTAIN WITH AHI CARRIER?
         Manufacturer-aligned expertise, plant room visual & 5 stacked cards
         ========================================================================== -->
    <section class="section-why-maintain" aria-labelledby="why-maintain-title">
      <div class="container">
        
        <span class="section-eyebrow">WHY MAINTAIN WITH AHI CARRIER</span>
        <h2 id="why-maintain-title" class="why-maintain-title">Why Maintain With AHI Carrier</h2>
        <p class="section-lead-text" style="margin-bottom: 40px;">Direct factory access, proprietary diagnostic tools, and New Zealand's most experienced central cooling service engineers.</p>

        <!-- Asymmetric Composition: Plantroom Photo + Warranty Callout & 5 Stacked Cards -->
        <div class="why-maintain-grid-2col">
          
          <!-- Left Column: Visual Card -->
          <div class="why-left-visual-card">
            <img src="Reference files/chiller-plantroom.jpg" alt="Commercial central chiller machinery plant room with technician equipment" class="why-plant-photo" loading="lazy">
            <div class="why-banner-panel">
              <h3 class="why-banner-heading">10 years <span class="light">- Warranty Backing</span></h3>
              <p class="why-banner-desc">Keep your cover in good standing with documented, manufacturer-aligned service.</p>
              <a href="#request-service" class="btn-why-request">Request for Service</a>
            </div>
          </div>

          <!-- Right Column: 5 Stacked Feature Cards -->
          <div class="why-right-stack">
            
            <!-- Card 1: Warranty -->
            <div class="why-feature-row-card">
              <div class="why-row-icon-box" aria-hidden="true">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                  <polyline points="9 12 11 14 15 10"></polyline>
                </svg>
              </div>
              <div class="why-row-text-wrap">
                <h3 class="why-row-title">Warranty</h3>
                <p class="why-row-desc">Genuine parts and manufacturer-backed workmanship, documented for your records</p>
              </div>
            </div>

            <!-- Card 2: Critical -->
            <div class="why-feature-row-card">
              <div class="why-row-icon-box" aria-hidden="true">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10"></circle>
                  <line x1="12" y1="8" x2="12" y2="12"></line>
                  <line x1="12" y1="16" x2="12.01" y2="16"></line>
                </svg>
              </div>
              <div class="why-row-text-wrap">
                <h3 class="why-row-title">Critical</h3>
                <p class="why-row-desc">Outside the warranty period our proactive service team will monitor the condition of your equipment</p>
              </div>
            </div>

            <!-- Card 3: Flexibility -->
            <div class="why-feature-row-card">
              <div class="why-row-icon-box" aria-hidden="true">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M7 16V4M7 4L3 8M7 4L11 8M17 8v12M17 20l4-4M17 20l-4-4"></path>
                </svg>
              </div>
              <div class="why-row-text-wrap">
                <h3 class="why-row-title">Flexibility</h3>
                <p class="why-row-desc">One chiller or a national portfolio. Terms, coverage and visit frequency can flex with your site.</p>
              </div>
            </div>

            <!-- Card 4: Value for Money -->
            <div class="why-feature-row-card">
              <div class="why-row-icon-box" aria-hidden="true">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <line x1="12" y1="1" x2="12" y2="23"></line>
                  <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                </svg>
              </div>
              <div class="why-row-text-wrap">
                <h3 class="why-row-title">Value for Money</h3>
                <p class="why-row-desc">Planned care catches small issues early, protects efficiency and makes costs predictable.</p>
              </div>
            </div>

            <!-- Card 5: Feedback -->
            <div class="why-feature-row-card">
              <div class="why-row-icon-box" aria-hidden="true">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                  <polyline points="14 2 14 8 20 8"></polyline>
                  <line x1="16" y1="13" x2="8" y2="13"></line>
                  <line x1="16" y1="17" x2="8" y2="17"></line>
                </svg>
              </div>
              <div class="why-row-text-wrap">
                <h3 class="why-row-title">Feedback</h3>
                <p class="why-row-desc">Clear service reporting after every visit — what was done, what was found, and what comes next.</p>
              </div>
            </div>

          </div>

        </div>

      </div>
    </section>

    <!-- ==========================================================================
         SECTION 4 · MAINTENANCE PLANS
         Structured Comparison Layout · Clear Inclusions · Verified Placeholders
         ========================================================================== -->
'@
    
    # Notice that $suffix starts with <section class="section-contract-offering"
    # But in the original file, there was a comment before it.
    # Let's find the comment before section-contract-offering so we don't duplicate comments.
    $commentContract = $content.LastIndexOf('<!-- ===', $posContractOffering)
    $suffixClean = $content.Substring($commentContract)
    
    $content = $prefix + $newSection2And3 + "`r`n" + $suffixClean
    Write-Host "Successfully replaced Section 2 and Section 3!"
}

# 3. Update Section 5 (Maintenance Process) to 5 steps
$posProcess = $content.IndexOf('<section class="section-service-process"')
$posForm = $content.IndexOf('<section class="section-form-wrapper"')

if ($posProcess -gt 0 -and $posForm -gt $posProcess) {
    $commentProcess = $content.LastIndexOf('<!-- ===', $posProcess)
    $commentForm = $content.LastIndexOf('<!-- ===', $posForm)
    
    $prefixProcess = $content.Substring(0, $commentProcess)
    $suffixProcess = $content.Substring($commentForm)
    
    $newProcess = @'
    <!-- ==========================================================================
         SECTION 5 · MAP OF THE MAINTENANCE PROCESS
         Visual Process Journey · 5-Step Connected Flow
         ========================================================================== -->
    <section class="section-service-process" aria-labelledby="process-title">
      <div class="container">
        
        <div class="section-header-center">
          <span class="section-eyebrow">MAINTENANCE JOURNEY</span>
          <h2 id="process-title" class="section-title-h2">From first call to lasting performance</h2>
          <p class="section-lead-text">Tap a step to see what happens — no surprises, just a clear service rhythm.</p>
        </div>

        <div class="process-visual-map">
          
          <!-- Visual Connecting Conduit -->
          <div class="process-conduit-line" aria-hidden="true"></div>

          <div class="process-stages-grid">
            
            <!-- Stage 01 -->
            <div class="process-stage-node" tabindex="0">
              <div class="stage-hub">
                <span class="stage-hub-num">01</span>
                <span class="stage-hub-phase">Book</span>
              </div>
              <div class="stage-card-body">
                <div>
                  <h3 class="stage-title">Book</h3>
                  <p class="stage-desc">Call 0800 247 266 or request a service call online.</p>
                </div>
              </div>
            </div>

            <!-- Stage 02 -->
            <div class="process-stage-node" tabindex="0">
              <div class="stage-hub">
                <span class="stage-hub-num">02</span>
                <span class="stage-hub-phase">Site Assessment</span>
              </div>
              <div class="stage-card-body">
                <div>
                  <h3 class="stage-title">Site Assessment</h3>
                  <p class="stage-desc">We inspect equipment, operating conditions and risk.</p>
                </div>
              </div>
            </div>

            <!-- Stage 03 -->
            <div class="process-stage-node" tabindex="0">
              <div class="stage-hub">
                <span class="stage-hub-num">03</span>
                <span class="stage-hub-phase">Tailored Plan</span>
              </div>
              <div class="stage-card-body">
                <div>
                  <h3 class="stage-title">Tailored Plan</h3>
                  <p class="stage-desc">Frequency and cover matched to your site and budget.</p>
                </div>
              </div>
            </div>

            <!-- Stage 04 -->
            <div class="process-stage-node" tabindex="0">
              <div class="stage-hub">
                <span class="stage-hub-num">04</span>
                <span class="stage-hub-phase">Scheduled</span>
              </div>
              <div class="stage-card-body">
                <div>
                  <h3 class="stage-title">Scheduled Maintenance</h3>
                  <p class="stage-desc">Planned visits, tuning, cleaning and condition checks.</p>
                </div>
              </div>
            </div>

            <!-- Stage 05 -->
            <div class="process-stage-node" tabindex="0">
              <div class="stage-hub">
                <span class="stage-hub-num">05</span>
                <span class="stage-hub-phase">Reporting</span>
              </div>
              <div class="stage-card-body">
                <div>
                  <h3 class="stage-title">Reporting &amp; Feedback</h3>
                  <p class="stage-desc">Written reports, energy insight and next-step advice.</p>
                </div>
              </div>
            </div>

          </div>

        </div>

      </div>
    </section>

'@
    
    $content = $prefixProcess + $newProcess + "`r`n" + $suffixProcess
    Write-Host "Successfully replaced Section 5 Process!"
}

# Write out with UTF-8
[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "File saved successfully."
