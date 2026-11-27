$c = Get-Content chiller-maintenance.html -Raw
$i = Get-Content index.html -Raw
$d = Get-Content predictive-maintenance.html -Raw

$rxHtml = '(?s)<header class="top-utility-bar".*?</nav>'
$ch = ([regex]::Match($c, $rxHtml).Value -replace '\s+', ' ').Trim()
$ih = ([regex]::Match($i, $rxHtml).Value -replace '\s+', ' ').Trim()
$dh = ([regex]::Match($d, $rxHtml).Value -replace '\s+', ' ').Trim()

Write-Output "HTML C==I: $($ch -eq $ih)"
Write-Output "HTML C==D: $($ch -eq $dh)"

$rxCss = '(?s)/\* =+\s*S0.*?(?=/\* =+\s*S2|/\* =+\s*SECTION)'
$cc = ([regex]::Match($c, $rxCss).Value -replace '\s+', ' ').Trim()
$ic = ([regex]::Match($i, $rxCss).Value -replace '\s+', ' ').Trim()
$dc = ([regex]::Match($d, $rxCss).Value -replace '\s+', ' ').Trim()
Write-Output "CSS len C=$($cc.Length) I=$($ic.Length) D=$($dc.Length)"

foreach ($name in @('.top-utility-bar', '.utility-left-cluster', '.utility-link', '.utility-divider', '.utility-right-cluster', '.utility-contact-item', '.utility-contact-item.phone', '.main-navigation-bar', '.nav-inner', '.brand-logo-img', '.nav-links-menu', '.nav-menu-link', '.nav-cta-btn', '.nav-actions-cluster', '.nav-whatsapp-btn')) {
  $pattern = [regex]::Escape($name) + '\s*\{[^}]*\}'
  $mc = ([regex]::Match($c, $pattern).Value -replace '\s+', ' ')
  $mi = ([regex]::Match($i, $pattern).Value -replace '\s+', ' ')
  $md = ([regex]::Match($d, $pattern).Value -replace '\s+', ' ')
  if ($mc -ne $mi -or $mc -ne $md) {
    Write-Output "DIFF $name :"
    if ($mc -ne $mi) { Write-Output "  I: $mi" }
    if ($mc -ne $md) { Write-Output "  D: $md" }
    Write-Output "  C: $mc"
  }
}
