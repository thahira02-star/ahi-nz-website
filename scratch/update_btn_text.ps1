$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

$oldBtn = @"
          <a href="#request-repair" class="btn-enquire-now">
            <span>Enquire Now</span>
            <span aria-hidden="true">→</span>
          </a>
"@

$newBtn = @"
          <a href="#request-repair" class="btn-enquire-now">
            <span>Download Brochure</span>
            <span aria-hidden="true">→</span>
          </a>
"@

if ($content.Contains($oldBtn)) {
    $content = $content.Replace($oldBtn, $newBtn)
    Write-Host "Replaced button text to Download Brochure"
} else {
    $content = [regex]::Replace($content, '(<a href="#request-repair" class="btn-enquire-now">\s*<span>)Enquire Now(</span>)', '${1}Download Brochure${2}')
    Write-Host "Replaced button text via regex"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
