$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

$oldHeading = '<h2 id="reasons-heading" class="reasons-trust-title">Why AHI Carrier?</h2>'
$newHeading = '<h2 id="reasons-heading" class="reasons-trust-title">What Sets AHI Carrier Apart</h2>'

if ($content.Contains($oldHeading)) {
    $content = $content.Replace($oldHeading, $newHeading)
    Write-Host "Updated heading to 'What Sets AHI Carrier Apart'"
} else {
    Write-Host "Error: oldHeading not found!"
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
