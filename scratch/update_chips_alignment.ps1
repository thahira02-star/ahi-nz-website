$filePath = "final output/predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Update CSS
$oldCss = @"
    /* Wrapped Metric Chips Grid Layout: 2 chips on row 1, 1 chip on row 2 */
    .equipment-metrics-list {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      width: 100%;
      margin-top: auto;
    }
"@

$newCss = @"
    /* Wrapped Metric Chips Grid Layout: 2 chips on row 1, 1 chip on row 2 */
    .equipment-metrics-list {
      display: flex;
      flex-direction: column;
      gap: 6px;
      width: 100%;
      margin-top: auto;
    }

    .equipment-chips-row {
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      width: 100%;
    }
"@

# Normalize CRLF / LF for CSS replacement
if ($content.Contains($oldCss)) {
  $content = $content.Replace($oldCss, $newCss)
  Write-Host "Replaced CSS (CRLF)"
} else {
  $oldCssLf = $oldCss.Replace("`r`n", "`n")
  $newCssLf = $newCss.Replace("`r`n", "`n")
  if ($content.Contains($oldCssLf)) {
    $content = $content.Replace($oldCssLf, $newCssLf)
    Write-Host "Replaced CSS (LF)"
  } else {
    Write-Warning "Could not find oldCss in $filePath"
  }
}

# 2. Update HTML Matrix
$startMarker = "<div class=""equipment-directory-matrix"">"
$endMarker = "<!-- ==========================================================================`r`n       SECTION 08"
if (-not $content.Contains($endMarker)) {
  $endMarker = "<!-- ==========================================================================`n       SECTION 08"
}

$newMatrix = @"
<div class="equipment-directory-matrix">
        <!-- Asset 01: Water & Air-Cooled Chillers -->
        <article class="equipment-dir-item">
          <div class="equipment-photo-frame">
            <img src="https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=600&q=80" alt="Water and Air Chillers" class="equipment-machinery-img" loading="lazy">
          </div>
          <div class="equipment-item-body">
            <h3 class="equipment-item-title">Water &amp; Air Chillers</h3>
            <div class="equipment-metrics-list">
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Bearings</span>
                <span class="equipment-metric-chip">Delta-T</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Lubrication</span>
              </div>
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
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Inverter</span>
                <span class="equipment-metric-chip">Voltage</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Refrigerant</span>
              </div>
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
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Vibration</span>
                <span class="equipment-metric-chip">Airflow</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Filtration</span>
              </div>
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
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Gearbox</span>
                <span class="equipment-metric-chip">Drives</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Water</span>
              </div>
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
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Compressor</span>
                <span class="equipment-metric-chip">Fans</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Economizer</span>
              </div>
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
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Seals</span>
                <span class="equipment-metric-chip">Impeller</span>
              </div>
              <div class="equipment-chips-row">
                <span class="equipment-metric-chip">Cavitation</span>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>


  
"@

$idxStart = $content.IndexOf($startMarker)
$idxEnd = $content.IndexOf($endMarker, $idxStart)

if ($idxStart -ge 0 -and $idxEnd -gt $idxStart) {
  $content = $content.Substring(0, $idxStart) + $newMatrix.Trim() + "`r`n`r`n  " + $content.Substring($idxEnd)
  Write-Host "Replaced Matrix HTML at $idxStart to $idxEnd"
} else {
  Write-Error "Could not locate Matrix HTML markers! idxStart=$idxStart, idxEnd=$idxEnd"
  exit 1
}

[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Successfully written $filePath"

# 3. Synchronize to root predictive-maintenance.html
[System.IO.File]::WriteAllBytes("predictive-maintenance.html", [System.IO.File]::ReadAllBytes($filePath))
Write-Host "Synchronized to root predictive-maintenance.html"
