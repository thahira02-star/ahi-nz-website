$indexPath = "final output\index.html"
$content = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# Update .what-is-grid and .what-is-photo-wrapper
$oldGridBlock = @"
    .what-is-grid {
      display: grid;
      grid-template-columns: 480px 1fr;
      gap: 56px;
      align-items: center;
    }

    .what-is-photo-wrapper {
      width: 480px;
      max-width: 100%;
      border-radius: 5px;
      overflow: hidden;
      box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.08), 0 8px 10px -6px rgba(0, 0, 0, 0.05);
      border: 1px solid var(--ahi-border-light);
    }

    .what-is-photo-wrapper img {
      width: 100%;
      height: 420px;
      object-fit: cover;
      display: block;
    }
"@

$newGridBlock = @"
    .what-is-grid {
      display: grid;
      grid-template-columns: 560px 1fr;
      gap: 48px;
      align-items: center;
    }

    .what-is-photo-wrapper {
      width: 100%;
      border-radius: 6px;
      overflow: hidden;
      box-shadow: 0 12px 28px -6px rgba(16, 47, 88, 0.1), 0 4px 10px -2px rgba(16, 47, 88, 0.05);
      border: 1px solid var(--ahi-border-light);
    }

    .what-is-photo-wrapper img {
      width: 100%;
      height: 445px;
      object-fit: cover;
      display: block;
      transition: transform 0.4s ease;
    }

    .what-is-photo-wrapper:hover img {
      transform: scale(1.02);
    }
"@

if ($content.Contains($oldGridBlock)) {
    $content = $content.Replace($oldGridBlock, $newGridBlock)
    Write-Host "Replaced what-is-grid and photo styles exactly."
} else {
    Write-Host "Warning: Exact block not matched, using regex"
    $content = [regex]::Replace($content, '(\.what-is-grid\s*\{[^}]*?grid-template-columns:\s*)[^;]+;', '${1}560px 1fr;')
    $content = [regex]::Replace($content, '(\.what-is-grid\s*\{[^}]*?gap:\s*)[^;]+;', '${1}48px;')
    $content = [regex]::Replace($content, '(\.what-is-photo-wrapper\s*\{[^}]*?width:\s*)[^;]+;', '${1}100%;')
    $content = [regex]::Replace($content, '(\.what-is-photo-wrapper img\s*\{[^}]*?height:\s*)[^;]+;', '${1}445px;')
}

[System.IO.File]::WriteAllText($indexPath, $content, [System.Text.Encoding]::UTF8)
Copy-Item "final output\index.html" "index.html" -Force
Write-Host "Saved final output\index.html and mirrored to index.html"
