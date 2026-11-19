$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

$oldMq = @"
    @media (max-width: 900px) {
      .hiw-master-panel {
        padding: 32px 24px;
      }
      .hiw-timeline-grid {
        grid-template-columns: 1fr;
        gap: 32px;
      }
      .how-it-works-desc {
        max-width: 100%;
      }
      .hiw-step-card {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
      }
      .hiw-step-badge {
        align-self: flex-start;
      }
    }
"@

$newMq = @"
    @media (max-width: 900px) {
      .hiw-master-panel {
        padding: 36px 28px;
      }
      .hiw-timeline-grid {
        grid-template-columns: 1fr;
        gap: 36px;
      }
      .how-it-works-desc {
        max-width: 100%;
      }
    }

    @media (max-width: 580px) {
      .hiw-master-panel {
        padding: 28px 18px;
      }
      .hiw-timeline-track {
        padding-left: 22px;
      }
      .hiw-timeline-track::before {
        left: 4px;
      }
      .hiw-card-wrapper::before {
        left: -22px;
        width: 12px;
        height: 12px;
      }
      .hiw-step-card {
        padding: 14px 16px;
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
      }
      .hiw-step-badge {
        align-self: flex-start;
      }
    }
"@

if ($content.Contains($oldMq)) {
    $content = $content.Replace($oldMq, $newMq)
    Write-Host "Replaced media queries for HIW."
} else {
    Write-Host "Warning: oldMq not matched exactly, trying regex"
    $content = [regex]::Replace($content, '(?s)@media \(max-width: 900px\) \{.*?\.hiw-step-badge \{\s*align-self: flex-start;\s*\}\s*\}', $newMq.Trim())
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
