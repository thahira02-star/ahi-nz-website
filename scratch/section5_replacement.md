---

## 5. Global Website Consistency & Service Page Design Rules (The 5 Locked Components)

> [!IMPORTANT]
> **Mandatory Rule:** The AHI Carrier website must maintain a consistent global design structure across all service pages while providing unique, modern, minimal, professional, and visually engaging content experiences.

### A. Global Components — Must Remain Consistent Across Every Service Page

The following **five components** must maintain identical design, dimensions, styling, and behavior across every service page:

1. **Header and navigation** (including Top Utility Bar and Commercial Mega Menu).
2. **Hero section layout and height**.
3. **Enquiry form** (2-column asymmetric: 41% dark navy info panel + 59% interactive form matrix).
4. **Final CTA section immediately above the footer** (including "Explore Other Services" 4-column grid and pre-footer CTA banner).
5. **Website footer** (Multi-tier corporate footer with 6 taxonomy columns, Genuine Parts card, contact strip, and legal bar).

```
+-----------------------------------------------------------------------------------------+
|                  THE 5 GLOBALLY LOCKED COMPONENTS (VERBATIM REUSE)                      |
|                                                                                         |
|  [1] Header & Navigation (Utility Bar + Main Sticky Bar + Commercial Mega Menu)         |
|  [2] Hero Section Layout & Height (Full-bleed technician photo + dark gradient)         |
|  [3] Enquiry Form Section (41% Navy info panel + 59% Interactive form matrix)           |
|  [4] Final CTA Section Immediately Above the Footer ("Explore Other Services" / Banner) |
|  [5] Multi-Tier Corporate Footer (6 Link columns + Genuine Parts + Legal bar)           |
+-----------------------------------------------------------------------------------------+
```

* **Reuse Existing Code:** Always reuse the actual existing components from the primary service pages (`final output/index.html` and `final output/predictive-maintenance.html`). Do not recreate or independently redesign these components for individual service pages.
* **Content Adaptations:** Only adapt service-specific text, relevant machinery photography, and appropriate CTA wording where necessary.

---

### B. Unique Service Page Content (The Middle Sections)

Every service page must have its own purposeful content structure and section layouts based on the specific engineering scope of that particular service:

* **Bespoke Problem-Focused Structure:** Design each middle section with appropriate visual treatments, clear information hierarchy, authentic technical imagery, and engaging micro-interactions.
* **Anti-Monotony Rule:** Avoid repetitive layouts, unnecessary card grids across consecutive sections, and generic AI-generated website patterns.
* **Engineering Reality:** Center the middle sections on real commercial HVAC workflows (e.g. telemetry sensor diagrams, vibration diagnostic metrics, chronological process pipelines, equipment compatibility tables, or real-world industrial case studies).

---

### C. Shared Design System Integrity

All pages must adhere strictly to the shared AHI Carrier design system:
* **Typography:** `Montserrat` (600 Semi-bold headlines and actions, 400 Regular body copy).
* **Colors:** Official palette (`#163865` primary navy, `#102F58` dark panel, `#393a3b` / `#475569` body, `#ffffff` card surfaces, `#F3F4F5` wrapper, `#F3F3F3` footer).
* **Geometry:** Container with `100px` desktop side padding (`40px` tablet, `20px` mobile).
* **Controls & Radii:** Unified `4px` to `5px` corner radius (`--radius-sm: 5px`, `--radius-md: 5px`). Subtle `1px solid #E2E8F0` borders.

---

### D. Overall Design Objective

Maintain global visual consistency while ensuring every service page provides its own distinctive, authoritative content experience.

**The website must feel like one unified, enterprise AHI Carrier brand — never a collection of independently generated, disconnected pages.**

---

### 5.1 Detailed Specification: Component 1 (Header, Utility Bar & Commercial Mega Menu)

* **Top Utility Bar:** Full width, `57px` height, `#163865` fill. Left side: "Switch to Global" link, divider, "Where to Buy", and pill search input (`398px × 30px`). Right side: email (`customer.services@ahi-carrier.co.nz`), phone (`09 355 6720`), and social links (Facebook, YouTube, LinkedIn).
* **Main Navigation Bar:** Sticky, `100px` height, `#ffffff` fill, subtle bottom shadow (`0 1px 4px rgba(0,0,0,0.05)`). Logo left-aligned (`AHIC-logo.avif`). Navigation items: `Home`, `About us`, `Products ∨`, `Spare Parts`, `Commercial ∨`, `Support ∨`. Action CTA: `"SEND ENQUIRY"` (`#163865` navy button, `4px` radius).
* **Commercial Mega Menu Dropdown:**
  * Container: Absolute positioned, `top: 100px`, `left: 100px`, `right: 100px`, `width: auto` (spans flush from logo left to Send Enquiry button right across the full container).
  * Structure: 2-column grid (`360px` left category list, flexible right content panel).
  * Minimum Height: `320px`.
  * Trigger: Opens exclusively on click of "Commercial". Closes on mouse boundary exit (debounced `220ms` when cursor leaves both navbar and menu), close button click (`×`), outside click, or <kbd>Escape</kbd>.
  * Category 1 (`Services`): Features the showcase layout from `Reference files/Services.png` (Heading: *"Empowering safer, greener, and more resilient energy infrastructures"*, description: *"Trusted by Oil & Gas, Hydrogen, and Renewable Developers for Reliable, Ex-Proof Engineering."*, and *"Engineering Smarter, Safer Energy Systems"* white card with `#163865` square accent).
  * Category 2 (`Modernization & Energy updates`): 5 text links from `Reference files/Modernization & Energy updates.png` (`Chiller Optimization`, `Air handling Unit Upgrades`, `System replacement Services`, `Retrofit & Energy Services`, `R22 Replacement Services`).
  * Category 3 (`Repair & Rapid Response`): 2 text links (`Energy HVAC Repairs`, `Compressor Services`) from `Reference files/Repair & Rapid Response.png`.
  * Category 4 (`Maintenance & Lifestyle Service`): 4 text links (`Planned HVAC Maintenance`, `Preventive Maintenance`, `Predictive Maintenance`, `Chiller Maintenance`) from `Reference files/Maintenance & Lifestyle Service.png`.

