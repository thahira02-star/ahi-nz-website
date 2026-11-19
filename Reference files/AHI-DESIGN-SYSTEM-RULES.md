# AHI Carrier NZ — Digital Design System Rules

> **Document Reference:** `TZ-AHI-DS-v1-10-26` (Version 1.0, October 2026, Prepared by Trizions Group)  
> **Compiled:** 15 November 2026  
> **Purpose:** Reusable design specification for building new AHI Carrier NZ service pages (starting with Emergency HVAC Repair).

---

## Provenance Key

Every specification below is tagged with its origin:

| Tag | Meaning |
|-----|---------|
| **`[SOURCE]`** | Taken directly from the AHI Carrier Design System PDF (`TZ-AHI-DS-v1-10-26`). Treat as mandatory. |
| **`[PROPOSED]`** | Added by Trizions in the design system to complete the system; requires client confirmation but should be followed until overridden. |
| **`[OBSERVED]`** | Not in the PDF but consistently observed across all 3 live service pages (Chiller, Planned HVAC, Preventative). Treat as established pattern. |

> [!IMPORTANT]
> The Design System PDF is the **primary source of truth**. Where the PDF and live pages conflict, the PDF specification takes precedence. Observed values fill gaps only.

---

## 1. Brand Colours & Colour Usage

### 1.1 Core Colour Tokens `[SOURCE]`

| Token | HEX | Role | Contrast on White | WCAG |
|-------|------|------|-------------------|------|
| **Primary** | `#163865` | Primary buttons, key headings, active states, brand moments | 11.7 : 1 | AAA |
| **Secondary** | `#393a3b` | Body copy, secondary UI. **Never use pure `#000000` for body.** | 11.4 : 1 | AAA |
| **Tertiary** | `#ffffff` | Page surfaces, card backgrounds | — | Background |
| **Neutral** | `#f5f7fa` | Section backgrounds, card backgrounds, table row banding | — | Background |
| **Error** | `#c73b3b` | Validation errors and destructive actions **only** | 5.1 : 1 | AA |
| **Black** | `#0d0d0d` | Where true black is needed. **Never use `#000000`.** | 19.4 : 1 | AAA |

### 1.2 Interaction States (Primary Hover Tones) `[SOURCE]`

| State | HEX | Usage |
|-------|------|-------|
| Default | `#163865` | Resting state |
| Hover 1 | `#4b6890` | Hover tone option 1 |
| Hover 2 | `#355782` | Hover tone option 2 |
| Hover 3 | `#22456e` | Hover tone option 3 |

> Rule: Pick **one** hover tone per component family and keep it consistent site-wide.

### 1.3 Supplementary Colours (Observed on Live Pages) `[OBSERVED]`

| Token | HEX | Observed Usage |
|-------|------|----------------|
| Navy Dark (Form Panel) | `#102F58` – `#13335E` | Left-column dark form card, subtle depth |
| Blue Accent | `#0284C7` | Active radio indicators, selected scope checkmarks |
| Blue Tint | `#EFF6FF` | Active accordion row fill, icon circle backgrounds |
| Surface Grey | `#F3F4F5` | Full-width form section wrapper |
| Footer Grey | `#F3F3F3` | Footer container background |
| Card Border | `#E2E8F0` | 1px border on white cards, inputs, filter pills |
| Heading Charcoal | `#0F172A` | H1/H2 on light backgrounds |
| Body Text | `#475569` | Regular paragraph text |
| Muted Text | `#64748B` | Subtitles, descriptions |
| Placeholder Text | `#9CA3AF` | Form field placeholders |
| Brand Red (Logos) | `#ED1A2E` | Toshiba & Totaline partner logos only |

### 1.4 Colour Usage Rules `[SOURCE]`

- Use Primary (`#163865`) for primary buttons, key headings, active states, and brand-defining moments.
- Use Secondary (`#393a3b`) for body copy. **Do not use pure black.**
- Use Neutral (`#f5f7fa`) for section backgrounds and alternating table rows.
- Use Error (`#c73b3b`) **only** for validation messages and destructive actions — never for decorative accents or CTA buttons.
- Avoid saturated accent colours that compete with the primary.
- Do not add new colours without a formal change request.

