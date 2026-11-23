$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$m_pred = [regex]::Match($c_pred, '(?ms)<section class="section-form-wrapper".*?</section>')
$pred_form = $m_pred.Value

$c_chiller = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$m_chiller = [regex]::Match($c_chiller, '(?ms)<section class="section-form-wrapper".*?</section>')
$chiller_form = $m_chiller.Value

# Normalize id="request-repair" to id="request-service"
$pred_norm = $pred_form.Replace('id="request-repair"', 'id="request-service"')

Write-Host "Normalized comparison (Pred vs Chiller):" ($pred_norm -eq $chiller_form)
if ($pred_norm -ne $chiller_form) {
    for ($i = 0; $i -lt [Math]::Min($pred_norm.Length, $chiller_form.Length); $i++) {
        if ($pred_norm[$i] -ne $chiller_form[$i]) {
            Write-Host "Difference at char $i"
            Write-Host "Pred: " $pred_norm.Substring([Math]::Max(0, $i - 20), 40)
            Write-Host "Chil: " $chiller_form.Substring([Math]::Max(0, $i - 20), 40)
            break
        }
    }
}
