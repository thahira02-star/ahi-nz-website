$responsiveCss = @'
    /* ==========================================================================
       AHI RESPONSIVE OVERRIDES (ISOLATED <= 1180PX — 1536PX DESKTOP UNCHANGED)
       ========================================================================== */
    @media (max-width: 1180px) {
      .container {
        padding-left: 32px;
        padding-right: 32px;
      }
      .utility-left-cluster,
      .utility-right-cluster {
        gap: 12px;
      }
      .utility-search-container {
        width: clamp(150px, 19vw, 230px);
        margin-left: 2px;
      }
      .nav-links-menu {
        gap: 22px;
      }
      .commercial-mega-menu {
        left: 24px;
        right: 24px;
        width: auto;
      }
      .what-is-grid {
        grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
        gap: 32px;
      }
      .what-is-list-text {
        white-space: normal;
      }
      .planned-carousel-viewport,
      .carousel-viewport,
      .equip-maintained-sec {
        overflow: hidden;
      }
    }

    @media (max-width: 960px) {
      html, body {
        overflow-x: clip;
      }
      .top-utility-bar {
        display: none !important;
      }
      .main-navigation-bar {
        height: 76px;
      }
      .brand-logo-img {
        width: 62px !important;
        height: 62px !important;
        max-height: 62px !important;
      }
      .nav-links-menu,
      .nav-menu-list,
      .nav-cta-btn,
      .nav-actions-cluster,
      .nav-whatsapp-btn,
      .hero-eyebrow-nav,
      .commercial-mega-menu {
        display: none !important;
      }
      .nav-actions-cluster {
        gap: 12px;
      }
      .mobile-menu-trigger {
        display: inline-flex !important;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 6px;
        border: 1px solid #E2E8F0;
        background: #FFFFFF;
        color: #163865;
        cursor: pointer;
      }
      .hero-section {
        height: auto;
        min-height: 440px;
        padding: 48px 0;
      }
      .hero-grid-2col {
        grid-template-columns: 1fr;
        gap: 28px;
      }
      .what-is-grid,
      .partnership-grid-2col,
      .why-maintain-grid-2col,
      .case-study-main-grid,
      .form-master-card,
      .split-banner-card,
      .importance-banner,
      .industry-detail-card,
      .dashboard-split-layout {
        grid-template-columns: 1fr !important;
        height: auto !important;
        min-height: auto !important;
        max-height: none !important;
      }
      .what-is-photo-wrapper {
        max-width: 100%;
      }
      .what-is-photo-wrapper img,
      .partnership-photo {
        height: 320px;
      }
      .split-banner-wrap {
        width: 100%;
        left: auto;
        right: auto;
        margin-left: 0;
        margin-right: 0;
      }
      .split-banner-media {
        min-height: 240px;
        height: 260px;
      }
      .split-banner-content {
        padding: 36px 32px !important;
        min-height: auto;
        height: auto;
      }
      .split-banner-title {
        white-space: normal;
        font-size: 24px;
      }
      .services-grid-4col,
      .confidence-grid-8col,
      .pdm-savings-grid,
      .metrics-grid-4col,
      .pdm-process-grid,
      .process-stepper-grid,
      .calm-ops-grid,
      .emergencies-grid-6col,
      .industries-grid-6col {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 20px;
        align-items: stretch !important;
      }
      .calm-hero-card,
      .calm-card {
        height: 100%;
        box-sizing: border-box;
      }
      .calm-hero-card {
        grid-column: span 1 !important;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        padding: 28px 24px;
      }
      .calm-ops-grid > .calm-card:nth-child(2) {
        grid-column: span 1 !important;
      }
      .how-it-works-process {
        grid-template-columns: 1fr;
        gap: 28px;
      }
      .how-it-works-process::before,
      .process-stepper-track,
      .pdm-process-connector-line {
        display: none;
      }
      .reasons-grid-3col,
      .offering-plans-grid,
      .process-stages-grid,
      .partnership-cards-3row {
        grid-template-columns: 1fr !important;
        gap: 24px;
      }
      .planned-industries-header {
        flex-wrap: wrap;
        gap: 16px;
      }
      .footer-tier-1 {
        display: grid !important;
        grid-template-columns: 1fr !important;
        gap: 32px !important;
        padding-bottom: 36px !important;
      }
      .footer-links-grid-left {
        display: grid !important;
        grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
        gap: 24px 16px !important;
      }
      .footer-parts-card {
        min-height: auto !important;
        padding: 28px 24px !important;
      }
      .equipment-directory-matrix {
        grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
        gap: 16px !important;
      }
      .equipment-dir-item {
        min-height: 260px !important;
        height: 260px !important;
      }
      .equipment-photo-frame {
        height: 100% !important;
        width: 100% !important;
        inset: 0 !important;
      }
      .equipment-item-body {
        padding: 16px 14px !important;
      }
      .equipment-item-title {
        white-space: normal !important;
      }
    }

    @media (max-width: 768px) {
      .container {
        padding-left: 20px;
        padding-right: 20px;
      }
      .hero-heading {
        font-size: clamp(28px, 6vw, 34px);
        line-height: 1.2;
      }
      .hero-subtitle {
        font-size: 15.5px;
      }
      .section-title-h2,
      .what-is-heading,
      .reasons-trust-title,
      .importance-title,
      .partnership-title,
      .why-maintain-title,
      .offering-title,
      .planned-benefits-title,
      .importance-showcase-title {
        font-size: clamp(24px, 5vw, 28px) !important;
        line-height: 1.25;
      }
      .planned-benefits-grid,
      .pillar-grid {
        grid-template-columns: 1fr !important;
      }
      .dashboard-category-tabs,
      .facility-grid-3x2 {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }
      .industry-tabs-row {
        flex-wrap: wrap;
        gap: 8px;
      }
      .footer-contact-grid {
        grid-template-columns: 1fr !important;
        gap: 16px;
      }
      .footer-links-grid-left {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 24px 16px !important;
      }
      .footer-tier-2,
      .dealer-row,
      .legal-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }
      .form-grid-2col {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 16px;
      }
      .form-left-panel,
      .form-right-panel {
        padding: 28px 20px;
      }
      .ahi-chatbot-root {
        right: 16px;
        bottom: 16px;
      }
      .ahi-chatbot-bubble {
        max-width: 240px;
        font-size: 13px;
      }
      .equipment-directory-matrix {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 14px !important;
      }
      .equipment-dir-item {
        min-height: 250px !important;
        height: 250px !important;
      }
    }

    @media (max-width: 540px) {
      .container {
        padding-left: 16px;
        padding-right: 16px;
      }
      .main-navigation-bar {
        height: 68px;
      }
      .brand-logo-img {
        width: 54px !important;
        height: 54px !important;
        max-height: 54px !important;
      }
      .services-grid-4col,
      .confidence-grid-8col,
      .pdm-savings-grid,
      .metrics-grid-4col,
      .pdm-process-grid,
      .process-stepper-grid,
      .calm-ops-grid,
      .emergencies-grid-6col,
      .industries-grid-6col,
      .equipment-directory-matrix,
      .dashboard-category-tabs,
      .facility-grid-3x2,
      .form-grid-2col {
        grid-template-columns: 1fr !important;
        gap: 16px;
      }
      .footer-links-grid-left {
        grid-template-columns: 1fr !important;
        gap: 20px !important;
      }
      .footer-parts-card {
        padding: 24px 18px !important;
      }
      .split-banner-content {
        padding: 28px 20px !important;
      }
      .split-banner-chips-cluster {
        gap: 8px;
      }
      .hero-section {
        padding: 36px 0;
        min-height: auto;
      }
      .hero-cta-group,
      .hero-actions {
        flex-direction: column;
        align-items: stretch;
        gap: 12px;
      }
      .hero-cta-group a,
      .hero-actions a,
      .btn-primary-hero,
      .btn-secondary-hero {
        width: 100%;
        justify-content: center;
        text-align: center;
      }
      .what-is-photo-wrapper img,
      .partnership-photo {
        height: 240px;
      }
      .industry-card-heading,
      .industry-point-item,
      .case-pillar-label {
        white-space: normal;
      }
      .equipment-dir-item {
        min-height: 220px !important;
        height: 220px !important;
      }
      .equipment-item-body {
        padding: 18px 16px !important;
      }
      .equipment-item-title {
        font-size: 15.5px !important;
      }
    }

    /* Mobile Navigation Drawer */
    .ahi-mobile-backdrop {
      display: none;
      position: fixed;
      inset: 0;
      background: rgba(15, 23, 42, 0.5);
      z-index: 9998;
    }
    .ahi-mobile-backdrop.is-open {
      display: block;
    }
    .ahi-mobile-drawer {
      display: none;
      position: fixed;
      top: 0;
      right: 0;
      width: min(340px, 88vw);
      height: 100vh;
      background: #FFFFFF;
      z-index: 9999;
      box-shadow: -8px 0 30px rgba(15, 23, 42, 0.18);
      flex-direction: column;
      overflow-y: auto;
      font-family: 'Montserrat', sans-serif;
    }
    .ahi-mobile-drawer.is-open {
      display: flex;
    }
    .ahi-mobile-drawer-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px 20px;
      background: #163865;
      color: #FFFFFF;
    }
    .ahi-mobile-drawer-title {
      font-size: 15px;
      font-weight: 600;
    }
    .ahi-mobile-close {
      background: transparent;
      border: none;
      color: #FFFFFF;
      font-size: 24px;
      line-height: 1;
      cursor: pointer;
      padding: 4px 8px;
    }
    .ahi-mobile-nav-list {
      list-style: none;
      padding: 12px 16px;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 4px;
    }
    .ahi-mobile-nav-link {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px 10px;
      color: #1E293B;
      font-size: 14.5px;
      font-weight: 500;
      text-decoration: none;
      border-radius: 6px;
    }
    .ahi-mobile-nav-link:hover {
      background: #F1F5F9;
      color: #163865;
    }
    .ahi-mobile-sublist {
      list-style: none;
      padding: 2px 0 8px 16px;
      margin: 0;
      display: flex;
      flex-direction: column;
      gap: 2px;
      border-left: 2px solid #E2E8F0;
      margin-left: 10px;
    }
    .ahi-mobile-sublist a {
      display: block;
      padding: 8px 10px;
      font-size: 13.5px;
      color: #475569;
      text-decoration: none;
      border-radius: 6px;
    }
    .ahi-mobile-sublist a:hover {
      background: #F1F5F9;
      color: #163865;
    }
    .ahi-mobile-drawer-foot {
      margin-top: auto;
      padding: 16px 20px 24px;
      border-top: 1px solid #E2E8F0;
      display: flex;
      flex-direction: column;
      gap: 12px;
    }
    .ahi-mobile-cta {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      height: 44px;
      background: #163865;
      color: #FFFFFF;
      font-size: 14px;
      font-weight: 600;
      border-radius: 6px;
      text-decoration: none;
    }
    .ahi-mobile-contact {
      font-size: 13px;
      color: #475569;
      display: flex;
      flex-direction: column;
      gap: 6px;
    }
    .ahi-mobile-contact a {
      color: #163865;
      text-decoration: none;
      font-weight: 500;
    }