### 1.5 Approved Contrast Pairings (WCAG 2.1) `[SOURCE]`

| Foreground | Background | Ratio | Rating |
|------------|------------|-------|--------|
| `#ffffff` | `#163865` | 11.7 : 1 | AAA |
| `#393a3b` | `#ffffff` | 11.4 : 1 | AAA |
| `#393a3b` | `#f5f7fa` | 10.6 : 1 | AAA |
| `#163865` | `#f5f7fa` | 10.9 : 1 | AAA |
| `#ffffff` | `#c73b3b` | 5.1 : 1 | AA |
| `#c73b3b` | `#ffffff` | 5.1 : 1 | AA |
| `#0d0d0d` | `#ffffff` | 19.4 : 1 | AAA |
| `#0d0d0d` | `#f5f7fa` | 18.1 : 1 | AAA |

---

## 2. Typography

### 2.1 Typeface `[SOURCE]`

- **Primary Font Family:** `Montserrat`
- **Weights in Use:** `600` (Semi-bold) for headlines, hierarchy, actions · `400` (Regular) for long-form body copy
- **Fallback Stack (observed):** `Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif` `[OBSERVED]`

### 2.2 Type Scale `[SOURCE]`

| Level | Font | Size | Weight | Usage |
|-------|------|------|--------|-------|
| **H1** | `Montserrat` | `50px` | `600` | Page titles, hero headings |
| **H2** | `Montserrat` | `34px` | `600` | Section titles |
| **H3** | `Montserrat` | `20px` | `600` | Sub-section headings |
| **H4** | See note ¹ | `18px` | `600` | Minor headings, card titles |
| **Body (P)** | `Montserrat` | `16px` | `400` | Long-form body copy |

> ¹ **H4 Flag `[SOURCE]`:** The client specification originally set H4 in `-apple-system` while the rest uses `Montserrat`. Flagged for confirmation — recommend `Montserrat` for consistency.

### 2.3 Supplementary Type Observations `[OBSERVED]`

| Element | Size | Weight | Colour | Notes |
|---------|------|--------|--------|-------|
| Hero H1 (on dark) | 38–42px | 700 | `#ffffff` | Line-height ~1.2, tracking −0.02em |
| Hero Subtitle | 15–16px | 400 | `#E2E8F0` | Line-height 1.5 |
| Section Lead | 15–16px | 400 | `#64748B` | Muted subtitle beneath H2 |
| Card Title | 16–17px | 600–700 | `#0F172A` | — |
| Card Body | 13–14px | 400 | `#475569` | Line-height 1.55–1.6 |
| Kicker / Badge | 11–13px | 600 | Varies | Uppercase, tracking-widest |
| Nav Links | 14px | 500 | `#0F172A` | — |

### 2.4 Type Rules `[SOURCE]`

- Keep headlines concise and high-contrast.
- Maintain consistent font use across the site.
- No italics in core UI; reserve for editorial quotes only. `[OBSERVED]`
- Use sentence case for body; uppercase reserved for kicker labels and button badges. `[OBSERVED]`

### 2.5 Specifications Not in Document

Line heights and letter spacing for H1–H4 and Body: **Not specified in the design system PDF.**

---

## 3. Spacing Scale `[SOURCE]`

| Token | Value |
|-------|-------|
| `xs` | `2px` |
| `sm` | `4px` |
| `md` | `8px` |
| `lg` | `16px` |
| `xl` | `32px` |

### 3.1 Section Spacing (Observed Rhythm) `[OBSERVED]`

| Element | Value |
|---------|-------|
| Major section vertical padding | `60px` – `80px` |
| Heading to content gap | `32px` – `40px` |
| Heading to subtitle gap | `8px` – `12px` |
| Card internal padding | `24px` – `32px` |

---

## 4. Grid & Layout `[SOURCE]` + `[OBSERVED]`

### 4.1 Layout Principle `[SOURCE]`

Centred, wide desktop grid with generous whitespace to improve readability and hierarchy.

### 4.2 Container & Viewport `[OBSERVED]`

| Property | Value |
|----------|-------|
| Desktop viewport | `1440px` |
| Container max-width | `1290px` – `1300px` |
| Page side margins | `75px` (derived: `(1440 − 1290) / 2`) |

