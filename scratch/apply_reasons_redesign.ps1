$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# 1. Update Reasons Card CSS
$oldReasonsCssPattern = '(?s)\.reasons-grid-3col\s*\{.*?\.reasons-bullet-dot\s*\{[^}]+\}'

$newReasonsCss = @"
    .reasons-grid-3col {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 30px;
    }

    .reasons-card {
      background-color: var(--ahi-white);
      border: 1px solid var(--ahi-border-light);
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.03);
      display: flex;
      flex-direction: column;
      transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .reasons-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 12px 28px -4px rgba(22, 56, 101, 0.08), 0 4px 12px -2px rgba(22, 56, 101, 0.04);
      border-color: #93C5FD;
    }

    .reasons-photo-wrap {
      width: 100%;
      height: 200px;
      overflow: hidden;
      position: relative;
      background-color: #F1F5F9;
    }

    .reasons-card-photo {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .reasons-card:hover .reasons-card-photo {
      transform: scale(1.04);
    }

    .reasons-card-content {
      padding: 24px 26px 28px;
      display: flex;
      flex-direction: column;
      flex-grow: 1;
    }

    .reasons-card-header {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-bottom: 18px;
    }

    .reasons-icon-box {
      width: 42px;
      height: 42px;
      border-radius: 8px;
      background-color: #EFF6FF;
      border: 1px solid #DBEAFE;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #163865;
      flex-shrink: 0;
      transition: all 0.2s ease;
    }

    .reasons-card:hover .reasons-icon-box {
      background-color: #163865;
      color: #FFFFFF;
      border-color: #163865;
    }

    .reasons-icon-box svg {
      width: 20px;
      height: 20px;
    }

    .reasons-card-heading {
      font-size: 20px;
      font-weight: 700;
      color: #163865;
      margin: 0;
      letter-spacing: -0.01em;
      font-family: 'Montserrat', sans-serif;
      line-height: 1.25;
    }

    .reasons-checklist {
      list-style: none;
      display: flex;
      flex-direction: column;
      gap: 12px;
      margin: 0;
      padding: 0;
    }

    .reasons-check-item {
      display: flex;
      align-items: flex-start;
      gap: 12px;
      font-size: 14px;
      line-height: 1.5;
      color: #475569;
      font-weight: 500;
    }

    .reasons-check-bullet {
      width: 18px;
      height: 18px;
      border-radius: 50%;
      background-color: #EFF6FF;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
      margin-top: 2px;
    }

    .reasons-check-bullet svg {
      width: 11px;
      height: 11px;
      stroke: #163865;
    }
"@

if ($content -match $oldReasonsCssPattern) {
    $content = [regex]::Replace($content, $oldReasonsCssPattern, $newReasonsCss)
    Write-Host "Replaced reasons CSS successfully"
} else {
    Write-Host "Warning: old reasons CSS pattern not found!"
}

# 2. Update Reasons Card HTML
$oldReasonsHtmlPattern = '(?s)<div class="reasons-grid-3col">.*?</div>\s*</div>\s*</section>'

$newReasonsHtml = @"
<div class="reasons-grid-3col">
        
        <!-- Pillar 1: Trust -->
        <article class="reasons-card">
          <div class="reasons-photo-wrap">
            <img src="Reference files/trust.png" alt="AHI Carrier certified technician servicing commercial equipment" class="reasons-card-photo" loading="lazy">
          </div>
          
          <div class="reasons-card-content">
            <div class="reasons-card-header">
              <div class="reasons-icon-box" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                  <polyline points="9 12 11 14 15 10"></polyline>
                </svg>
              </div>
              <h3 class="reasons-card-heading">Trust</h3>
            </div>

            <ul class="reasons-checklist">
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Professional teams for complex work</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Minimal disruption, fastest turnaround</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>High quality and value for money</span>
              </li>
            </ul>
          </div>
        </article>

        <!-- Pillar 2: Flexibility -->
        <article class="reasons-card">
          <div class="reasons-photo-wrap">
            <img src="Reference files/flexibility.png" alt="Auckland skyline representing nationwide New Zealand network" class="reasons-card-photo" loading="lazy">
          </div>
          
          <div class="reasons-card-content">
            <div class="reasons-card-header">
              <div class="reasons-icon-box" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="23 4 23 10 17 10"></polyline>
                  <polyline points="1 20 1 14 7 14"></polyline>
                  <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
                </svg>
              </div>
              <h3 class="reasons-card-heading">Flexibility</h3>
            </div>

            <ul class="reasons-checklist">
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>All HVAC systems and manufacturers</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Nationwide network, available 24/7/365</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Tailored to any scale or job size</span>
              </li>
            </ul>
          </div>
        </article>

        <!-- Pillar 3: Optimised Performance -->
        <article class="reasons-card">
          <div class="reasons-photo-wrap">
            <img src="Reference files/optimised performance.png" alt="Engineer inspecting BMS diagnostic touchscreen in facility plant room" class="reasons-card-photo" loading="lazy">
          </div>
          
          <div class="reasons-card-content">
            <div class="reasons-card-header">
              <div class="reasons-icon-box" aria-hidden="true">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10"></circle>
                  <polyline points="12 6 12 12 16 14"></polyline>
                </svg>
              </div>
              <h3 class="reasons-card-heading">Optimised Performance</h3>
            </div>

            <ul class="reasons-checklist">
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Improves efficiency and overall systems</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Qualified engineers offer technical advice</span>
              </li>
              <li class="reasons-check-item">
                <span class="reasons-check-bullet" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
                </span>
                <span>Proactive care prevents future failures</span>
              </li>
            </ul>
          </div>
        </article>

      </div>
    </div>
  </section>
"@

if ($content -match $oldReasonsHtmlPattern) {
    $content = [regex]::Replace($content, $oldReasonsHtmlPattern, $newReasonsHtml.Trim())
    Write-Host "Replaced reasons HTML successfully"
} else {
    Write-Host "Warning: old reasons HTML pattern not found!"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
