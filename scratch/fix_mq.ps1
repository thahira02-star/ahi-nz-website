$path = "final output\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$targetStart = "      .importance-banner {"
$pos = $content.IndexOf($targetStart)
if ($pos -ge 0) {
    # Find the closing brace of .importance-banner-content
    $contentBlockTarget = ".importance-banner-content {"
    $contentBlockPos = $content.IndexOf($contentBlockTarget, $pos)
    $closingBracePos = $content.IndexOf("}", $contentBlockPos) + 1
    
    $oldBlock = $content.Substring($pos, $closingBracePos - $pos)
    Write-Host "Found old block:`n$oldBlock"
    
    $newBlock = @"
      .dispatch-banner-grid {
        grid-template-columns: 1fr;
        gap: 28px;
      }
      .dispatch-banner-media {
        height: 250px;
      }
      .dispatch-banner-heading {
        font-size: 24px;
      }
"@
    $content = $content.Substring(0, $pos) + $newBlock + $content.Substring($closingBracePos)
    [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Replaced successfully."
    Copy-Item "final output\index.html" "index.html" -Force
    Write-Host "Mirrored to index.html."
} else {
    Write-Host "Target not found."
}
