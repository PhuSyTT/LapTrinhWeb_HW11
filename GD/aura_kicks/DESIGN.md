---
name: Aura Kicks
colors:
  surface: '#fbf8fc'
  surface-dim: '#dcd9dd'
  surface-bright: '#fbf8fc'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f2f7'
  surface-container: '#f0edf1'
  surface-container-high: '#eae7eb'
  surface-container-highest: '#e4e1e6'
  on-surface: '#1b1b1e'
  on-surface-variant: '#47464a'
  inverse-surface: '#303033'
  inverse-on-surface: '#f3f0f4'
  outline: '#78767b'
  outline-variant: '#c8c5ca'
  surface-tint: '#5f5e60'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#1c1b1d'
  on-primary-container: '#858386'
  inverse-primary: '#c8c6c8'
  secondary: '#b40065'
  on-secondary: '#ffffff'
  secondary-container: '#e10080'
  on-secondary-container: '#fffbff'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#211b00'
  on-tertiary-container: '#988300'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e5e1e4'
  primary-fixed-dim: '#c8c6c8'
  on-primary-fixed: '#1c1b1d'
  on-primary-fixed-variant: '#474649'
  secondary-fixed: '#ffd9e3'
  secondary-fixed-dim: '#ffb0ca'
  on-secondary-fixed: '#3e001f'
  on-secondary-fixed-variant: '#8d004e'
  tertiary-fixed: '#ffe24c'
  tertiary-fixed-dim: '#e2c62d'
  on-tertiary-fixed: '#211b00'
  on-tertiary-fixed-variant: '#524600'
  background: '#fbf8fc'
  on-background: '#1b1b1e'
  surface-variant: '#e4e1e6'
typography:
  display-xl:
    fontFamily: Syne
    fontSize: 64px
    fontWeight: '800'
    lineHeight: 68px
    letterSpacing: -0.03em
  display-xl-mobile:
    fontFamily: Syne
    fontSize: 40px
    fontWeight: '800'
    lineHeight: 44px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Syne
    fontSize: 44px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Syne
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 36px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Syne
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Syne
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 26px
    letterSpacing: -0.005em
  body-lg:
    fontFamily: Outfit
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Outfit
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 22px
  body-sm:
    fontFamily: Outfit
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Outfit
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 18px
    letterSpacing: 0.04em
  label-md:
    fontFamily: Outfit
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.06em
  label-sm:
    fontFamily: Outfit
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.08em
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  gutter: 1.5rem
  gutter-sm: 1rem
  gutter-lg: 2rem
  margin: 1.5rem
  margin-sm: 1rem
  margin-lg: 4rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2.5rem
---

## Brand & Style

This design system channels high-energy sneakerhead culture through an ethereal, luminous lens. Designed for modern footwear commerce, the aesthetic merges the tactile crispness of street culture with digital luxury. 

The aesthetic is anchored in **Glassmorphism & Luminous High-Contrast**:
- **Frosted Translucency:** Floating glass panels let vibrant background gradients bleed softly through, creating organic ambient warmth beneath razor-sharp interactive elements.
- **Pitch-Black Precision:** Deep charcoal and pure pitch black ground the lightness, delivering punchy editorial contrast, unmistakable CTA dominance, and high readability.
- **Hyper-Accent Vibrancy:** Strategic hits of neon magenta energize drop releases, price highlights, and interactive states.
- **Tactile Softness:** Fluid rounded geometry and pill elements balance the intense typography, evoking the cushioned ergonomics of performance footwear.

## Colors

The palette balances ethereal ambient lighting against razor-sharp streetwear contrast.

### Environmental Canvas
- **Background Gradient:** A continuous fixed diagonal mesh running from top-left to bottom-right: `#F9A8D4` (soft pink) via `#FEF08A` (warm solar yellow) to `#FFFFFF` (pure white).
- **Glass Surfaces:** Semi-transparent white containers ranging from `rgba(255, 255, 255, 0.65)` for standard floating cards to `rgba(255, 255, 255, 0.85)` for navigation and checkout modals.
- **Glass Borders:** Subtle specular highlights defined as `rgba(255, 255, 255, 0.70)` on top/left edges down to `rgba(255, 255, 255, 0.20)` on bottom/right edges.

### Brand & Interactive Colors
- **Primary (`#09090B`):** Pitch Black. Reserved for primary CTAs, authoritative display type, and high-emphasis focal badges.
- **Secondary (`#FF1493`):** Hyper-Pink / Neon Magenta. Used for drop countdowns, active toggles, limited-stock tags, and hover auras.
- **Tertiary (`#FDE047`):** Solar Warm Yellow. Used sparingly for curated drop accents, star ratings, and subtle gradient underlays.
- **Neutral Foreground (`#18181B` to `#71717A`):** Deep charcoal for headings, slate tones for secondary descriptions, and muted grey for helper text.

## Typography

The typography unites the avant-garde, structural punch of `Syne` with the effortless legibility of `Outfit`.

- **Headlines & Editorial Callouts (`Syne`):** Used at heavy weights (700–800) with tight tracking (`-0.02em` to `-0.03em`) to inject swagger and high-fashion attitude into product drops, shoe titles, and promotional banners.
- **Body & Commerce Data (`Outfit`):** A geometric, wide-aperture sans-serif designed for clean scanning across sizing matrices, technical shoe specs, and checkout flows.
- **Micro-Labels & Badges:** Rendered in `Outfit` Semibold/Bold with deliberate positive letter-spacing (`0.04em` to `0.08em`), uppercase by default, providing clean contrast against frosted substrates.

## Layout & Spacing

