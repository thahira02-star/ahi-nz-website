$htmlIndex = Get-Content -Raw "final output\index.html"
$htmlPdm = Get-Content -Raw "final output\predictive-maintenance.html"

Write-Host "=== INDEX.HTML LEFT-ALIGNED CAPTIONS ==="
# 1. hero-subtitle
if ($htmlIndex -match '(?s)<p class="hero-subtitle">([^<]+)</p>') {
    Write-Host "hero-subtitle: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 2. importance-banner-desc
if ($htmlIndex -match '(?s)<p class="importance-banner-desc">([^<]+)</p>') {
    Write-Host "importance-banner-desc: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 3. form-panel-desc
if ($htmlIndex -match '(?s)<p class="form-panel-desc">([^<]+)</p>') {
    Write-Host "form-panel-desc: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}

Write-Host "`n=== PREDICTIVE-MAINTENANCE.HTML LEFT-ALIGNED CAPTIONS ==="
# 1. hero-subtitle
if ($htmlPdm -match '(?s)<p class="hero-subtitle">([^<]+)</p>') {
    Write-Host "hero-subtitle: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 2. pdm-savings-desc
if ($htmlPdm -match '(?s)<p class="pdm-savings-desc">([^<]+)</p>') {
    Write-Host "pdm-savings-desc: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 3. calm-ops-desc
if ($htmlPdm -match '(?s)<p class="calm-ops-desc">([^<]+)</p>') {
    Write-Host "calm-ops-desc: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 4. equipment-lead-text
if ($htmlPdm -match '(?s)<p class="equipment-lead-text">([^<]+)</p>') {
    Write-Host "equipment-lead-text: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 5. form-panel-desc
if ($htmlPdm -match '(?s)<p class="form-panel-desc">([^<]+)</p>') {
    Write-Host "form-panel-desc: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
# 6. other-services section-lead-text
if ($htmlPdm -match '(?s)<section class="section-other-services"[^>]*>.*?<p class="section-lead-text">([^<]+)</p>') {
    Write-Host "other-services lead-text: $($matches[1].Trim()) ($($matches[1].Trim().Length) chars)"
}
