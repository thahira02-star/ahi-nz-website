$path = "aislop.md"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$startToken = "## 5. The 5 Locked Core Components (Master Reference Protection)"
$endToken = "## 6. Blueprint for New Service Pages"

$startIdx = $content.IndexOf($startToken)
$endIdx = $content.IndexOf($endToken)

if ($startIdx -lt 0 -or $endIdx -lt 0) {
    throw "Tokens not found in $path"
}

$replacement = [System.IO.File]::ReadAllText("scratch\section5_replacement.md", [System.Text.Encoding]::UTF8)

# Strip leading dashes and newlines from replacement if any
$replacement = $replacement.Trim() + "`r`n`r`n"

$newContent = $content.Substring(0, $startIdx) + $replacement + $content.Substring($endIdx)
[System.IO.File]::WriteAllText($path, $newContent, [System.Text.Encoding]::UTF8)

Write-Output "Successfully updated aislop.md with Global Consistency & Service Page Design Rules!"

