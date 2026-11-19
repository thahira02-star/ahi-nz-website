$arrowMoji = [string][char]0x00E2 + [string][char]0x2020 + [string][char]0x2019
Write-Host "Constructed arrowMoji: $arrowMoji"

$path = "final output\predictive-maintenance.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$hasArrow = $content.Contains($arrowMoji)
Write-Host "Contains arrowMoji: $hasArrow"
