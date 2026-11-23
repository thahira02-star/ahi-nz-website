$c_chiller = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$m_chiller = [regex]::Match($c_chiller, '(?ms)<section class="section-form-wrapper".*?</section>')
$chiller_form = $m_chiller.Value

$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)
$m_prev = [regex]::Match($c_prev, '(?ms)<section class="section-form-wrapper".*?</section>')
$prev_form = $m_prev.Value

Write-Host "Chiller vs Preventative form identical:" ($chiller_form -eq $prev_form)
