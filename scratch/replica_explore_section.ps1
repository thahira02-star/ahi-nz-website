$c_pred = [System.IO.File]::ReadAllText("final output/predictive-maintenance.html", [System.Text.Encoding]::UTF8)

# Extract CSS from predictive-maintenance:
$css_match = [regex]::Match($c_pred, '(?ms)\.section-other-services\s*\{.*?\.service-card-link\s*\{[^}]*\}')
$pred_css = $css_match.Value

# Extract HTML from predictive-maintenance:
$html_match = [regex]::Match($c_pred, '(?ms)<section class="section-other-services".*?</section>')
$pred_html = $html_match.Value

# -----------------
# 1. Update chiller-maintenance.html
# -----------------
$c_chil = [System.IO.File]::ReadAllText("final output/chiller-maintenance.html", [System.Text.Encoding]::UTF8)
$chil_css_match = [regex]::Match($c_chil, '(?ms)\.section-other-services\s*\{.*?\.service-card-link\s*\{[^}]*\}')
$chil_html_match = [regex]::Match($c_chil, '(?ms)<section class="section-other-services".*?</section>')

if ($chil_css_match.Success) {
    # Respect user mandate: padding: 50px 0 40px;
    $target_css = $pred_css.Replace("padding: 40px 0;", "padding: 50px 0 40px;")
    $c_chil = $c_chil.Replace($chil_css_match.Value, $target_css)
}
if ($chil_html_match.Success) {
    $c_chil = $c_chil.Replace($chil_html_match.Value, $pred_html)
}
[System.IO.File]::WriteAllText("final output/chiller-maintenance.html", $c_chil, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated chiller-maintenance.html"

# -----------------
# 2. Update preventative-maintenance.html
# -----------------
$c_prev = [System.IO.File]::ReadAllText("final output/preventative-maintenance.html", [System.Text.Encoding]::UTF8)

# Replace legacy .explore-cards-grid / .prev-sec section 5 in preventative-maintenance.html
$prev_old_section_match = [regex]::Match($c_prev, '(?ms)<section class="prev-sec"[^>]*aria-labelledby="sec5-title".*?</section>')
if ($prev_old_section_match.Success) {
    $c_prev = $c_prev.Replace($prev_old_section_match.Value, $pred_html)
    Write-Host "Replaced legacy explore section in preventative-maintenance.html"
} else {
    Write-Host "Could not find legacy explore section in preventative-maintenance.html"
}

# Update or insert CSS in preventative-maintenance.html
$prev_css_match = [regex]::Match($c_prev, '(?ms)\.section-other-services\s*\{.*?\.service-card-link\s*\{[^}]*\}')
$target_prev_css = $pred_css.Replace("padding: 40px 0;", "padding: 50px 0 40px;")

if ($prev_css_match.Success) {
    $c_prev = $c_prev.Replace($prev_css_match.Value, $target_prev_css)
    Write-Host "Updated existing .section-other-services CSS in preventative-maintenance.html"
} else {
    # If not present, append before </style>
    $c_prev = $c_prev.Replace("</style>", "$target_prev_css`r`n</style>")
    Write-Host "Appended .section-other-services CSS in preventative-maintenance.html"
}

[System.IO.File]::WriteAllText("final output/preventative-maintenance.html", $c_prev, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated preventative-maintenance.html"
