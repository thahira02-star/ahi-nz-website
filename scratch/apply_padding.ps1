$chiller = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)

# Chiller Maintenance Section Paddings: 50px top, 40px bottom
$chiller = $chiller.Replace("padding: 48px 0 68px;", "padding: 50px 0 40px;")
$chiller = $chiller.Replace("padding: 48px 0 64px;", "padding: 50px 0 40px;")
$chiller = $chiller.Replace("padding: 48px 0 80px;", "padding: 50px 0 40px;")
$chiller = $chiller.Replace("padding: 48px 0 40px;", "padding: 50px 0 40px;")
$chiller = $chiller.Replace("padding: 48px 0 62px;", "padding: 50px 0 40px;")
# In form wrapper:
$chiller = $chiller.Replace("padding: 40px 0;", "padding: 50px 0 40px;")

[System.IO.File]::WriteAllText("final output/chiller-maintenance.html", $chiller, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated chiller-maintenance.html"

$prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

# Preventative Maintenance Section Paddings: 50px top, 40px bottom
# .care-replica-sec:
$prev = $prev.Replace("padding-top: 48px !important;`r`n        padding-bottom: 56px;", "padding-top: 50px !important;`r`n        padding-bottom: 40px;")
$prev = $prev.Replace("padding-top: 48px !important;`n        padding-bottom: 56px;", "padding-top: 50px !important;`n        padding-bottom: 40px;")

# .equip-maintained-sec:
$prev = $prev.Replace("padding-top: 48px !important;`r`n        padding-bottom: 64px;", "padding-top: 50px !important;`r`n        padding-bottom: 40px;")
$prev = $prev.Replace("padding-top: 48px !important;`n        padding-bottom: 64px;", "padding-top: 50px !important;`n        padding-bottom: 40px;")

# .pillar-sec:
$prev = $prev.Replace("padding: 72px 0 80px 0;", "padding: 50px 0 40px 0;")

# .sec-agreement-options:
$prev = $prev.Replace("padding: 72px 0 88px 0;", "padding: 50px 0 40px 0;")

# .prev-sec:
$prev = $prev.Replace("padding: 80px 0;", "padding: 50px 0 40px 0;")

# .section-industries / .section-industry-focus:
$prev = $prev.Replace(".section-industries {`r`n      background-color: var(--ahi-neutral-bg);`r`n      padding: 40px 0;", ".section-industries, .section-industry-focus {`r`n      background-color: var(--ahi-neutral-bg);`r`n      padding: 50px 0 40px 0;")
$prev = $prev.Replace(".section-industries {`n      background-color: var(--ahi-neutral-bg);`n      padding: 40px 0;", ".section-industries, .section-industry-focus {`n      background-color: var(--ahi-neutral-bg);`n      padding: 50px 0 40px 0;")

# form wrapper:
$prev = $prev.Replace("/* SECTION 07 &middot; REQUEST SERVICE ENQUIRY FORM`r`n       Spacing: Exactly 40px vertical spacing`r`n       ========================================================================== */`r`n    .section-form-wrapper {`r`n      background-color: var(--ahi-neutral-bg);`r`n      padding: 40px 0;", "/* SECTION 07 &middot; REQUEST SERVICE ENQUIRY FORM`r`n       Spacing: 50px top, 40px bottom`r`n       ========================================================================== */`r`n    .section-form-wrapper {`r`n      background-color: var(--ahi-neutral-bg);`r`n      padding: 50px 0 40px 0;")
$prev = $prev.Replace("/* SECTION 07 &middot; REQUEST SERVICE ENQUIRY FORM`n       Spacing: Exactly 40px vertical spacing`n       ========================================================================== */`n    .section-form-wrapper {`n      background-color: var(--ahi-neutral-bg);`n      padding: 40px 0;", "/* SECTION 07 &middot; REQUEST SERVICE ENQUIRY FORM`n       Spacing: 50px top, 40px bottom`n       ========================================================================== */`n    .section-form-wrapper {`n      background-color: var(--ahi-neutral-bg);`n      padding: 50px 0 40px 0;")

[System.IO.File]::WriteAllText("final output/preventative-maintenance.html", $prev, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated preventative-maintenance.html"