### 4.3 Column Grids `[OBSERVED]`

| Grid | Card Width | Gap | Usage |
|------|-----------|-----|-------|
| **1-column** | Full container | — | Centered headings, CTA banners |
| **2-column 50/50** | ~635px each | 20px | Photo + content sections, plan comparisons |
| **2-column asymmetric** | 530px (41%) / 760px (59%) | 0 | Form card (dark panel + white form) |
| **3-column** | ~407px each | 34px | Benefit cards, industry grids |
| **4-column** | ~305px each | 24px | "Explore Other Services", icon benefit grids |

### 4.4 Full-Width vs Contained Sections `[OBSERVED]`

- **Full-width:** Top utility bar, main nav, hero background, dark navy feature sections, form wrapper (`#F3F4F5`), footer (`#F3F3F3`).
- **Contained (1290px):** All text and card content, floating form card, pre-footer CTA banner.

### 4.5 Specifications Not in Document `[SOURCE]`

Columns, gutters, breakpoints, and container widths: **Not specified in the design system PDF** beyond "centred, wide desktop grid."

---

## 5. Buttons & Links

### 5.1 Button Specifications `[SOURCE]`

| Property | Primary | Secondary |
|----------|---------|-----------|
| Fill | `#163865` (solid) | `#ffffff` |
| Text | `#ffffff` | `#163865` |
| Border | None | `1px solid #163865` |
| Height | `48px` `[PROPOSED]` | `48px` `[PROPOSED]` |
| Border-radius | `8px` `[PROPOSED]` | `8px` `[PROPOSED]` |
| Horizontal padding | `16px` (lg token) | `16px` (lg token) |
| Min touch target | `44 × 44px` | `44 × 44px` |

> **Primary Button Rule `[SOURCE]`:** One per view. Use for the main action.  
> **Secondary Button Rule `[SOURCE]`:** Supporting actions next to a primary button.

### 5.2 Button States `[SOURCE]`

| State | Treatment |
|-------|-----------|
| Default | `#163865` |
| Hover (pick one per family) | `#4b6890` / `#355782` / `#22456e` |
| Disabled | Neutral fill (`#f5f7fa`), muted text, subtle border |

### 5.3 Button Label Rules `[SOURCE]`

- Sentence case, one to three words.
- Avoid over-rounded controls or playful shapes.

### 5.4 Observed Button Variants `[OBSERVED]`

| Variant | Background | Text | Radius | Height | Context |
|---------|-----------|------|--------|--------|---------|
| Primary Navy | `#163865` | `#ffffff` | `4px` | ~40px | Plan proposals, form submit |
| Hero Inverted | `#ffffff` | `#163865` | `4px` | ~35px | Hero CTA "Request a Service" |
| Nav CTA | `#163865` | `#ffffff` | `4px` | ~32px | "SEND ENQUIRY" header button |
| Form Submit | `#163865` | `#ffffff` | `4px` | ~42px | Full-width "Book maintenance service →" |
| Secondary Outline | Transparent | `#ffffff` | `4px` | ~40px | Pre-footer "Get Free Consultation" |
| Banner Accent | `#264670` | `#ffffff` | `4px` | ~40px | Pre-footer "Explore Products →" |
| Ghost/Link | Transparent | `#163865` | — | Inline | "Learn More →", "view all services" |

> [!NOTE]
> **Radius discrepancy:** The PDF specifies `8px` (Proposed), but live pages consistently use `4px`. Clarify with client which to adopt going forward.

### 5.5 Link Styles `[SOURCE]`

| Property | Value |
|----------|-------|
| Background | None |
| Text colour | `#393a3b` (Secondary) |
| Decoration | Underlined |
| Usage | Inline and low-emphasis actions |
| Hover state | Not specified in document |

---

## 6. Card Styles

### 6.1 Base Card Specification `[SOURCE]`

| Property | Value |
|----------|-------|
| Background | `#ffffff` (Tertiary) |
| Corner radius | `10px` |
| Border | `0px none` (no border) |
| Shadow | `Sm` (small subtle elevation) |

### 6.2 Card Rules `[SOURCE]`

