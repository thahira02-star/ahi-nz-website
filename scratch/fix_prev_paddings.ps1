$prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

# Replace care-replica-sec padding
$prev = $prev.Replace("padding-top: 48px !important;`r`n      padding-bottom: 56px;", "padding-top: 50px !important;`r`n      padding-bottom: 40px;")
$prev = $prev.Replace("padding-top: 48px !important;`n      padding-bottom: 56px;", "padding-top: 50px !important;`n      padding-bottom: 40px;")

# Replace equip-maintained-sec padding
$prev = $prev.Replace("padding-top: 48px !important;`r`n      padding-bottom: 64px;", "padding-top: 50px !important;`r`n      padding-bottom: 40px;")
$prev = $prev.Replace("padding-top: 48px !important;`n      padding-bottom: 64px;", "padding-top: 50px !important;`n      padding-bottom: 40px;")

# Replace section-form-wrapper padding in preventative-maintenance.html
$prev = $prev.Replace(".section-form-wrapper {`r`n      padding: 40px 0;", ".section-form-wrapper {`r`n      padding: 50px 0 40px 0;")
$prev = $prev.Replace(".section-form-wrapper {`n      padding: 40px 0;", ".section-form-wrapper {`n      padding: 50px 0 40px 0;")

[System.IO.File]::WriteAllText("final output/preventative-maintenance.html", $prev, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated preventative-maintenance.html padding"
