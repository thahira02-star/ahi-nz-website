# Script to update chiller-maintenance.html header and navigation

$canonicalCss = @"
    /* ==========================================================================
       S0 · TOP UTILITY BAR (LOCKED EXACT REPLICA)
       ========================================================================== */
    .top-utility-bar {
      background-color: #163865;
      height: 54px;
      width: 100%;
      color: #FFFFFF;
      font-size: 13px;
      display: flex;
      align-items: center;
      position: relative;
      z-index: 50;
      font-family: 'Montserrat', sans-serif;
    }

    .top-utility-inner {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
    }

    .utility-left-cluster {
      display: flex;
      align-items: center;
      gap: 22px;
    }

    .utility-link {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      color: #FFFFFF;
      font-weight: 500;
      font-size: 13px;
      text-decoration: none;
      white-space: nowrap;
      transition: opacity 0.15s ease;
    }

    .utility-link:hover {
      opacity: 0.85;
    }

    .utility-divider {
      width: 1px;
      height: 14px;
      background-color: rgba(255, 255, 255, 0.25);
    }

    .utility-search-container {
      position: relative;
      width: 350px;
      height: 36px;
      background: #FFFFFF;
      border-radius: 9999px;
      display: flex;
      align-items: center;
      margin-left: 6px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
    }

    .utility-search-input {
      width: 100%;
      height: 100%;
      background: transparent;
      border: none;
      padding: 0 44px 0 18px;
      font-family: 'Montserrat', sans-serif;
      font-size: 13px;
      color: #0F172A;
      border-radius: 9999px;
      outline: none;
    }

    .utility-search-input::placeholder {
      color: #9CA3AF;
      font-style: normal;
    }

    .utility-search-btn {
      position: absolute;
      right: 4px;
      top: 50%;
      transform: translateY(-50%);
      width: 28px;
      height: 28px;
      background-color: #163865;
      border-radius: 50%;
      border: none;
      color: #FFFFFF;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0;
      cursor: pointer;
      transition: background-color 0.15s ease;
    }

    .utility-search-btn:hover {
      background-color: #102F58;
    }

    .utility-right-cluster {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .utility-contact-item {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      color: #FFFFFF;
      font-size: 13px;
      font-weight: 400;
      text-decoration: none;
    }

    .utility-contact-item.phone {
      font-weight: 600;
    }

    .utility-contact-item:hover {
      opacity: 0.9;
    }

    .utility-social-links {
      display: flex;
      align-items: center;
      gap: 12px;
      margin-left: 6px;
    }

    .utility-social-icon {
      color: #FFFFFF;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      transition: opacity 0.15s ease, transform 0.15s ease;
    }

    .utility-social-icon:hover {
      opacity: 0.85;
      transform: translateY(-1px);
    }

    /* ==========================================================================
       S1 · MAIN NAVIGATION (LOCKED REFERENCE REPLICA)
       ========================================================================== */
    .main-navigation-bar {
      background-color: var(--ahi-white);
      height: 100px;
      width: 100%;
      display: flex;
      align-items: center;
      box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05);
      position: sticky;
      top: 0;
      z-index: 40;
    }

    .nav-inner {
      display: flex;
      justify-content: space-between;
      align-items: center;
      width: 100%;
      height: 100%;
    }

    .brand-logo-container {
      display: inline-flex;
      align-items: center;
      text-decoration: none;
    }

    .brand-logo-img {
      height: 72px;
      width: auto;
      max-height: 76px;
      display: block;
      object-fit: contain;
    }

    .nav-links-menu {
      display: flex;
      align-items: center;
      gap: 90px;
      list-style: none;
    }

    .nav-item-dropdown,
    .nav-item-has-megamenu {
      position: static;
    }

    .nav-menu-link {
      font-size: 14px;
      font-weight: 500;
      color: var(--ahi-text-heading);
      position: relative;
      padding: 10px 0;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      cursor: pointer;
      text-decoration: none;
    }

    .nav-chevron {
      color: #64748B;
      transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1), color 0.15s ease;
      display: inline-block;
      flex-shrink: 0;
    }

    .nav-menu-link:hover {
      color: var(--ahi-blue-carrier);
    }

    .nav-menu-link:hover .nav-chevron,
    .nav-item-has-megamenu:hover .nav-chevron,
    .nav-item-has-megamenu.is-open .nav-chevron {
      color: var(--ahi-blue-carrier);
    }

    .nav-item-has-megamenu.is-open .nav-chevron {
      transform: rotate(180deg);
    }

    /* Commercial Mega Menu Dropdown (Full Width like existing website) */
    .commercial-mega-menu {
      position: absolute;
      top: 100px;
      left: 100px;
      right: 100px;
      width: auto;
      min-height: 320px;
      background-color: var(--ahi-white);
      border: 1px solid var(--ahi-border-light);
      border-radius: 5px;
      box-shadow: 0 20px 45px -8px rgba(16, 47, 88, 0.18), 0 8px 16px -4px rgba(16, 47, 88, 0.08);
      display: grid;
      grid-template-columns: 360px 1fr;
      z-index: 100;
      opacity: 0;
      visibility: hidden;
      transform: translateY(-8px);
      transition: opacity 0.22s cubic-bezier(0.16, 1, 0.3, 1), transform 0.22s cubic-bezier(0.16, 1, 0.3, 1), visibility 0.22s ease;
      pointer-events: none;
      overflow: hidden;
    }

    .commercial-mega-menu::before {
      content: "";
      position: absolute;
      top: -16px;
      left: 0;
      width: 100%;
      height: 16px;
    }

    .commercial-mega-menu.is-open {
      opacity: 1;
      visibility: visible;
      transform: translateY(0);
      pointer-events: auto;
    }

    /* Left Column: Categories */
    .mega-menu-categories {
      background-color: #FFFFFF;
      border-right: 1px solid var(--ahi-border-light);
      padding: 24px 18px;
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    .mega-category-btn {
      display: flex;
      align-items: center;
      justify-content: space-between;
      width: 100%;
      padding: 12px 14px;
      border-radius: 5px;
      background: transparent;
      color: #334155;
      cursor: pointer;
      font-family: inherit;
      font-size: 14px;
      font-weight: 500;
      text-align: left;
      border: none;
      transition: background-color 0.15s ease, color 0.15s ease;
    }

    .mega-cat-left {
      display: flex;
      align-items: center;
      gap: 12px;
    }

    .mega-cat-icon {
      width: 22px;
      height: 22px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #475569;
      flex-shrink: 0;
      transition: color 0.15s ease;
    }

    .mega-cat-icon svg {
      width: 20px;
      height: 20px;
    }

    .mega-cat-label {
      font-size: 14px;
      color: inherit;
    }

    .mega-cat-arrow {
      font-size: 16px;
      font-weight: 600;
      color: #1E293B;
      opacity: 0;
      transform: translateX(-4px);
      transition: opacity 0.15s ease, transform 0.15s ease;
    }

    .mega-category-btn:hover {
      background-color: #F8FAFC;
      color: #0F172A;
    }

    .mega-category-btn:hover .mega-cat-icon {
      color: #163865;
    }

    .mega-category-btn.active {
      background-color: #F1F5F9;
      color: #0F172A;
      font-weight: 600;
    }

    .mega-category-btn.active .mega-cat-icon {
      color: #163865;
    }

    .mega-category-btn.active .mega-cat-arrow,
    .mega-category-btn:hover .mega-cat-arrow {
      opacity: 1;
      transform: translateX(0);
    }

    /* Right Column: Sub-menu Items */
    .mega-menu-content {
      background-color: #F8FAFC;
      padding: 36px 56px;
      position: relative;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
    }

    .mega-menu-close-btn {
      position: absolute;
      top: 24px;
      right: 28px;
      color: #64748B;
      background: none;
      border: none;
      cursor: pointer;
      padding: 6px;
      border-radius: 4px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: color 0.15s ease, background-color 0.15s ease, transform 0.15s ease;
    }

    .mega-menu-close-btn:hover {
      color: #0F172A;
      background-color: rgba(0, 0, 0, 0.05);
      transform: scale(1.08);
    }

    .mega-subpanel {
      display: none;
      animation: fadeInSubpanel 0.2s ease forwards;
    }

    .mega-subpanel.active {
      display: block;
    }

    @keyframes fadeInSubpanel {
      from {
        opacity: 0;
        transform: translateY(4px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .mega-subitems-list {
      list-style: none;
      display: flex;
      flex-direction: column;
      gap: 18px;
      padding: 0;
      margin: 0;
    }

    .mega-subitem-link {
      font-size: 15px;
      font-weight: 500;
      color: #334155;
      text-decoration: none;
      display: inline-block;
      transition: color 0.15s ease, transform 0.15s ease;
    }

    .mega-subitem-link:hover {
      color: #163865;
      font-weight: 600;
      transform: translateX(4px);
    }

    .mega-subitem-link.current-page {
      color: #163865;
      font-weight: 700;
      position: relative;
    }

    /* Services Showcase Panel (Reference: Reference files/Services.png) */
    .mega-services-showcase {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      padding-top: 2px;
    }

    .mega-services-heading {
      font-size: 20px;
      font-weight: 600;
      color: #1E293B;
      line-height: 1.35;
      margin: 0 0 8px 0;
      letter-spacing: -0.01em;
      max-width: 760px;
    }

    .mega-services-desc {
      font-size: 14px;
      font-weight: 400;
      color: #475569;
      line-height: 1.5;
      margin: 0 0 22px 0;
      max-width: 700px;
    }

    .mega-services-card {
      display: flex;
      align-items: stretch;
      justify-content: space-between;
      background-color: #FFFFFF;
      border: 1px solid var(--ahi-border-light);
      border-radius: 4px;
      min-height: 138px;
      max-width: 820px;
      width: 100%;
      text-decoration: none;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(16, 47, 88, 0.04);
      transition: border-color 0.18s ease, box-shadow 0.18s ease, transform 0.18s ease;
    }

    .mega-services-card:hover {
      border-color: #CBD5E1;
      box-shadow: 0 6px 16px rgba(16, 47, 88, 0.08);
      transform: translateY(-1px);
    }

    .mega-services-card-title {
      display: flex;
      align-items: center;
      padding: 24px 32px;
      font-size: 18px;
      font-weight: 600;
      color: #1E293B;
      line-height: 1.4;
      flex: 1;
      transition: color 0.15s ease;
    }

    .mega-services-card:hover .mega-services-card-title {
      color: #163865;
    }

    .mega-services-card-block {
      width: 138px;
      min-width: 138px;
      background-color: #163865;
      display: block;
      transition: background-color 0.18s ease;
    }

    .mega-services-card:hover .mega-services-card-block {
      background-color: #102F58;
    }

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

    .nav-cta-btn:hover {
      background-color: var(--ahi-navy-hover);
      color: var(--ahi-white);
    }

    .mobile-menu-trigger {
      display: none;
      color: var(--ahi-navy-primary);
    }
"@

$canonicalHtml = @"
  <!-- ==========================================================================
       S0 · TOP UTILITY BAR (LOCKED REFERENCE REPLICA)
       ========================================================================== -->
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

  <!-- ==========================================================================
       S1 · MAIN NAVIGATION (LOCKED REFERENCE REPLICA)
       ========================================================================== -->
  <nav class="main-navigation-bar" role="navigation" aria-label="Main Navigation">
    <div class="container nav-inner">
      <a href="index.html" class="brand-logo-container" aria-label="AHI Carrier New Zealand Home">
        <img src="Reference files/AHIC-logo.avif" alt="AHI Carrier New Zealand" class="brand-logo-img">
      </a>

      <ul class="nav-links-menu">
        <li><a href="index.html" class="nav-menu-link">Home</a></li>
        <li><a href="index.html#about" class="nav-menu-link">About us</a></li>
        <li class="nav-item-dropdown">
          <a href="index.html#products" class="nav-menu-link">
            <span>Products</span>
            <svg class="nav-chevron" width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <polyline points="6 9 12 15 18 9"></polyline>
            </svg>
          </a>
        </li>
        <li><a href="index.html#spare-parts" class="nav-menu-link">Spare Parts</a></li>
        <li class="nav-item-has-megamenu" id="nav-item-commercial">
          <a href="#commercial" class="nav-menu-link" id="commercial-menu-toggle" aria-expanded="false" aria-haspopup="true">
            <span>Commercial</span>
            <svg class="nav-chevron" width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <polyline points="6 9 12 15 18 9"></polyline>
            </svg>
          </a>

          <!-- Commercial Mega Menu Dropdown -->
          <div class="commercial-mega-menu" id="commercial-mega-menu" role="region" aria-label="Commercial Services Mega Menu">
            
            <!-- Left Column: Primary Categories -->
            <div class="mega-menu-categories">
              
              <!-- Category 1: Services -->
              <button type="button" class="mega-category-btn" data-target="panel-services">
                <span class="mega-cat-left">
                  <span class="mega-cat-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                      <circle cx="12" cy="12" r="3"></circle>
                      <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                    </svg>
                  </span>
                  <span class="mega-cat-label">Services</span>
                </span>
                <span class="mega-cat-arrow" aria-hidden="true">&rarr;</span>
              </button>

              <!-- Category 2: Modernization & Energy updates -->
              <button type="button" class="mega-category-btn" data-target="panel-modernization">
                <span class="mega-cat-left">
                  <span class="mega-cat-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83"></path>
                      <circle cx="12" cy="12" r="4"></circle>
                    </svg>
                  </span>
                  <span class="mega-cat-label">Modernization &amp; Energy updates</span>
                </span>
                <span class="mega-cat-arrow" aria-hidden="true">&rarr;</span>
              </button>

              <!-- Category 3: Repair & Rapid Response -->
              <button type="button" class="mega-category-btn" data-target="panel-repair">
                <span class="mega-cat-left">
                  <span class="mega-cat-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"></path>
                    </svg>
                  </span>
                  <span class="mega-cat-label">Repair &amp; Rapid Response</span>
                </span>
                <span class="mega-cat-arrow" aria-hidden="true">&rarr;</span>
              </button>

              <!-- Category 4: Maintenance & Lifestyle Service (Active) -->
              <button type="button" class="mega-category-btn active" data-target="panel-maintenance">
                <span class="mega-cat-left">
                  <span class="mega-cat-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                      <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                      <line x1="16" y1="2" x2="16" y2="6"></line>
                      <line x1="8" y1="2" x2="8" y2="6"></line>
                      <line x1="3" y1="10" x2="21" y2="10"></line>
                      <path d="m9 16 2 2 4-4"></path>
                    </svg>
                  </span>
                  <span class="mega-cat-label">Maintenance &amp; Lifestyle Service</span>
                </span>
                <span class="mega-cat-arrow" aria-hidden="true">&rarr;</span>
              </button>

            </div>

            <!-- Right Column: Sub-Items Content Panels -->
            <div class="mega-menu-content">
              
              <!-- Close Button -->
              <button type="button" class="mega-menu-close-btn" id="mega-menu-close" aria-label="Close Commercial Menu">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                  <line x1="18" y1="6" x2="6" y2="18"></line>
                  <line x1="6" y1="6" x2="18" y2="18"></line>
                </svg>
              </button>

              <!-- Panel 1: Services (Showcase Design: Reference files/Services.png) -->
              <div class="mega-subpanel" id="panel-services">
                <div class="mega-services-showcase">
                  <h3 class="mega-services-heading">Empowering safer, greener, and more resilient energy infrastructures</h3>
                  <p class="mega-services-desc">Trusted by Oil &amp; Gas, Hydrogen, and Renewable Developers for Reliable, Ex-Proof Engineering.</p>
                  <a href="#engineering-systems" class="mega-services-card">
                    <span class="mega-services-card-title">Engineering Smarter, Safer Energy Systems</span>
                    <span class="mega-services-card-block" aria-hidden="true"></span>
                  </a>
                </div>
              </div>

              <!-- Panel 2: Modernization & Energy updates (Reference files/Modernization & Energy updates.png) -->
              <div class="mega-subpanel" id="panel-modernization">
                <ul class="mega-subitems-list">
                  <li><a href="#chiller-optimization" class="mega-subitem-link">Chiller Optimization</a></li>
                  <li><a href="#ahu-upgrades" class="mega-subitem-link">Air handling Unit Upgrades</a></li>
                  <li><a href="#system-replacement" class="mega-subitem-link">System replacement Services</a></li>
                  <li><a href="#retrofit-energy" class="mega-subitem-link">Retrofit &amp; Energy Services</a></li>
                  <li><a href="#r22-replacement" class="mega-subitem-link">R22 Replacement Services</a></li>
                </ul>
              </div>

              <!-- Panel 3: Repair & Rapid Response (Reference files/Repair & Rapid Response.png) -->
              <div class="mega-subpanel" id="panel-repair">
                <ul class="mega-subitems-list">
                  <li><a href="index.html" class="mega-subitem-link">Emergency HVAC Repair</a></li>
                  <li><a href="#compressor-services" class="mega-subitem-link">Compressor Services</a></li>
                </ul>
              </div>

              <!-- Panel 4: Maintenance & Lifestyle Service (Reference files/Maintenance & Lifestyle Service.png) -->
              <div class="mega-subpanel active" id="panel-maintenance">
                <ul class="mega-subitems-list">
                  <li><a href="#planned-maintenance" class="mega-subitem-link">Planned HVAC Maintenance</a></li>
                  <li><a href="#preventive-maintenance" class="mega-subitem-link">Preventive Maintenance</a></li>
                  <li><a href="predictive-maintenance.html" class="mega-subitem-link">Predictive Maintenance</a></li>
                  <li><a href="chiller-maintenance.html" class="mega-subitem-link current-page">Chiller Maintenance</a></li>
                </ul>
              </div>

            </div>
          </div>
        </li>
        <li class="nav-item-dropdown">
          <a href="index.html#support" class="nav-menu-link">
            <span>Support</span>
            <svg class="nav-chevron" width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <polyline points="6 9 12 15 18 9"></polyline>
            </svg>
          </a>
        </li>
      </ul>

      <a href="#request-service" class="nav-cta-btn">Send Enquiry</a>

      <button class="mobile-menu-trigger" aria-label="Toggle navigation menu" onclick="alert('Menu navigation toggled')">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <line x1="3" y1="12" x2="21" y2="12"></line>
          <line x1="3" y1="6" x2="21" y2="6"></line>
          <line x1="3" y1="18" x2="21" y2="18"></line>
        </svg>
      </button>
    </div>
  </nav>
"@

$filePath = "final output/chiller-maintenance.html"
$content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# 1. Replace CSS
$cssStartMarker = "/* ==========================================================================`r`n       S0 · TOP UTILITY BAR (LOCKED EXACT REPLICA)"
if (-not $content.Contains($cssStartMarker)) {
  $cssStartMarker = "/* ==========================================================================`n       S0 · TOP UTILITY BAR (LOCKED EXACT REPLICA)"
}

$cssEndMarker = "/* ==========================================================================`r`n       SECTION 1 · HERO SECTION"
if (-not $content.Contains($cssEndMarker)) {
  $cssEndMarker = "/* ==========================================================================`n       SECTION 1 · HERO SECTION"
}

$idxCssStart = $content.IndexOf($cssStartMarker)
$idxCssEnd = $content.IndexOf($cssEndMarker)

if ($idxCssStart -ge 0 -and $idxCssEnd -gt $idxCssStart) {
  Write-Host "Found CSS block at $idxCssStart to $idxCssEnd"
  $content = $content.Substring(0, $idxCssStart) + $canonicalCss + "`r`n`r`n    " + $content.Substring($idxCssEnd)
} else {
  Write-Error "Could not locate CSS markers! idxCssStart=$idxCssStart, idxCssEnd=$idxCssEnd"
  exit 1
}

# 2. Replace HTML
$htmlStartMarker = "<!-- ==========================================================================`r`n       S0 · TOP UTILITY BAR (LOCKED EXACT REPLICA)"
if (-not $content.Contains($htmlStartMarker)) {
  $htmlStartMarker = "<!-- ==========================================================================`n       S0 · TOP UTILITY BAR (LOCKED EXACT REPLICA)"
}

$htmlEndMarker = "<!-- ==========================================================================`r`n       SECTION 1 · HERO SECTION"
if (-not $content.Contains($htmlEndMarker)) {
  $htmlEndMarker = "<!-- ==========================================================================`n       SECTION 1 · HERO SECTION"
}

$idxHtmlStart = $content.IndexOf($htmlStartMarker)
$idxHtmlEnd = $content.IndexOf($htmlEndMarker)

if ($idxHtmlStart -ge 0 -and $idxHtmlEnd -gt $idxHtmlStart) {
  Write-Host "Found HTML block at $idxHtmlStart to $idxHtmlEnd"
  $content = $content.Substring(0, $idxHtmlStart) + $canonicalHtml + "`r`n`r`n  " + $content.Substring($idxHtmlEnd)
} else {
  Write-Error "Could not locate HTML markers! idxHtmlStart=$idxHtmlStart, idxHtmlEnd=$idxHtmlEnd"
  exit 1
}

# 3. Update media queries if necessary
$oldMq = ".nav-menu-list {`r`n        display: none;`r`n      }"
$newMq = ".nav-links-menu,`r`n      .nav-cta-btn,`r`n      .commercial-mega-menu {`r`n        display: none;`r`n      }`r`n      .mobile-menu-trigger {`r`n        display: flex;`r`n        align-items: center;`r`n        justify-content: center;`r`n      }"

if ($content.Contains($oldMq)) {
  $content = $content.Replace($oldMq, $newMq)
  Write-Host "Updated responsive media query"
} else {
  $oldMqLf = ".nav-menu-list {\n        display: none;\n      }"
  $newMqLf = ".nav-links-menu,\n      .nav-cta-btn,\n      .commercial-mega-menu {\n        display: none;\n      }\n      .mobile-menu-trigger {\n        display: flex;\n        align-items: center;\n        justify-content: center;\n      }"
  if ($content.Contains($oldMqLf)) {
    $content = $content.Replace($oldMqLf, $newMqLf)
    Write-Host "Updated responsive media query (LF)"
  }
}

[System.IO.File]::WriteAllText($filePath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Successfully updated $filePath"

# 4. Binary copy to root chiller-maintenance.html
[System.IO.File]::WriteAllBytes("chiller-maintenance.html", [System.IO.File]::ReadAllBytes($filePath))
Write-Host "Synchronized to root chiller-maintenance.html"
