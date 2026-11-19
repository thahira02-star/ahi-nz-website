# AHI Carrier New Zealand — Permanent Anti-AI-Slop & Design System Standard

> **Document Version:** 1.0.0  
> **Effective Date:** November 2026  
> **Applies to:** AHI Carrier New Zealand Web Platform (`ahi-carrier.co.nz` / `nz1.ahi-carrier.com`)  
> **Source Documents:** `TZ-AHI-DS-v1-10-26` (AHI Carrier Digital Design System v1.0, Trizions Group), Live Service Implementations, Approved Client Revisions.

---

## 1. Executive Mandate & Purpose

This document is the **permanent architectural and visual integrity standard** for the AHI Carrier New Zealand web platform. It exists to protect the brand from **"AI Slop"** — the pervasive tendency of artificial intelligence models, automated code generators, and undisciplined developers to produce generic, repetitive, unbranded, and poorly engineered user interfaces.

AHI Carrier is not a generic B2B software startup or a consumer marketing blog. It is an industry-defining joint venture representing **Carrier** — the inventor of modern air conditioning — and **AHI**, delivering mission-critical commercial, industrial, and residential HVAC engineering across New Zealand.

Every page, component, heading, and interaction on this platform must reflect:
1. **Engineering Precision:** Clean structure, purposeful visual weight, and balanced industrial aesthetics.
2. **Authentic New Zealand Commercial Context:** True Auckland and national facility operations, genuine technical services, certified local engineers, and real Carrier/Toshiba equipment.
3. **Strict Design System Fidelity:** Complete adherence to established design tokens, typography scales, container geometries, and locked core layouts.
4. **Zero Fabrication:** Zero hallucinated metrics, zero fabricated testimonials, zero unverified guarantees, and zero placeholder fluff.

**Enforcement Rule:** Any proposed layout, code modification, or content addition that violates the standards set out in this document must be rejected immediately during review.

---

## 2. Ground Truth & Provenance Key

To avoid conflicting interpretations, every design token, component pattern, and layout rule in this project is classified under a strict provenance taxonomy:

| Provenance Tag | Definition & Authority |
|---|---|
| **`[SOURCE]`** | Taken directly from the official AHI Carrier Digital Design System specification (`TZ-AHI-DS-v1-10-26`). Mandatory. Takes highest precedence. |
| **`[USER-MANDATED]`** | Direct, explicit client instructions and approved revisions established during production (e.g., container padding, mega menu dimensions, color corrections). Mandatory. Overrides generic proposals. |
| **`[OBSERVED]`** | Empirical patterns extracted from the live production benchmark site (`https://nz1.ahi-carrier.com/`) across the Chiller, Planned HVAC, and Preventative Maintenance service pages. Authoritative for component behavior. |
| **`[PROPOSED]`** | Design extensions authored by Trizions to complete gaps in the specification. Must be adhered to unless explicitly overridden by `[SOURCE]` or `[USER-MANDATED]`. |

### Project Directory Structure

```text
├── index.html                           <- Root Emergency HVAC Repair page (Live mirror)
├── predictive-maintenance.html          <- Root Predictive Maintenance page (Live mirror)
├── final output/
│   ├── index.html                       <- Production master: Emergency HVAC Repair
│   └── predictive-maintenance.html      <- Production master: Predictive Maintenance
├── Reference files/
│   ├── AHI-DESIGN-SYSTEM-RULES.md       <- Full reference token compilation (Oct 2026)
│   ├── AHIC-logo.avif                   <- Official brand logo asset
│   ├── Emergency HVAC Repair.pdf        <- Service scope & copy documentation
│   ├── hero section.png                 <- Approved Hero layout reference
│   ├── hero section bg.png              <- Approved Hero imagery asset
│   ├── Services.png                     <- Commercial Mega Menu: Services showcase reference
│   ├── Modernization & Energy updates.png <- Commercial Mega Menu: Modernization panel reference
│   ├── Repair & Rapid Response.png      <- Commercial Mega Menu: Repair panel reference
│   └── Maintenance & Lifestyle Service.png<- Commercial Mega Menu: Maintenance panel reference
├── aislop.md                            <- THIS DOCUMENT (Root guideline)
└── serve.ps1                            <- Local verification test server
```

---

