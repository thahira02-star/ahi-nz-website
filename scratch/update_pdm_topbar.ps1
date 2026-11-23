$topBarRepl = @"
  <header class="top-utility-bar" role="region" aria-label="Utility Header">
    <div class="container top-utility-inner">
      <div class="utility-left-cluster">
        <a href="#global" class="utility-link" aria-label="Switch to Global website">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <circle cx="12" cy="12" r="10"></circle>
            <line x1="2" y1="12" x2="22" y2="12"></line>
            <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
          </svg>
          <span>Switch to Global</span>
        </a>
        <div class="utility-divider" aria-hidden="true"></div>
        <a href="#where-to-buy" class="utility-link">Where to Buy</a>
        
        <form class="utility-search-container" role="search" onsubmit="event.preventDefault();">
          <label for="utility-search" class="sr-only">Search Products</label>
          <input type="search" id="utility-search" class="utility-search-input" placeholder="Find Products..." aria-label="Search Products">
          <button type="submit" class="utility-search-btn" aria-label="Submit search">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <circle cx="11" cy="11" r="8"></circle>
              <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
          </button>
        </form>
      </div>

      <div class="utility-right-cluster">
        <a href="mailto:customer.services@ahi-carrier.co.nz" class="utility-contact-item">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
            <polyline points="22,6 12,13 2,6"></polyline>
          </svg>
          <span>customer.services@ahi-carrier.co.nz</span>
        </a>

        <a href="tel:093556720" class="utility-contact-item phone">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
          </svg>
          <span>09 355 6720</span>
        </a>

        <div class="utility-social-links" aria-label="Social media links">
          <a href="#facebook" class="utility-social-icon" aria-label="Follow us on Facebook">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
          </a>
          <a href="#youtube" class="utility-social-icon" aria-label="Follow us on YouTube">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"></path><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02" fill="#163865"></polygon></svg>
          </a>
          <a href="#linkedin" class="utility-social-icon" aria-label="Follow us on LinkedIn">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"></path><rect x="2" y="9" width="4" height="12"></rect><circle cx="4" cy="4" r="2"></circle></svg>
          </a>
        </div>
      </div>
    </div>
  </header>
"@

$files = @("final output/predictive-maintenance.html", "predictive-maintenance.html")

foreach ($f in $files) {
  $content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
  $startMarker = "<header class=""top-utility-bar"""
  $endMarker = "</header>"
  
  $idxStart = $content.IndexOf($startMarker)
  if ($idxStart -ge 0) {
    $idxEnd = $content.IndexOf($endMarker, $idxStart) + $endMarker.Length
    $content = $content.Substring(0, $idxStart) + $topBarRepl.Trim() + $content.Substring($idxEnd)
    [System.IO.File]::WriteAllText($f, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated top-utility-bar in $f"
  } else {
    Write-Warning "Could not find startMarker in $f"
  }
}
