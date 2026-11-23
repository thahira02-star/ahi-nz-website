$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)
$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

$m_p = [regex]::Match($c_pred, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')
$m_v = [regex]::Match($c_prev, '(?ms)\.form-master-card\s*\{.*?\.btn-form-submit:hover\s*\{[^}]*\}')

if ($m_p.Success -and $m_v.Success) {
    $c_prev = $c_prev.Replace($m_v.Value, $m_p.Value)
    [System.IO.File]::WriteAllText("final output/preventative-maintenance.html", $c_prev, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "Replaced CSS in preventative-maintenance.html"
} else {
    Write-Host "Failed to find CSS block match"
}