- Cards sit on white (`#ffffff`) or neutral (`#f5f7fa`) surfaces.
- Keep corner radius and padding identical across a page.
- **Do not nest cards inside cards.**
- Padding: Not specified in document (must be consistent).

### 6.3 Observed Card Taxonomy `[OBSERVED]`

#### A. Standard Benefit Card (White Outlined)
- Background: `#ffffff`, Border: `1px solid #E2E8F0`, Radius: `8px`
- Padding: `24–32px`, Shadow: `0 1px 3px rgba(0,0,0,0.04)`
- Content: Outline icon (24px) → Bold title (16px) → Muted description (14px)

#### B. Image Feature Card (Services Grid)
- Top: Photo at `16:9` ratio, top corners rounded (`8px 8px 0 0`)
- Bottom: White container, `20px` padding
- Title: 16–17px bold · Excerpt: 13–14px regular
- Action: `"Learn More →"` in navy `#163865` semi-bold
- Hover: Subtle lift (`translateY(-4px)`) with shadow expansion

#### C. Dark Navy Feature Card
- Background: `#163865`, all text in white
- CTA: White button with navy text (`"Download Brochure →"`)

#### D. Plan Comparison Cards
- **Standard:** White background, `1px solid #E2E8F0`, outlined badge pill
- **Premium (Featured):** Navy gradient (`#163865` → `#335178`), all-white text, white button with navy text, solid white badge pill

> [!NOTE]
> **Radius discrepancy:** PDF specifies `10px`, live pages show `8px`. Clarify with client.

---

## 7. Form & Input Styles `[PROPOSED]`

### 7.1 Input Field Specifications

| Property | Value |
|----------|-------|
| Height | `48px` (matches button height) |
| Border-radius | `8px` (matches button radius) |
| Padding | `12px` vertical / `16px` horizontal |
| Default border | `1px solid #393a3b` |
| Focus border | `2px solid #163865` (Primary) |
| Error border | `2px solid #c73b3b` (Error) |
| Disabled | Neutral muted fill, muted text, subtle border |

### 7.2 Labels & Error Messages `[PROPOSED]`

- **Label position:** Above the field, always visible.
- **Label typography:** `Montserrat`, `16px`, `#393a3b`.
- **Rule:** Every field has a visible label. **Do not use placeholder text as a label.**
- **Error text:** Below the field, in `#c73b3b`, with a specific fix explanation.

### 7.3 Form Layout Rules `[PROPOSED]`

- Mark optional fields, not required ones.
- Show error messages next to the field and summarise errors at the top of long forms.
- Single column on mobile and for forms under 8 fields.

### 7.4 Observed Form Patterns `[OBSERVED]`

| Element | Observed Value |
|---------|----------------|
| Input height (live) | `40px` |
| Input border (live) | `1px solid #E2E8F0` |
| Input radius (live) | `4px` |
| Input padding (live) | `8px 12px` |
| Input font size | `14px` |
| Form layout | 2-column grid on desktop |
| Facility type selection | Pill-button grid with radio indicator |
| Form card structure | 2-column asymmetric: dark navy info panel (41%) + white form (59%) |

---

## 8. Tables `[SOURCE]`

| Element | Specification |
|---------|---------------|
| Header row background | `#163865` (Primary) |
| Header text | `#ffffff` |
| Banded rows | Alternate rows use `#f5f7fa` (Neutral) |
| Vertical rules | **None** (no vertical rules) |

---

## 9. Elevation & Shadows `[SOURCE]`

| Token | Usage | Exact Value |
|-------|-------|-------------|
| `Sm` | Cards, raised surfaces | To confirm |
| `Md` | Dropdowns, popovers | To confirm |
| `Lg` | Dialogs | To confirm |
| `Xl` | Reserved | To confirm |
| `Inner` | Pressed/inset states | To confirm |

> **Rule `[SOURCE]`:** Prefer subtle borders and tonal changes over dramatic elevation. Shadows are small and used strictly to separate a surface from its background.

---

## 10. Iconography `[PROPOSED]`

| Property | Value |
|----------|-------|
| Style | Outline, line icons only |
| Stroke width | `1.5px` |
| Sizes | `16px` / `20px` / `24px` |
| Default colour | `#393a3b` (Secondary) |
| Active colour | `#163865` (Primary) |
| Alert colour | `#c73b3b` (Error) |