---

### 5.2 Detailed Specification: Component 2 (Hero Section Layout & Height)

* **Height:** `440px` – `520px` responsive banner.
* **Background:** Real technician imagery overlaid with a left-to-right directional gradient:
  ```css
  linear-gradient(90deg, rgba(16, 47, 88, 0.94) 0%, rgba(16, 47, 88, 0.82) 45%, rgba(16, 47, 88, 0.25) 80%, transparent 100%)
  ```
* **Content:**
  * Uppercase kicker in light blue or white (`GET STARTED` / `24/7 RAPID DISPATCH`).
  * Bold H1 in `#ffffff` (38px – 44px, line-height 1.2).
  * Crisp sub-paragraph in `#E2E8F0` (max-width 560px).
  * Dual Action Group: Primary CTA (solid white button with `#163865` navy text) + Secondary Call Card (telephone prompt showing `0800 AIRCON / 0800 247 266`).

---

### 5.3 Detailed Specification: Component 3 (Two-Column Asymmetric Enquiry Form)

* **Wrapper:** Full-width `#F3F4F5` light surface background with generous vertical padding (`80px`).
* **Container:** Floating 2-column asymmetric card (`#ffffff` fill, `1px solid #E2E8F0` border, `8px` corner radius).
* **Left Column (41% Width, Dark Navy Info Panel):**
  * Background: `#102F58` to `#13335E`.
  * Content: Heading (*"Request Service"*), descriptive copy, active scope tags with checkmarks (e.g. `24/7 Emergency Repair`, `Nationwide On-Site Service`), direct phone dispatch block (`0800 AIRCON`), and physical Auckland address (`207-211 Station Road, Penrose, Auckland`).
  * Footer Trust Badges: `24/7 Availability`, `Genuine Carrier Parts`, `Optimised Performance`.
* **Right Column (59% Width, Form Field Matrix):**
  * Facility Type Selector: 6 interactive pill buttons in a 3×2 grid (`Commercial Office`, `Healthcare`, `Industrial`, `Data Centre`, `Education`, `Retail`) with radio indicator dots.
  * 2-Column Desktop Grid for inputs: First Name, Last Name, Email, Phone, Company Name, Site Address.
  * Full-width Equipment / Issue textarea.
  * Primary Submit Button: Full-width `#163865` navy button (`44px` height, white text, subtle hover lift).

---

### 5.4 Detailed Specification: Component 4 (Final CTA Section Immediately Above Footer)

* **Position:** Placed immediately above the corporate footer.
* **Option A: "Explore Other Services" Grid:**
  * Section Title: H2 (*"Explore Other Services"* or *"Related HVAC Engineering Solutions"*).
  * Top-right text link: *"view all services"*.
  * Grid: 4-column balanced grid (`24px` gap).
  * Card Architecture: 16:9 industrial service photography with rounded top corners, white body (`24px` padding), 16px bold title, 13-14px muted description, and semi-bold navy link with arrow (`"Learn More →"`). Hover lift of `-4px`.
* **Option B: Pre-Footer CTA Consultation Banner:**
  * Contained container (`100%` width, `100px` side padding), border radius `5px` (or `28px – 32px` on legacy reference), navy gradient (`#153968` → `#264670`).
  * Headline + descriptive sub-text, dual button pair (`Explore Products →` solid accent + `Get Free Consultation` white outline).

---

### 5.5 Detailed Specification: Component 5 (Website Footer)

* **Main Footer Background:** `#F3F3F3` full-width surface with `62px` top padding.
* **Taxonomy Grid:** 6 navigation columns (`Carrier`, `Toshiba`, `Lifestyle Products`, `Services`, `Resources`, `Company`) featuring `13px` slate links (`#475569`) with chevron prefixes.
* **Genuine Parts Feature Card:** White card with official partner logos (Carrier, Toshiba, Totaline) and *"Shop Genuine Parts"* navy button.
* **Contact Strip:** Social icon links, telephone (`09 355 6720`), dispatch email, and Penrose, Auckland address (`211 Station Road, Penrose, Auckland 1061`).
* **Legal Bar:** Copyright, Privacy Policy, Terms & Conditions, Legal, Site Map, and attribution: *"Crafted by Trizions Group"*.

