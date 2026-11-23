$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$c_chil = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

$m_p = [regex]::Match($c_pred, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')
$m_c = [regex]::Match($c_chil, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')
$m_v = [regex]::Match($c_prev, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')

Write-Host "Pred CSS len:" $m_p.Value.Length
Write-Host "Chil CSS len:" $m_c.Value.Length
Write-Host "Prev CSS len:" $m_v.Value.Length
Write-Host "Pred == Chil?" ($m_p.Value -eq $m_c.Value)
Write-Host "Chil == Prev?" ($m_c.Value -eq $m_v.Value)
