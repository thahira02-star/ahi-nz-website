$path = "final output\index.html"
$c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$dupComment = @"
  <!-- ==========================================================================
       SECTION 04 · HOW IT WORKS (LIGHT THEME)
       Spacing: Exactly 40px vertical spacing
       Reference: Simple Process / How it works (Image 3)
       ========================================================================== -->
"@

if ($c.Contains($dupComment)) {
    $c = $c.Replace($dupComment + "`r`n", "")
    Write-Host "Removed duplicate comment"
} else {
    $c = [regex]::Replace($c, '<!-- =+?\s+SECTION 04 · HOW IT WORKS \(LIGHT THEME\)\s+Spacing: Exactly 40px vertical spacing\s+Reference: Simple Process / How it works \(Image 3\)\s+=+? -->\s*', '')
    Write-Host "Removed duplicate comment via regex"
}

[System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Synced to index.html"