The layout is built on a responsive 12-column fluid grid system engineered for immersive retail presentation:

- **Desktop (1280px+):** 12 columns, `margin-lg` (4rem / 64px) outer page margins, `gutter-lg` (2rem / 32px) grid gutters.
- **Tablet (768px - 1279px):** 8 columns, `margin` (1.5rem / 24px) outer page margins, `gutter` (1.5rem / 24px) grid gutters.
- **Mobile (< 768px):** 4 columns, `margin-sm` (1rem / 16px) margins, `gutter-sm` (1rem / 16px) gutters. Product grids collapse gracefully into 2-column or full-bleed horizontal carousels with peek margins.

Spacing follows an 8pt baseline rhythm:
- Micro spacing (`space-xs` = 4px, `space-sm` = 8px) controls tight icon pairings, pill badge padding, and price lockups.
- Component spacing (`space-md` = 16px, `space-lg` = 24px) handles internal card padding and stack margins.
- Macro spacing (`space-xl` = 40px) orchestrates visual breathing room between featured shoe drops and editorial sections.

## Elevation & Depth

Depth is established through frosted glass layering, prismatic specular borders, and soft, tinted ambient glows rather than heavy structural shadows.

### Glassmorphism System
- **Layer 0 (Canvas):** Underlying smooth diagonal gradient (`pink-300` through `yellow-200` to pure white).
- **Layer 1 (Frosted Cards & Lists):** `background: rgba(255, 255, 255, 0.60); backdrop-filter: blur(20px) saturate(160%);` bounded by a 1px border `rgba(255, 255, 255, 0.65)`.
- **Layer 2 (Floating Controls & Navigation):** `background: rgba(255, 255, 255, 0.80); backdrop-filter: blur(28px) saturate(180%);` bounded by a 1px border `rgba(255, 255, 255, 0.80)`.
- **Layer 3 (Modals, Quick-Cart & Overlays):** `background: rgba(255, 255, 255, 0.90); backdrop-filter: blur(36px) saturate(200%);` bounded by a 1px border `rgba(255, 255, 255, 0.95)`.

### Shadow Language
- **Ambient Floor Glow:** Soft, low-opacity shadows with subtle chromatic diffusion: `0 16px 40px -12px rgba(15, 23, 42, 0.08)`.
- **Product Floating Elevation:** Under isolated cutout sneaker assets: `0 24px 48px -16px rgba(255, 20, 147, 0.15)` mixed with `0 12px 24px -8px rgba(0, 0, 0, 0.08)`.
- **Pitch Black CTA Shadow:** Pure black buttons carry an authoritative punch: `0 10px 24px -6px rgba(9, 9, 11, 0.35)`.

## Shapes

The design system embraces a **Pill-Shaped (`roundedness: 3`)** foundational curvature. High-curvature geometry balances the bold, architectural structure of the display typography and mimics the ergonomic sole contours of modern footwear:

- **Pills (`rounded-full`):** Standard for all buttons, search bars, filter tags, sizing chips, and status badges.
- **Outer Containers & Sneaker Cards (`rounded-xl` / 48px on desktop, 32px on mobile):** Large-radii rounded rectangles that feel sculptural and organic.
- **Inner Interactive Modules (`rounded-lg` / 24px):** Product gallery previews, selector groups, and checkout inputs.

## Components

### Buttons
- **Primary CTA:** Pitch black (`#09090B`) pill with pure white text (`#FFFFFF`). High-emphasis states feature an integrated neon magenta (`#FF1493`) micro-dot or subtle perimeter neon glow on hover (`0 0 20px rgba(255, 20, 147, 0.4)`).
- **Secondary / Glass Button:** Frosted glass pill (`rgba(255, 255, 255, 0.70)`), 1px solid `rgba(255, 255, 255, 0.90)`, dark charcoal text (`#18181B`). On hover, background shifts to pure white with elevated ambient blur.
- **Tertiary / Ghost:** Text-only in pitch black with a subtle sliding neon underline transition on interaction.

### Sneaker Showcase Cards
- Floating glass surface (`rgba(255, 255, 255, 0.65)`) with a 1px specular white border. Sneaker image floats freely beyond the card boundaries using negative margins.
- Bottom card deck contains the shoe name in `Syne` Bold, price in high-contrast pitch black, and a quick-add floating circular glass button.

### Sizing Chips & Pills
- Pill-shaped sizing units (`48px` width by `36px` height minimum).
- **Default:** Frosted white glass with slate text.
- **Selected:** Solid pitch black background with crisp white text.
- **Sold Out:** `rgba(255, 255, 255, 0.30)` opacity with an interior diagonal slash and muted grey typography.

### Input Fields & Search
- Completely pill-rounded bar styled in frosted white (`rgba(255, 255, 255, 0.75)`), blurred at `20px`.
- Crisp inset `1px` border in `rgba(255, 255, 255, 0.80)`.
- Focus state triggers a vibrant 1.5px border glow in pitch black (`#09090B`) with an outer subtle ring tinted in `#FF1493` at 25% opacity.

### Badges & Drop Tags
- Micro-pills using uppercase `label-sm`.
- **Limited Drop:** Solid `#FF1493` (hyper-pink) background with white text.
- **Stock Alert:** Frosted white glass with a pulsing `#FF1493` live indicator dot.
- **Collab Badge:** Solid `#09090B` background with `#FEF08A` (solar yellow) typography.

### Checkboxes & Radio Toggles
- Custom circular form controls. Unchecked state: frosted glass ring with delicate white rim. Checked state: solid pitch black filled disc with a centered hyper-pink tick or bullet point.