$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$m_pred = [regex]::Match($c_pred, '(?ms)<section class="section-other-services".*?</section>')

# Check CSS in predictive-maintenance
$m_pred_css = [regex]::Match($c_pred, '(?ms)\.section-other-services\s*\{.*?\.service-card-link:hover\s*\{[^}]*\}')

Write-Host "Predictive HTML len:" $m_pred.Value.Length
Write-Host "Predictive CSS len:" $m_pred_css.Value.Length
Write-Host "--- HTML preview ---"
Write-Host $m_pred.Value.Substring(0, 300)