'@

$drawerHtmlTemplate = @'
  <!-- AHI MOBILE NAVIGATION DRAWER -->
  <div id="ahi-mobile-backdrop" class="ahi-mobile-backdrop" onclick="closeAhiMobileMenu()"></div>
  <aside id="ahi-mobile-drawer" class="ahi-mobile-drawer" aria-label="Mobile Navigation">
    <div class="ahi-mobile-drawer-head">
      <span class="ahi-mobile-drawer-title">AHI Carrier NZ</span>
      <button type="button" class="ahi-mobile-close" aria-label="Close navigation menu" onclick="closeAhiMobileMenu()">&times;</button>
    </div>
    <ul class="ahi-mobile-nav-list">
      <li><a href="index.html" class="ahi-mobile-nav-link" onclick="closeAhiMobileMenu()">Home</a></li>
      <li><a href="index.html#about" class="ahi-mobile-nav-link" onclick="closeAhiMobileMenu()">About us</a></li>
      <li><a href="index.html#products" class="ahi-mobile-nav-link" onclick="closeAhiMobileMenu()">Products</a></li>
      <li><a href="index.html#spare-parts" class="ahi-mobile-nav-link" onclick="closeAhiMobileMenu()">Spare Parts</a></li>
      <li>
        <span class="ahi-mobile-nav-link" style="font-weight:600;color:#163865;">Commercial Services</span>
        <ul class="ahi-mobile-sublist">
          <li><a href="index.html" onclick="closeAhiMobileMenu()">Emergency HVAC Repair</a></li>
          <li><a href="chiller-maintenance.html" onclick="closeAhiMobileMenu()">Chiller Maintenance</a></li>
          <li><a href="planned-hvac-maintenance.html" onclick="closeAhiMobileMenu()">Planned HVAC Maintenance</a></li>
          <li><a href="predictive-maintenance.html" onclick="closeAhiMobileMenu()">Predictive Maintenance</a></li>
          <li><a href="preventative-maintenance.html" onclick="closeAhiMobileMenu()">Preventative Maintenance</a></li>
        </ul>
      </li>
      <li><a href="index.html#support" class="ahi-mobile-nav-link" onclick="closeAhiMobileMenu()">Support</a></li>
    </ul>
    <div class="ahi-mobile-drawer-foot">
      <a href="__CTA_HREF__" class="ahi-mobile-cta" onclick="closeAhiMobileMenu()">Send Enquiry</a>
      <div class="ahi-mobile-contact">
        <a href="tel:093556720">Phone: 09 355 6720</a>
        <a href="mailto:customer.services@ahi-carrier.co.nz">customer.services@ahi-carrier.co.nz</a>
      </div>
    </div>
  </aside>
  <script>
    function toggleAhiMobileMenu() {
      var drawer = document.getElementById('ahi-mobile-drawer');
      var backdrop = document.getElementById('ahi-mobile-backdrop');
      if (!drawer || !backdrop) return;
      var isOpen = drawer.classList.toggle('is-open');
      backdrop.classList.toggle('is-open', isOpen);
      document.body.style.overflow = isOpen ? 'hidden' : '';
    }
    function closeAhiMobileMenu() {
      var drawer = document.getElementById('ahi-mobile-drawer');
      var backdrop = document.getElementById('ahi-mobile-backdrop');
      if (drawer) drawer.classList.remove('is-open');
      if (backdrop) backdrop.classList.remove('is-open');
      document.body.style.overflow = '';
    }
  </script>