### 10.1 Icon Rules `[PROPOSED]`

- Use **one icon set** across the product. Do not mix filled and outline styles.
- Pair every icon with a text label unless the meaning is universal.
- Do not use emoji as icons.

### 10.2 Observed Icon Patterns `[OBSERVED]`

- Icons placed inside light blue circular containers (`#EFF6FF`, diameter `36–40px`).
- Step indicator badges: Solid `#163865` circles, diameter `44px`, white bold numerals.
- Oversized step numerals (`01`, `02`, `03`): Light steel blue `#93C5FD`, 38–44px, weight 700.
- Icon stroke weight on live pages: `1.5–2px`.

---

## 11. Imagery `[PROPOSED]`

### 11.1 Content Guidelines

- Use real product, project, and people photography. Clear, well-lit, uncluttered.
- Keep a consistent crop and aspect ratio within a page.

### 11.2 Avoid

- Stock images that do not show actual products.
- Heavy filters, textures, decorative overlays.
- Text baked into images.
- File size over **500 KB** above the fold.

### 11.3 Accessibility

- Add descriptive `alt` text to informative images.
- Use empty `alt=""` for decorative images.
- Compress and serve responsive sizes.

### 11.4 Observed Image Patterns `[OBSERVED]`

| Context | Aspect Ratio | Treatment |
|---------|-------------|-----------|
| Hero banners | 16:5 to 3:1 panoramic | Dark left-to-right gradient overlay: `linear-gradient(90deg, rgba(16,47,88,0.92) 0%, rgba(16,47,88,0.65) 45%, transparent 80%)` |
| Section photos | 4:3 or 1:1 | `8px` corner radius |
| Grid card photos | 16:9 landscape | Flush with card top, rounded top corners only |

- Photography style: Authentic NZ industrial/commercial HVAC technicians. Cool daylight, steel/grey tones harmonising with the navy UI palette.

---

## 12. Motion & Transitions `[PROPOSED]`

| Property | Value |
|----------|-------|
| Duration | `150–250ms` |
| Easing | `ease-out` |
| Allowed | Fade, colour change |
| **Disallowed** | Bounce, spring, parallax, scale on hover |

- Motion confirms an action; **never used for decoration.**
- Respect `prefers-reduced-motion`: remove transitions when active.

---

## 13. Accessibility (WCAG 2.1 AA) `[PROPOSED]`

| Requirement | Specification |
|-------------|---------------|
| Text contrast | ≥ 4.5 : 1 |
| Large text & UI components | ≥ 3 : 1 |
| Focus indicators | Every interactive element must have a visible focus style. **Never remove outline without a replacement.** |
| Touch targets | Minimum `44 × 44px` on touch screens |
| Colour independence | Never convey meaning with colour alone; pair with text or icon |
| Minimum body text | `16px` |
| Zoom support | Must support `200%` zoom without content loss |
| Forms | Visible labels, error messages linked to fields, logical tab order |

---

## 14. Navigation & Header `[OBSERVED]`

> Not specified as isolated components in the design system PDF. Below is documented from live pages.

### 14.1 Top Utility Bar

| Property | Value |
|----------|-------|
| Height | `57px` |
| Background | `#163865` |
| Left content | Globe icon + "Switch to Global" · divider · "Where to Buy" · Search bar (pill shape, `398 × 30px`, white fill) |
| Right content | Email link · Phone number · Social icons (Facebook, YouTube, LinkedIn — white glyphs) |

### 14.2 Main Navigation Bar

| Property | Value |
|----------|-------|
| Height | `82–85px` |
| Background | `#ffffff` with subtle bottom border |
| Logo | AHI (Navy) + Carrier oval (Blue `#283389`), left-aligned |
| Nav items | Home · About us · Products · Spare Parts · Commercial · Support |
| Nav typography | `14px`, weight `500`, `#0F172A` |
| Item spacing | `28–32px` horizontal gap |
| CTA button | "SEND ENQUIRY" — `#163865` fill, `#ffffff` text, `12px` semi-bold uppercase, `134 × 32px`, radius `4px` |

---

## 15. Footer `[OBSERVED]`

> Not specified in the design system PDF. Below is documented from live pages.

