foreach ($file in @("index.html", "predictive-maintenance.html")) {
  $path = (Resolve-Path $file).Path
  $txt = [System.IO.File]::ReadAllText($path)

  $txt = $txt -replace '(?s)\.top-utility-bar\s*\{[^}]*\}', @'
.top-utility-bar {
      background-color: #163865;
      height: 54px;
      width: 100%;
      color: #FFFFFF;
      font-size: 14px;
      display: flex;
      align-items: center;
      position: relative;
      z-index: 50;
      font-family: 'Montserrat', sans-serif;
    }
'@

  $txt = $txt -replace '(?s)\.utility-left-cluster\s*\{[^}]*\}', @'
.utility-left-cluster {
      display: flex;
      align-items: center;
      gap: 22px;
    }
'@

  $txt = $txt -replace '(?s)\.utility-link\s*\{[^}]*\}', @'
.utility-link {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      color: #FFFFFF;
      font-weight: 400;
      font-size: 14px;
      text-decoration: none;
      white-space: nowrap;
      transition: opacity 0.15s ease;
    }
'@

  if ($txt -notmatch '\.utility-divider\s*\{') {
    $txt = $txt -replace '(\.utility-link:hover\s*\{[^}]*\})', "`$1`r`n`r`n    .utility-divider {`r`n      width: 1px;`r`n      height: 14px;`r`n      background-color: rgba(255, 255, 255, 0.25);`r`n    }"
  }

  $txt = $txt -replace '(?s)\.utility-right-cluster\s*\{[^}]*\}', @'
.utility-right-cluster {
      display: flex;
      align-items: center;
      gap: 20px;
    }
'@

  $txt = $txt -replace '(?s)\.utility-contact-item\.phone\s*\{[^}]*\}', @'
.utility-contact-item.phone {
      font-weight: 500;
    }
'@

  $txt = $txt -replace '(?s)\.nav-menu-link\s*\{[^}]*\}', @'
.nav-menu-link {
      font-size: 15px;
      font-weight: 500;
      color: #393a3b;
      position: relative;
      padding: 10px 0;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      cursor: pointer;
      text-decoration: none;
    }
'@

  $txt = $txt -replace '(?s)\.nav-cta-btn\s*\{[^}]*\}', @'
.nav-cta-btn {
      background-color: var(--ahi-navy-primary);
      color: var(--ahi-white);
      font-size: 14px;
      font-weight: 600;
      height: 44px;
      padding: 0 24px;
      border-radius: var(--radius-sm);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      transition: background-color 0.18s ease;
    }
'@

  [System.IO.File]::WriteAllText($path, $txt, (New-Object System.Text.UTF8Encoding($false)))
  Write-Output "Synced $file navbar CSS"
}