## 3. AHI Carrier Design Identity & Technical Tokens

### 3.1 Color Palette & Contrast Hierarchy

All colors are strictly locked. No automated generator may introduce arbitrary hex colors, Tailwind presets (e.g., `sky-400`, `blue-500`, `slate-900`), or unapproved CSS variables.

#### Core Brand Tokens

| Token Name | HEX Code | Provenance | Contrast (on #FFF) | Approved Role & Constraints |
|---|---|---|---|---|
| `--ahi-navy-primary` | `#163865` | `[SOURCE]` | 11.7 : 1 (AAA) | Primary brand color. Key headings, primary action buttons, active tab indicators, top utility bar background, active icon accents. |
| `--ahi-navy-dark` | `#102F58` | `[OBSERVED]` | 13.9 : 1 (AAA) | Form info panel background, dark feature blocks, high-emphasis card panels. |
| `--ahi-navy-panel` | `#13335E` | `[OBSERVED]` | 12.8 : 1 (AAA) | Secondary dark container depth, subtle gradient stops on dark cards. |
| `--ahi-blue-carrier` | `#283389` | `[OBSERVED]` | 9.8 : 1 (AAA) | Official Carrier blue (logo oval and brand lockups). |
| `--ahi-blue-accent` | `#0284C7` | `[OBSERVED]` | 4.6 : 1 (AA) | Radio selection indicators, active facility scope checkboxes, subtle metric tags. |
| `--ahi-blue-tint` | `#EFF6FF` | `[OBSERVED]` | 1.1 : 1 (Bg) | Active accordion row fill, circular icon container backgrounds. |
| `--ahi-blue-numeral` | `#93C5FD` | `[OBSERVED]` | 1.6 : 1 (Bg) | Large decorative step numerals (`01`, `02`, `03`) on light cards. |
| `--ahi-white` | `#ffffff` | `[SOURCE]` | 1.0 : 1 (Base) | Primary card surfaces, clean section backgrounds, button text on dark fills. |
| `--ahi-neutral-bg` | `#f8fafc` | `[SOURCE]` | 1.05 : 1 (Bg) | Alternating section backgrounds, mega menu right-panel container fill. |
| `--ahi-surface-alt` | `#f1f5f9` | `[OBSERVED]` | 1.15 : 1 (Bg) | Active category button highlight in mega menu, subtle pill backgrounds. |
| `--ahi-form-wrapper`| `#F3F4F5` | `[OBSERVED]` | 1.12 : 1 (Bg) | Full-width background wrapper framing the floating enquiry form card. |
| `--ahi-footer-bg` | `#F3F3F3` | `[OBSERVED]` | 1.13 : 1 (Bg) | Global website footer background. |
| `--ahi-border-light`| `#E2E8F0` | `[OBSERVED]` | 1.25 : 1 (Border)| Standard 1px card borders, table rules, and form input resting borders. |
| `--ahi-red-error` | `#c73b3b` | `[SOURCE]` | 5.1 : 1 (AA) | **Strictly validation errors and destructive alerts.** Never use for decorative accents, icons, or CTA buttons. |
| `--ahi-red-brand` | `#ED1A2E` | `[SOURCE]` | 4.7 : 1 (AA) | Reserved exclusively for Toshiba & Totaline partner logo assets. |

#### Typography Color Hierarchy

* **Heading Charcoal (`--ahi-text-heading`):** `#0F172A` (or `#163865` for branded headlines). Maximum legibility.
* **Secondary Slate (`--ahi-text-secondary`):** `#393a3b`. Used for primary body text. **Never use `#000000` (pure black) for body copy.**
* **Muted Body (`--ahi-text-body`):** `#475569`. Standard explanatory descriptions, card summaries, and technical notes.
* **Subtle Slate (`--ahi-text-muted`):** `#64748B`. Subtitles beneath section titles, breadcrumbs, and helper captions.
* **True Dark Accent (`--ahi-text-dark`):** `#0d0d0d`. Reserved for extreme high-contrast moments where near-black is necessary.

#### Hover State Tokens

Hover states must use the official three-tone navy scale `[SOURCE]`:
* **Hover 1:** `#4b6890` (Soft hover)
* **Hover 2:** `#355782` (Medium hover)
* **Hover 3:** `#22456e` / `#102F58` (Standard primary button hover)

### 3.2 Typography System

The official typography stack is anchored exclusively by **Montserrat** `[SOURCE]`.

```css
--font-family: 'Montserrat', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
```

#### Type Scale & Usage Rules

| Hierarchy | Size | Weight | Line Height | Usage |
|---|---|---|---|---|
| **H1 (Hero Dark)** | `38px` – `44px` | `700` (Bold) | `1.2` | Page title on dark hero photography banner. High contrast white (`#ffffff`). |
| **H1 (Standard)** | `50px` | `600` (Semi-bold) | `1.15` | Default page title on light backgrounds. |
| **H2 (Section Title)** | `34px` | `600` (Semi-bold) | `1.25` | Major section titles. Sentence case or title case. Primary navy (`#163865`) or `#0F172A`. |
| **H3 (Sub-heading)** | `20px` | `600` (Semi-bold) | `1.35` | Major card headings, sub-panel titles, process step names. |
| **H4 (Minor Heading)** | `18px` | `600` (Semi-bold) | `1.4` | Small card titles, accordion row triggers, specification titles. |
| **Lead Paragraph** | `15px` – `16px` | `400` (Regular) | `1.55` | Section subtitle immediately beneath H2. Muted slate (`#64748B`). |
| **Body (P)** | `16px` (Desktop) / `14px` (Cards) | `400` (Regular) | `1.6` | Standard long-form copy. Secondary slate (`#393a3b` or `#475569`). |
| **Kicker / Badge** | `11px` – `13px` | `600` (Semi-bold) | `1.0` | Category kickers (e.g. `GET STARTED`, `PREDICTIVE HVAC INTELLIGENCE`). Uppercase, tracking `0.08em` – `0.12em`. |

#### Strict Typography Guardrails
* **No Faux Italics:** Do not italicize body text, headings, or card titles. Italics are reserved exclusively for legal disclaimers or direct client quotes.
* **No All-Caps Paragraphs:** All-caps is prohibited for any text longer than 4 words.
* **No Uncontrolled Type Jumps:** Never insert random heading sizes (e.g. 27px, 39px, 62px) outside this scale.

### 3.3 Container Geometry & Spacing Rhythm

* **Container Max Width:** `100%` width with responsive padding `[USER-MANDATED]`.
* **Desktop Container Side Padding:** **`100px`** `[USER-MANDATED]`. Content aligns from `left: 100px` to `right: 100px`.
* **Tablet Container Side Padding:** **`40px`** (Viewport `<= 1200px`).
* **Mobile Container Side Padding:** **`20px`** (Viewport `<= 768px`).
* **Vertical Section Rhythm:** Major sections must have `60px` to `80px` padding top and bottom. Do not collapse section padding below `50px` or expand beyond `100px`.
* **Heading-to-Content Spacing:** Exactly `32px` to `40px` between section header groups and the following grid or card.

### 3.4 Corner Radii & Elevation Philosophy

* **Corner Radii Token Scale:**
  * Small / Medium Controls & Cards: **`4px` – `5px`** (`--radius-sm: 5px`, `--radius-md: 5px`).
  * **Mandatory 5px Corner Radius Rule [USER-MANDATED]:** Every card container, card surface, and image corner radius must strictly be **`5px` at all times** (`border-radius: 5px;`). When client or design mockup examples display hyper-rounded corners (e.g. 16px, 20px, 24px), adapt and standardize them strictly to `5px` in compliance with the AHI Carrier design system.
  * Pills / Status Badges: **`9999px`** (`--radius-full: 9999px`) — used *only* for filter chips, scope badges, and the top utility search bar.
  * **Strict Ban on Hyper-Rounded Cards:** Never give standard cards `16px`, `24px`, or `32px` corner radii. AHI Carrier's visual language is precise, architectural, and grounded.
* **Elevation & Shadows:**
  * Base Card: `0 1px 3px rgba(0, 0, 0, 0.04)`.
  * Hover Lift Card: `0 10px 24px -4px rgba(16, 47, 88, 0.08)`.
  * Mega Menu & Popovers: `0 20px 45px -8px rgba(16, 47, 88, 0.18), 0 8px 16px -4px rgba(16, 47, 88, 0.08)`.
  * **Strict Ban on Heavy Black Dropshadows:** Never use opaque black shadows (`rgba(0,0,0,0.3)` or larger). Shadows must incorporate the navy undertone (`rgba(16, 47, 88, ...)`).

---

## 4. Strict Anti-AI-Slop Prohibitions

This section catalogs the exact patterns produced by generative AI that are **explicitly forbidden** on the AHI Carrier codebase.

```
+--------------------------------------------------------------------------------+
|                           THE AI-SLOP PROHIBITION MATRIX                       |
|                                                                                |
|   DO NOT:                                    DO INSTEAD:                       |
|   -----------------------------------        -------------------------------   |
|   x Repetitive 3-card grids everywhere       v Purpose-built engineering UI    |
|   x Floating purple/cyan gradient blobs      v Solid architectural #163865     |
|   x Glassmorphism & backdrop blur            v Clean opaque white & grey cards |
|   x Generic stock handshakes & cartoon svgs  v Authentic industrial machinery  |
|   x "Transforming HVAC Paradigms"            v Specific NZ technical scopes    |
|   x Hallucinated "12-minute response"        v Verified 24/7 Auckland dispatch |
|   x Dead buttons with href="#"               v Valid anchors or form targets   |
|   x Reinventing the Header or Footer         v Reusing the locked components   |
+--------------------------------------------------------------------------------+
```

### 4.1 Visual Anti-Patterns

1. **The "Every Section Is a 3-Card Grid" Fatigue:**
   * *The Slop:* Splitting every section (Features, Benefits, Process, Industries, Technology) into an identical row of three rounded cards with a top icon, bold title, and two sentences of placeholder copy.
   * *The Standard:* Vary the layout architecture based on information purpose:
     * Structured technical steps belong in numbered horizontal pipelines or progressive disclosure accordions.
     * Technical parameters belong in clean, banded specification comparison tables.
     * Service spotlights belong in 2-column balanced photo-content containers.
     * Scope selections belong in multi-choice radio-pill grids.

2. **Gradients, Glassmorphism & Neon Glows:**
   * *The Slop:* Frosted glass containers (`backdrop-filter: blur(10px)`), iridescent pastel borders, ambient glowing background circles, or cyan-to-purple gradient text.
   * *The Standard:* Pure, crisp enterprise surfaces. Solid `#ffffff` cards on neutral `#f8fafc` or `#F3F4F5` backdrops. Borders are crisp `1px solid #E2E8F0`. Highlights use brand `#163865` or high-contrast white.

3. **Random Abstract Tech Illustrations:**
   * *The Slop:* Generic vector isometric servers, 3D clay hands holding air conditioners, or floating AI robots.
   * *The Standard:* Real commercial engineering imagery. Heavy centrifugal chillers, commercial rooftop packaged units, real manifold gauges, vibration sensors, electrical control cabinets, and certified technicians working on site.

4. **Excessive Micro-Interactions & Scroll-Jacking:**
   * *The Slop:* Parallax scroll-jacking, elements flying in from four different screen edges, infinite bounce icons, or elements that rotate 360° on hover.
   * *The Standard:* Subtle, purposeful feedback. Hover transitions must stay within `150ms` – `220ms` with `ease-out` timing, limited to color shifts, subtle border-color adjustments, or a restrained `translateY(-2px)` to `translateY(-4px)` lift.

### 4.2 Content & Copywriting Anti-Patterns

1. **Hollow Marketing Buzzwords:**
   * *The Slop:* "Unlocking Next-Gen Synergies in Climate Equilibrium", "Revolutionizing Temperature Paradigms for Tomorrow's World".
   * *The Standard:* Concrete industrial HVAC terminology: "Emergency centrifugal chiller compressor overhaul", "Vibration analysis & bearing degradation telemetry", "Refrigerant leak detection & R22 phase-out transitions".

2. **Invented Statistics & Performance Claims:**
   * *The Slop:* "Guaranteed 99.999% uptime", "Technicians arrive in under 14 minutes anywhere in NZ", "98.4% energy reduction guaranteed".
   * *The Standard:* Truthful, defensible service descriptions: "24/7 emergency technician dispatch across Auckland and New Zealand nationwide", "Genuine Carrier and Toshiba OEM spare parts", "Factory-certified industrial HVAC service engineers".

3. **Repetitive Content Loops:**
   * *The Slop:* Repeating the same claim ("We respond fast and have great parts") under four different headings on the same page.
   * *The Standard:* Every section must earn its place by answering a distinct engineering question:
     * *Hero:* What is the service and how do I immediately request it?
     * *What It Is:* What physical technical actions are performed on the plant?
     * *Process:* What happens chronologically from first call to plant sign-off?
     * *Equipment Covered:* Which specific machinery classes are supported?
     * *Form:* How do I submit my site details, equipment type, and urgency level?

### 4.3 UX & Interaction Anti-Patterns

1. **Dead Buttons & Non-Functional Pills:**
   * *The Slop:* Buttons that trigger empty `#` jumps, pills that look like toggle switches but do nothing, or tabs that change styles without updating the content panel.
   * *The Standard:* Every interactive element must be fully wired. If an element cannot be acted upon, it must be rendered as a static tag, not a clickable control.

2. **Input Field Bloat & Hostile Forms:**
   * *The Slop:* Requiring 15 mandatory fields, CAPTCHAs that fail, unmasked phone fields, or hiding labels inside placeholder text that disappears upon typing.
   * *The Standard:* The AHI Carrier Enquiry Form standard:
     * Visible, permanent labels above every input.
     * Two-column desktop grid grouping related technical inputs.
     * Clickable interactive facility type selector pills with accessible radio attributes.
     * Clear validation messages in `--ahi-red-error` (`#c73b3b`).

3. **Mega Menu Usability Traps:**
   * *The Slop:* Dropdowns that snap shut the millisecond the mouse moves 1 pixel off course, or hover menus that cannot be accessed on touchscreens.
   * *The Standard:* The AHI Carrier Commercial Mega Menu standard:
     * Opens on explicit click of the "Commercial" menu item.
     * Provides an generous mouse-boundary buffer with a `220ms` debounce timer before closing when moving away from both the navbar and menu container.
     * Includes an explicit `×` close button, closes on outside click, and closes on <kbd>Escape</kbd>.

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

### E. Unique Page Structure & Information Architecture

Every AHI Carrier service page must have its own distinct page structure, section sequence, and content hierarchy based on the specific service, its purpose, and user requirements.

#### Mandatory Guidelines:
1. **Never Repeat Section Sequence Across Different Service Pages:** Do not repeat the same section structure or sequence across different service pages.
2. **No Predefined Middle Templates:** Do not force every service page into a predefined template.
3. **Analyze Before Structuring:** Analyze the purpose, target audience, user needs, and service-specific information before deciding the page structure.
4. **Relevance-Driven Selection:** Select and arrange sections according to their relevance and importance to that particular service.
5. **Purpose-Driven Content:** Give every section a clear purpose and avoid unnecessary or repetitive content.
6. **Information-Matched Visual Layouts:** Use different visual layouts depending on the information being presented (e.g., interactive schematics, comparative spec matrices, chronological diagnostic flows, metric scorecards).
7. **Service-Specific Content Inclusions:** Include service-specific sections — such as technical diagnostic processes, efficiency benchmarks, proprietary monitoring technologies, equipment compatibility matrices, industry-specific compliance standards, verified engineering case studies, or structured service agreement tiers — wherever relevant.
8. **No Artificial Length Matching:** Do not add sections simply to maintain the same page length as other service pages. A rapid emergency dispatch page must be immediate and urgent; a comprehensive preventive maintenance or predictive intelligence page must be analytical and consultative.
9. **Visual Distinction Within Brand Uniformity:** Maintain consistent global components and the AHI Carrier design system without making the middle content sections look identical.

#### Page Design Approach (Pre-Design Protocol):
Before designing any new service page:
* **Step 1: Understand the service and its objectives** (What operational problem does it solve for facility managers?).
* **Step 2: Identify the information visitors need** (What technical facts, dispatch guarantees, or equipment capabilities do they search for?).
* **Step 3: Define the appropriate sections and their sequence** (Determine the natural mental model of the decision-maker).
* **Step 4: Establish the content hierarchy** (Prioritize critical decision points above secondary technical details).
* **Step 5: Select the most suitable visual layout for each section** (Match layout geometry to data shape).
* **Step 6: Design the complete page while maintaining brand consistency** (Unify through tokens, typography, and the 5 locked master components).

#### The Core Architectural Formula:
```
+-----------------------------------------------------------------------------------------+
|                                 THE CORE PRINCIPLE                                      |
|                                                                                         |
|       GLOBAL DESIGN CONSISTENCY + UNIQUE PAGE STRUCTURE + SERVICE-SPECIFIC VISUAL DESIGN|
|                                                                                         |
|  Every service page must feel like part of the same AHI Carrier website, but its content|
|  flow, section arrangement, and visual experience must be tailored to its individual   |
|  service.                                                                               |
|                                                                                         |
|  >> NEVER USE ONE REPEATED PAGE TEMPLATE FOR ALL SERVICE PAGES. <<                      |
+-----------------------------------------------------------------------------------------+
```

---

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

## 6. Service-Specific Architecture Blueprint (Demonstrating Distinct Structures)

To prevent AI models and developers from applying a single repeated middle template, the table below illustrates how different AHI Carrier service pages must possess **completely distinct section flows, content hierarchies, and visual layouts**, while strictly preserving the 5 Locked Global Components:

| Service Page | Primary User Need | Distinct Middle Section Sequence (Unique to Service) | Specialized Layout Types Used |
|---|---|---|---|
| **Emergency HVAC Repair** (`index.html`) | Immediate operational panic; urgent plant failure restoration; finding immediate phone dispatch. | 1. **Immediate Scope Triage** (24/7 Dispatch Banner)<br>2. **Common Plant Emergencies We Resolve** (Critical failure modes)<br>3. **Why AHI Carrier Rapid Response** (Nationwide technician network)<br>4. **Response Protocol & Resolution Timeline** (Chronological dispatch steps)<br>5. **Critical Machinery Restored** (Compressors, Chillers, AHUs)<br>6. **Nationwide Coverage Map / Facilities** (Auckland & NZ-wide readiness) | • Urgent 2-column split banner with direct click-to-call<br>• Compact high-contrast emergency card matrix<br>• Timeline process flow with urgent response indicators<br>• Facility pill selector directly bound to urgent booking |
| **Predictive Maintenance** (`predictive-maintenance.html`) | Long-term asset protection; preventing catastrophic downtime; understanding IoT telemetry and vibration analysis. | 1. **What Is Predictive Maintenance?** (Telemetry vs reactive)<br>2. **Why Predictive Maintenance Matters** (Financial & downtime data banner)<br>3. **4-Stage Predictive Workflow** (Sensor -> Cloud -> Analysis -> Action)<br>4. **Key Engineering Benefits** (Lifecycle extension, cost reduction)<br>5. **Mission-Critical Industries Supported** (Data centers, healthcare, cold storage)<br>6. **Commercial Case Study** (Measured energy & failure reduction)<br>7. **Monitoring Technology & Diagnostics** (Vibration, oil, thermal imaging)<br>8. **Equipment Monitored** (Centrifugal, screw, scroll, rooftop chillers)<br>9. **Why Choose AHI Carrier Telemetry** (Factory OEM algorithms) | • Analytical split hero with consultation CTA<br>• High-density statistical metrics banner<br>• Technical sensor-to-cloud architectural diagram<br>• Industrial application grid with environmental tolerances<br>• Detailed engineering case study scorecard<br>• Machinery telemetry specification matrix |
| **Chiller Optimization & Modernization** (Future Vertical) | Energy efficiency audits; reducing kWh consumption; planning R22 refrigerant phase-out compliance. | 1. **System Energy Assessment** (Audit scope & baseline analysis)<br>2. **Retrofit vs. Replacement Decision Matrix** (Lifecycle ROI calculation)<br>3. **VFD & Intelligent Compressor Retrofits** (Variable speed conversions)<br>4. **Refrigerant Transition Roadmaps** (R22/R134a to low-GWP refrigerants)<br>5. **BMS & Controls Upgrades** (Carrier i-Vu building integration)<br>6. **Energy Efficiency Rebates & NZ Compliance** (EECA standards) | • Interactive ROI / Energy efficiency benchmark table<br>• Comparative 2-column technical retrofit vs replace matrix<br>• Regulatory phase-out compliance timeline<br>• BMS architecture integration schematic |
| **Planned HVAC Maintenance** (Future Vertical) | Budgetable annual maintenance agreements; statutory building warrant of fitness (BWOF) compliance; scheduled service intervals. | 1. **Maintenance Tier Comparison** (Essential, Comprehensive, Total Care)<br>2. **Standard Inspection Scope Checklist** (Quarterly, semi-annual, annual checks)<br>3. **Statutory BWOF & Compliance Reporting** (NZ building code compliance)<br>4. **Genuine OEM Carrier/Toshiba Parts Assurance** (Inventory access)<br>5. **Service Level Agreement (SLA) Options** (Guaranteed response windows) | • Multi-tier pricing and service SLA comparison table<br>• Interactive compliance inspection checklist accordion<br>• Spare parts logistics badge & distribution network grid |

```
+-----------------------------------------------------------------------------------------+
|                              THE ARCHITECTURAL INVARIANT                                |
|                                                                                         |
|  [LOCKED GLOBAL COMPONENT 1: Top Utility Bar + Main Navigation + Commercial Mega Menu]  |
|  [LOCKED GLOBAL COMPONENT 2: Full-Bleed Industrial Hero Section (Service-Tailored Copy)]|
|  =====================================================================================  |
|                                                                                         |
|      >>> UNIQUE, BESPOKE MIDDLE CONTENT SECTIONS TAILORED SPECIFICALLY TO SERVICE <<<   |
|      (Varying in section count, layout geometry, diagrammatic style, and data flow)     |
|                                                                                         |
|  =====================================================================================  |
|  [LOCKED GLOBAL COMPONENT 3: Two-Column Asymmetric Enquiry Form (Service Scope Pills)]  |
|  [LOCKED GLOBAL COMPONENT 4: Final CTA Section Immediately Above Footer (Explore Grid)] |
|  [LOCKED GLOBAL COMPONENT 5: Multi-Tier Universal Corporate Footer & Legal Sub-Footer]  |
+-----------------------------------------------------------------------------------------+
```

---

## 7. AI Pre-Flight Quality Gate & Self-Review Checklist

Before any AI model, subagent, or developer marks a task as complete or writes code to production files, they must verify every item on this checklist:

### 1. Token & Palette Audit
- [ ] Are all navy fills strictly `#163865` or `#102F58`?
- [ ] Is all body copy rendered in `#393a3b` or `#475569` (and **never** `#000000`)?
- [ ] Is error red (`#c73b3b`) used **only** for destructive alerts and validation?
- [ ] Are there **zero** random Tailwind/Bootstrap palette colors (no cyan, purple, lime, or amber)?

### 2. Geometry & Spacing Audit
- [ ] Does the desktop container have exactly `100px` left and right padding?
- [ ] Does the tablet breakpoint (<=1200px) use exactly `40px` container padding?
- [ ] Does the mobile breakpoint (<=768px) use exactly `20px` container padding?
- [ ] Are all card and button border radii set to `4px` or `5px` (no random `16px` or `24px` curves)?

### 3. Component Integrity Audit
- [ ] Are the 5 locked master components (Header, Hero, Form, Explore Services, Footer) preserved verbatim?
- [ ] Does the Commercial Mega Menu span `left: 100px; right: 100px;` across the full desktop container width?
- [ ] Does the mega menu open on click and automatically close when the mouse leaves both navbar and menu?
- [ ] Are all 4 mega menu categories populated with their exact reference assets and links?

### 4. Content & Copy Audit
- [ ] Are all technical claims and service descriptions authentic to New Zealand commercial HVAC?
- [ ] Are there zero hallucinated response times, fake client reviews, or unverified statistical claims?
- [ ] Are all headings concrete, informative, and free of generic AI buzzwords?

### 5. Multi-Device & Accessibility Audit
- [ ] Does every text pairing meet WCAG 2.1 AA standards (minimum 4.5:1 for body copy)?
- [ ] Do all interactive controls have a minimum touch target of `44px × 44px` on mobile?
- [ ] Are all input fields paired with permanent visible labels above the input?
- [ ] Do all interactive buttons have functioning targets rather than dead `href="#"` anchors?

---

> **Final Invariant:** If an AI model or developer is uncertain about a layout, spacing, or component requirement, **ask for clarification or refer directly to the approved reference images in `Reference files/`**. Never improvise, hallucinate, or substitute generic patterns for AHI Carrier standards.

