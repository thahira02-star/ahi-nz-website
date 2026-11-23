$path = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update heading color to #0d0d0d
$oldHeadingCss = @'
    .equipment-section-header .section-title-h2 {
      font-family: 'Montserrat', sans-serif;
      font-size: 32px;
      font-weight: 600;
      color: #163568;
      line-height: 1.25;
      letter-spacing: -0.015em;
      margin: 0 0 10px 0;
    }
'@

$newHeadingCss = @'
    .equipment-section-header .section-title-h2 {
      font-family: 'Montserrat', sans-serif;
      font-size: 32px;
      font-weight: 600;
      color: #0d0d0d;
      line-height: 1.25;
      letter-spacing: -0.015em;
      margin: 0 0 10px 0;
    }
'@

if ($content.Contains($oldHeadingCss)) {
    $content = $content.Replace($oldHeadingCss, $newHeadingCss)
    Write-Host "Replaced heading color to #0d0d0d"
} else {
    Write-Host "Warning: oldHeadingCss not matched exactly"
}

# 2. Update CSS for .equipment-dir-item, photo frame, and chips
$oldCssBlock = @'
    .equipment-dir-item {
      display: flex;
      flex-direction: column;
      background-color: #FFFFFF;
      border: 1px solid #E2E8F0;
      border-radius: 16px;
      padding: 12px;
      box-sizing: border-box;
      box-shadow: 0 2px 8px rgba(16, 47, 88, 0.04);
      cursor: pointer;
      position: relative;
      transition: all 0.25s ease;
    }

    .equipment-dir-item:hover,
    .equipment-dir-item.is-featured,
    .equipment-dir-item.active {
      border-color: #38BDF8;
      box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15), 0 10px 24px -4px rgba(22, 56, 101, 0.10);
    }

    /* Carefully Proportioned Machinery Placeholder Frame */
    .equipment-photo-frame {
      width: 100%;
      height: 110px;
      border-radius: 10px;
      overflow: hidden;
      position: relative;
      background: #F8FAFC;
      border: 1.5px dashed #CBD5E1;
      margin-bottom: 12px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 6px;
      box-sizing: border-box;
      transition: border-color 0.25s ease, background-color 0.25s ease;
    }

    .equipment-dir-item:hover .equipment-photo-frame,
    .equipment-dir-item.is-featured .equipment-photo-frame {
      border-color: #93C5FD;
      background: #F0F7FF;
    }

    .equipment-placeholder-icon {
      width: 34px;
      height: 34px;
      border-radius: 8px;
      background: #FFFFFF;
      border: 1px solid #E2E8F0;
      box-shadow: 0 2px 6px rgba(22, 56, 101, 0.06);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #64748B;
      transition: transform 0.2s ease, box-shadow 0.2s ease, color 0.2s ease, border-color 0.2s ease;
    }

    .equipment-dir-item:hover .equipment-placeholder-icon,
    .equipment-dir-item.is-featured .equipment-placeholder-icon {
      transform: scale(1.05);
      color: #0284C7;
      border-color: #BFDBFE;
      box-shadow: 0 4px 10px rgba(22, 56, 101, 0.12);
    }

    .equipment-placeholder-label {
      font-family: 'Montserrat', sans-serif;
      font-size: 10px;
      font-weight: 600;
      color: #64748B;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      line-height: 1;
    }

    .equipment-dir-item:hover .equipment-placeholder-label,
    .equipment-dir-item.is-featured .equipment-placeholder-label {
      color: #0284C7;
    }

    /* Item Typographic Content */
    .equipment-item-body {
      padding: 0;
      display: flex;
      flex-direction: column;
      flex: 1;
    }

    .equipment-asset-code {
      font-size: 10.5px;
      font-weight: 700;
      color: #64748B;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      margin-bottom: 4px;
    }

    .equipment-item-title {
      font-family: 'Montserrat', sans-serif;
      font-size: 12px;
      font-weight: 700;
      color: #163865;
      line-height: 1.3;
      margin: 0 0 10px 0;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      text-align: left;
    }

    /* Single-Column Stacked Metric Chips Grid Layout matching reference design */
    .equipment-metrics-list {
      display: flex;
      flex-direction: column;
      gap: 5px;
      width: 100%;
    }

    .equipment-metric-chip {
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      background-color: #F8FAFC;
      border: 1px solid #E2E8F0;
      border-radius: 6px;
      padding: 5px 8px;
      font-family: 'Montserrat', sans-serif;
      font-size: 10px;
      font-weight: 600;
      color: #475569;
      line-height: 1.2;
      box-sizing: border-box;
      width: 100%;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      transition: all 0.2s ease;
    }

    .equipment-dir-item:hover .equipment-metric-chip,
    .equipment-dir-item.is-featured .equipment-metric-chip,
    .equipment-dir-item.active .equipment-metric-chip {
      background-color: #EFF6FF;
      border-color: #BFDBFE;
      color: #163865;
    }
'@

