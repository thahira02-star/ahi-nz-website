$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$m_pred = [regex]::Match($c_pred, '(?ms)<section class="section-form-wrapper".*?</section>')
$pred_form = $m_pred.Value

$c_chiller = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$m_chiller = [regex]::Match($c_chiller, '(?ms)<section class="section-form-wrapper".*?</section>')
$chiller_form = $m_chiller.Value

$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)
$m_prev = [regex]::Match($c_prev, '(?ms)<section class="section-form-wrapper".*?</section>')
$prev_form = $m_prev.Value

Write-Host "Predictive len:" $pred_form.Length
Write-Host "Chiller len:" $chiller_form.Length
Write-Host "Preventative len:" $prev_form.Length
Write-Host "Predictive == Chiller?" ($pred_form -eq $chiller_form)
Write-Host "Predictive == Preventative?" ($pred_form -eq $prev_form)

if ($pred_form -ne $chiller_form) {
    # Check differences
    Write-Host "Chiller difference found"
}
if ($pred_form -ne $prev_form) {
    Write-Host "Preventative difference found"
}
