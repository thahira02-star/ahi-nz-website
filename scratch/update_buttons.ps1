$path = "final output\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update button CSS
$oldBtnCSS = @"
    .btn-hero-primary {
      background-color: var(--ahi-white);
      color: var(--ahi-navy-primary);
      font-size: 14px;
      font-weight: 600;
      height: 44px;
      padding: 0 26px;
      border-radius: var(--radius-sm);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 2px 8px rgba(0,0,0,0.18);
      transition: all 0.2s ease;
    }

    .btn-hero-primary:hover {
      background-color: #f1f5f9;
      transform: translateY(-1px);
    }

    .btn-hero-outline {
      background: transparent;
      color: var(--ahi-white);
      font-size: 14px;
      font-weight: 600;
      height: 44px;
      padding: 0 22px;
      border-radius: var(--radius-sm);
      border: 1px solid rgba(255, 255, 255, 0.6);
      display: inline-flex;
      align-items: center;
      gap: 10px;
    }

    .btn-hero-outline:hover {
      background: rgba(255, 255, 255, 0.12);
      border-color: var(--ahi-white);
    }
"@

$newBtnCSS = @"
    .btn-hero-primary {
      background-color: var(--ahi-white);
      color: #163865;
      font-family: 'Montserrat', sans-serif;
      font-size: 14.5px;
      font-weight: 600;
      height: 46px;
      padding: 0 26px;
      border-radius: var(--radius-sm);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      box-shadow: 0 4px 14px rgba(0, 0, 0, 0.14);
      transition: all 0.2s ease;
      text-decoration: none;
    }

    .btn-hero-primary:hover {
      background-color: #f1f5f9;
      transform: translateY(-1px);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
      color: #163865;
    }

    .btn-hero-secondary {
      background: rgba(255, 255, 255, 0.14);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.35);
      color: #FFFFFF;
      font-family: 'Montserrat', sans-serif;
      font-size: 14.5px;
      font-weight: 600;
      height: 46px;
      padding: 0 26px;
      border-radius: var(--radius-sm);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      text-decoration: none;
      transition: all 0.2s ease;
    }

    .btn-hero-secondary:hover {
      background: rgba(255, 255, 255, 0.25);
      border-color: rgba(255, 255, 255, 0.65);
      color: #FFFFFF;
      transform: translateY(-1px);
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.18);
    }
"@

# Normalize CRLF for replacement
$normContent = $content.Replace("`r`n", "`n")
$normOld = $oldBtnCSS.Replace("`r`n", "`n")
$normNew = $newBtnCSS.Replace("`r`n", "`n")

if ($normContent.Contains($normOld)) {
    $normContent = $normContent.Replace($normOld, $normNew)
    Write-Host "Replaced Button CSS"
} else {
    Write-Host "Warning: Could not match exact old Button CSS"
}

# 2. Update Hero Button Cluster HTML
$oldCluster = @"
        <div class="hero-button-cluster">
          <a href="#request-repair" class="btn-hero-primary">Request a Service</a>
        </div>
"@

$newCluster = @"
        <div class="hero-button-cluster">
          <a href="#request-repair" class="btn-hero-primary">Request a Service</a>
          <a href="#request-repair" class="btn-hero-secondary">Get Free Consultation</a>
        </div>
"@

$normOldCluster = $oldCluster.Replace("`r`n", "`n")
$normNewCluster = $newCluster.Replace("`r`n", "`n")

if ($normContent.Contains($normOldCluster)) {
    $normContent = $normContent.Replace($normOldCluster, $normNewCluster)
    Write-Host "Replaced Button Cluster HTML"
} else {
    Write-Host "Warning: Could not match exact Button Cluster HTML"
}

$content = $normContent.Replace("`n", "`r`n")
[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Saved final output\index.html"
