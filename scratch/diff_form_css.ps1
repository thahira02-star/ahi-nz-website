$c_chil = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

$m_c = [regex]::Match($c_chil, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')
$m_v = [regex]::Match($c_prev, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')

$chil_css = $m_c.Value
$prev_css = $m_v.Value

for ($i = 0; $i -lt [Math]::Min($chil_css.Length, $prev_css.Length); $i++) {
    if ($chil_css[$i] -ne $prev_css[$i]) {
        Write-Host "Difference at index $i"
        Write-Host "Chil:" $chil_css.Substring([Math]::Max(0, $i - 30), 60)
        Write-Host "Prev:" $prev_css.Substring([Math]::Max(0, $i - 30), 60)
        break
    }
}