$newCssBlock = @'
    .equipment-dir-item {
      display: flex;
      flex-direction: column;
      background-color: #FFFFFF;
      border: 1px solid #E2E8F0;
      border-radius: 12px;
      padding: 12px;
      box-sizing: border-box;
      box-shadow: 0 2px 8px rgba(16, 47, 88, 0.04);
      cursor: pointer;
      position: relative;
      transition: all 0.25s ease;
    }

    .equipment-dir-item:hover {
      border-color: #38BDF8;
      box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15), 0 10px 24px -4px rgba(22, 56, 101, 0.10);
      transform: translateY(-3px);
    }

    /* Carefully Proportioned Machinery Photo Frame */
    .equipment-photo-frame {
      width: 100%;
      height: 110px;
      border-radius: 8px;
      overflow: hidden;
      position: relative;
      background-color: #F1F5F9;
      margin-bottom: 12px;
    }

    .equipment-machinery-img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      transition: transform 0.3s ease;
    }

    .equipment-dir-item:hover .equipment-machinery-img {
      transform: scale(1.05);
    }

    /* Item Typographic Content */
    .equipment-item-body {
      padding: 0;
      display: flex;
      flex-direction: column;
      flex: 1;
    }

    .equipment-asset-code {
      font-size: 10.5px;
      font-weight: 700;
      color: #64748B;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      margin-bottom: 4px;
    }

    .equipment-item-title {
      font-family: 'Montserrat', sans-serif;
      font-size: 13px;
      font-weight: 700;
      color: #163865;
      line-height: 1.3;
      margin: 0 0 10px 0;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      text-align: left;
    }

    /* Wrapped Metric Chips Grid Layout: 2 chips on row 1, 1 chip on row 2 */
    .equipment-metrics-list {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      width: 100%;
      margin-top: auto;
    }

    .equipment-metric-chip {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      background-color: #F8FAFC;
      border: 1px solid #E2E8F0;
      border-radius: 6px;
      padding: 4px 8px;
      font-family: 'Montserrat', sans-serif;
      font-size: 10.5px;
      font-weight: 500;
      color: #475569;
      line-height: 1.2;
      box-sizing: border-box;
      white-space: nowrap;
      transition: all 0.2s ease;
    }

    .equipment-dir-item:hover .equipment-metric-chip {
      background-color: #EFF6FF;
      border-color: #BFDBFE;
      color: #163865;
    }
'@

if ($content.Contains($oldCssBlock)) {
    $content = $content.Replace($oldCssBlock, $newCssBlock)
    Write-Host "Replaced CSS block for cards, photo frame, and chips"
} else {
    Write-Host "Warning: oldCssBlock not matched exactly"
}

# 3. Replace the 6 cards in HTML
$startHtmlMarker = '      <div class="equipment-directory-matrix">'
$endHtmlMarker = '      </div>'

$idxStart = $content.IndexOf($startHtmlMarker)
if ($idxStart -gt 0) {
    # Find the next </div> after $idxStart
    # Make sure we find the closing </div> of equipment-directory-matrix
    $idxEnd = $content.IndexOf('      </div>' + "`r`n`r`n    </div>`r`n  </section>", $idxStart)
    if ($idxEnd -lt 0) {
        $idxEnd = $content.IndexOf('      </div>' + "`n`n    </div>`n  </section>", $idxStart)
    }
    if ($idxEnd -lt 0) {
        # Search specifically for end of directory matrix
        $idxEnd = $content.IndexOf('      </div>', $idxStart + 500)
    }

    Write-Host "idxStart: $idxStart, idxEnd: $idxEnd"

    $newHtmlMatrix = @'
      <div class="equipment-directory-matrix">
        <!-- Asset 01: Water & Air-Cooled Chillers -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=600&q=80" alt="Water and Air Chillers" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Water &amp; Air Chillers</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Bearings</span>
              <span class="equipment-metric-chip">Delta-T</span>
              <span class="equipment-metric-chip">Lubrication</span>
            </div>
          </div>
        </article>

        <!-- Asset 02: Variable Refrigerant Flow (VRF) -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1621905251189-08b45d6a269e?auto=format&fit=crop&w=600&q=80" alt="Variable Refrigerant (VRF)" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Variable Refrigerant (VRF)</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Inverter</span>
              <span class="equipment-metric-chip">Voltage</span>
              <span class="equipment-metric-chip">Refrigerant</span>
            </div>
          </div>
        </article>

        <!-- Asset 03: Air Handling Units (AHU) -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=600&q=80" alt="Air Handling Units (AHU)" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Air Handling Units (AHU)</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Vibration</span>
              <span class="equipment-metric-chip">Airflow</span>
              <span class="equipment-metric-chip">Filtration</span>
            </div>
          </div>
        </article>

        <!-- Asset 04: Industrial Cooling Towers -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?auto=format&fit=crop&w=600&q=80" alt="Industrial Cooling Towers" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Industrial Cooling Towers</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Gearbox</span>
              <span class="equipment-metric-chip">Drives</span>
              <span class="equipment-metric-chip">Water</span>
            </div>
          </div>
        </article>

        <!-- Asset 05: Rooftop Packaged HVAC Units -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0?auto=format&fit=crop&w=600&q=80" alt="Rooftop Packaged Units" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Rooftop Packaged Units</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Compressor</span>
              <span class="equipment-metric-chip">Fans</span>
              <span class="equipment-metric-chip">Economizer</span>
            </div>
          </div>
        </article>

        <!-- Asset 06: Hydronic Pumping Stations -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581094288338-2314dddb7ece?auto=format&fit=crop&w=600&q=80" alt="Hydronic Pump Stations" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Hydronic Pump Stations</h3>
            <div class="equipment-metrics-list">
              <span class="equipment-metric-chip">Seals</span>
              <span class="equipment-metric-chip">Impeller</span>
              <span class="equipment-metric-chip">Cavitation</span>
            </div>
          </div>
        </article>
      </div>
'@

    $content = $content.Substring(0, $idxStart) + $newHtmlMatrix + $content.Substring($idxEnd + 12)
    Write-Host "Replaced HTML matrix successfully"
}

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Successfully updated $path"