'@

$ctaMap = @{
  "index.html" = "#request-repair"
  "chiller-maintenance.html" = "#request-service"
  "planned-hvac-maintenance.html" = "#request-service"
  "predictive-maintenance.html" = "#request-consultation"
  "preventative-maintenance.html" = "#request-service"
}

foreach ($file in $ctaMap.Keys) {
  $content = Get-Content -Path $file -Raw -Encoding UTF8
  # 1. Inject or replace responsive CSS right before closing </style> (first occurrence in <head>)
  $marker = "    /* ==========================================================================`r`n       AHI RESPONSIVE OVERRIDES"
  if ($content -match "AHI RESPONSIVE OVERRIDES") {
    $startIdx = $content.IndexOf($marker)
    if ($startIdx -lt 0) { $startIdx = $content.IndexOf("/* ==========================================================================`n       AHI RESPONSIVE OVERRIDES") }
    $endIdx = $content.IndexOf("</style>", $startIdx)
    if ($startIdx -ge 0 -and $endIdx -gt $startIdx) {
      $content = $content.Substring(0, $startIdx) + $responsiveCss + "`r`n  " + $content.Substring($endIdx)
    }
  } else {
    $content = [regex]::Replace($content, "</style>", ($responsiveCss + "`r`n  </style>"), 1)
  }
  # 2. Replace alert onclick on mobile-menu-trigger
  $content = $content.Replace("onclick=""alert('Menu navigation toggled')""", "onclick=""toggleAhiMobileMenu()""")
  # 3. Inject mobile drawer right before </body>
  if ($content -notmatch "AHI MOBILE NAVIGATION DRAWER") {
    $drawer = $drawerHtmlTemplate.Replace("__CTA_HREF__", $ctaMap[$file])
    $content = $content.Replace("</body>", ($drawer + "`r`n</body>"))
  }
  [System.IO.File]::WriteAllText((Resolve-Path $file).Path, $content, (New-Object System.Text.UTF8Encoding($false)))
  Write-Output "Updated $file"
}