| Layer | Content |
|-------|---------|
| **Background** | Full-width `#F3F3F3` |
| **Link columns** | 6 taxonomy clusters (Carrier, Toshiba, Lifestyle Products, Services, Resources, Company) — `13px`, `#475569`, chevron prefix |
| **Genuine Parts card** | White card with partner logo lockup (Carrier + Toshiba + Totaline) and "Shop Genuine Parts" navy button |
| **Contact strip** | Follow us (social icons) · Ring us (`09 355 6720`) · Mail us · Locate us (Auckland address) |
| **Legal bar** | Copyright · Privacy Policy · Terms & Conditions · Legal · Site Map · "Crafted by Trizions Group" |

---

## 16. Recurring Page Components `[OBSERVED]`

### 16.1 Hero Section
- Full-bleed technician photography, `~500px` height.
- Dark left gradient overlay for text legibility.
- White H1, light subtitle, white CTA button ("Request a Service").

### 16.2 Pre-Footer CTA Banner
- Contained width (`1290px`), large border-radius (`28–32px`).
- Navy gradient background (`#153968` → `#264670`).
- White heading + subtitle, dual button pair (accent + outline).

### 16.3 "Explore Other Services" Grid
- 4-column image card grid with "Learn More →" links.
- "view all services" text link top-right.

### 16.4 Category Filter Chips (Preventative Page)
- Horizontal flex row, pill-shaped (`border-radius: 9999px`).
- White fill, `1px solid #CBD5E1`, icon + label.

### 16.5 Service Agreement Accordion
- Stacked rows with numbered indicators.
- Active row: `#EFF6FF` fill, navy circle with white number.
- Inactive row: white fill, grey border, grey circle.

---

## 17. Emergency HVAC Repair — Legacy Page Notes `[OBSERVED]`

> Documented from `Emergency HVAC Repair.pdf` for migration reference. These are **legacy patterns** that must be updated to the current design system.

| Legacy Element | Legacy Treatment | Design System Treatment |
|----------------|-----------------|------------------------|
| Red accent headings ("Trust", "Flexibility") | `#ED1A2E` red decorative accent | **Remove.** Red is reserved for errors only (`#c73b3b`). Use Primary `#163865` for emphasis. |
| Red CTA button ("Book a Service Call") | Bright red background | **Replace** with Primary navy button (`#163865`, white text). |
| Typography | System sans-serif (Arial/Helvetica) | **Replace** with `Montserrat` 600/400. |
| Footer CTA | Red pill button | **Replace** with navy primary button. |
| Layout | Single-column legacy layout | **Update** to centred 1290px container with multi-column grids. |

---

## 18. Specifications Not Provided

The following are **not specified** in the design system PDF. Do not invent values for these:

- Line height and letter spacing for H1–H4 and Body
- Exact shadow `box-shadow` values (Sm, Md, Lg, Xl, Inner)
- Responsive breakpoints and mobile grid specifications
- Exact container max-width (observed as ~1290px but not in PDF)
- Column counts and gutter widths (observed but not in PDF)
- Header and footer component specifications
- Animation keyframes or transition properties beyond duration/easing
- Dark mode specifications
- Z-index scale

---

> [!CAUTION]
> **Do not generate any website design or code from this document until explicit approval is given.** This document is a reference specification only.

---

## Appendix: Resolved Discrepancies (15 Nov 2026)

| # | Property | PDF Value | Resolved Value | Rationale |
|---|----------|-----------|---------------|-----------|
| 1 | Button border-radius | `8px` `[PROPOSED]` | **`4px`** | Unanimous live site evidence overrides unconfirmed proposal |
| 2 | Card border-radius | `10px` `[SOURCE]` | **`8px`** | Pending client approval — live site consistency preferred |
| 3 | H4 font family | `-apple-system` `[SOURCE]` | **`Montserrat`** | PDF itself flagged this anomaly; consistent font use rule applies |
| 4 | Button height | `48px` `[PROPOSED]` | **`40px` std / `44px` form** | Live site graduated scale; `44px` meets accessibility minimum |
| 5 | Input default border | `1px solid #393a3b` `[PROPOSED]` | **`1px solid #E2E8F0`** | Lighter border aligns with "subtle borders" philosophy and live site |

