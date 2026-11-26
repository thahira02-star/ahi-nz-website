$c = Get-Content chiller-maintenance.html -Raw
$i = Get-Content index.html -Raw
$p = Get-Content preventative-maintenance.html -Raw

$rxHtml = '(?s)<header class="top-utility-bar".*?</nav>'
$ch = ([regex]::Match($c, $rxHtml).Value -replace '\s+', ' ').Trim()
$ih = ([regex]::Match($i, $rxHtml).Value -replace '\s+', ' ').Trim()
$ph = ([regex]::Match($p, $rxHtml).Value -replace '\s+', ' ').Trim()

Write-Output "HTML C==I: $($ch -eq $ih)"
Write-Output "HTML C==P: $($ch -eq $ph)"

$rxCss = '(?s)/\* =+\s*S0.*?(?=/\* =+\s*SECTION)'
$cc = ([regex]::Match($c, $rxCss).Value -replace '\s+', ' ').Trim()
$ic = ([regex]::Match($i, $rxCss).Value -replace '\s+', ' ').Trim()
$pc = ([regex]::Match($p, $rxCss).Value -replace '\s+', ' ').Trim()
Write-Output "CSS len C=$($cc.Length) I=$($ic.Length) P=$($pc.Length)"

# Compare individual CSS rules between C, I, P
foreach ($name in @('.top-utility-bar', '.utility-left-cluster', '.utility-link', '.utility-right-cluster', '.utility-contact-item', '.main-navigation-bar', '.nav-inner', '.brand-logo-img', '.nav-links-menu', '.nav-menu-link', '.nav-cta-btn', '.nav-actions-cluster', '.nav-whatsapp-btn')) {
  $pattern = [regex]::Escape($name) + '\s*\{[^}]*\}'
  $mc = ([regex]::Match($c, $pattern).Value -replace '\s+', ' ')
  $mi = ([regex]::Match($i, $pattern).Value -replace '\s+', ' ')
  $mp = ([regex]::Match($p, $pattern).Value -replace '\s+', ' ')
  if ($mc -ne $mi -or $mc -ne $mp) {
    Write-Output "DIFF $name :"
    if ($mc -ne $mi) { Write-Output "  I: $mi" }
    if ($mc -ne $mp) { Write-Output "  P: $mp" }
    Write-Output "  C: $mc"
  }
}
