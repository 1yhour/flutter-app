# Book App – Onboarding Design System

Source: 3 onboarding screens (Welcome, Topic Select, Book Interest).
Method: raw values measured from the screenshot (phone width ≈ 286px), then scaled ×1.364 to a **390pt baseline** (iPhone 14/15) and snapped to a 4pt grid.

---

## 1. Raw Values (measured → normalized)

| Element | Raw (screenshot px) | Normalized (pt @390) |
|---|---|---|
| Phone corner radius | ~30 | 40 |
| Screen side padding | ~15 | 20 |
| Primary button height | ~40 | 56 |
| Primary button radius | ~11 | 16 |
| Chip height | ~36 | 48 |
| Chip radius | ~10 | 14 → use 16 |
| Chip horizontal padding | ~12 | 16 |
| Chip gap (x / y) | ~8 / ~8 | 12 / 12 |
| Chip icon (+) | ~11 | 16 |
| Progress segment height | ~6 | 6 |
| Progress segment gap | ~3 | 4 |
| Progress segments | 5 | 5 |
| Tag pill height | ~24 | 32 |
| Tag pill radius | full | 999 |
| Pagination dot | ~6 | 8 |
| Pagination container | ~56×22 | 76×30 |
| Title text | ~17 | 24 |
| Subtitle text | ~10 | 14 |
| Chip/button label | ~10 | 14–16 |
| Tag label | ~9 | 12 |
| Status bar time | ~11 | 15 |
| Logo badge (circle) | ~70 | 96 |
| Logo glyph | ~30 | 40 |
| Main book cover | ~130×190 | 176×260 |
| Side book cover | ~100×150 (scaled ≈0.85) | 150×220 |
| Book cover radius | ~6 | 8 |
| Yes/No button height | ~42 | 56 |
| Yes/No icon | ~12 | 16 |

---

## 2. Color

### Neutral
| Token | Hex | Usage |
|---|---|---|
| `color.black` | `#000000` | Primary button, selected chip, active dot, active progress |
| `color.white` | `#FFFFFF` | Screen background, chip default, text on black |
| `color.gray-50` | `#F7F7F7` | Pagination container, soft surfaces |
| `color.gray-100` | `#EDEDED` | Secondary button ("No"), inactive progress |
| `color.gray-200` | `#E2E2E2` | Chip border, tag pill border, inactive dot |
| `color.gray-500` | `#8C8C8C` | Subtitle / helper text |
| `color.gray-900` | `#111111` | Title text, body text |
| `color.canvas` | `#C9C9C9` | Presentation backdrop only (not in app) |

### Semantic
| Token | Hex | Usage |
|---|---|---|
| `color.danger` | `#E5484D` | "No" icon (✕) |
| `color.success` | `#30A46C` | "Yes" icon (✓) |

### Role aliases
```
bg.screen            = white
bg.chip              = white
bg.chip-selected     = black
bg.button-primary    = black
bg.button-secondary  = gray-100
bg.tag               = white
bg.indicator-track   = gray-100
bg.indicator-fill    = black
text.primary         = gray-900
text.secondary       = gray-500
text.on-dark         = white
border.default       = gray-200
```

---

## 3. Typography

Font family: **Inter** (fallback: SF Pro Text, system-ui, sans-serif). Letter-spacing: 0 for all, −0.2px on title.

| Token | Size / Line | Weight | Used for |
|---|---|---|---|
| `type.title` | 24 / 30 | 600 | "Learn Smarter Not Longer", "What Topics Interest You Most?" |
| `type.body` | 14 / 20 | 400 | Subtitle under title |
| `type.label-lg` | 16 / 20 | 500 | Primary button text ("Continue", "Yes", "No") |
| `type.label-md` | 14 / 20 | 500 | Chip text |
| `type.caption` | 12 / 16 | 500 | Tag pill ("Profile", "Like time") |
| `type.status` | 15 / 20 | 600 | Status bar time |

Alignment: title and subtitle are center-aligned, max width ≈ 280pt. Title–subtitle gap: 8pt.

---

## 4. Space Scale (4pt base)

| Token | Value |
|---|---|
| `space-0` | 0 |
| `space-1` | 4 |
| `space-2` | 8 |
| `space-3` | 12 |
| `space-4` | 16 |
| `space-5` | 20 |
| `space-6` | 24 |
| `space-8` | 32 |
| `space-10` | 40 |
| `space-12` | 48 |
| `space-16` | 64 |

Usage:
- Screen horizontal padding: `space-5` (20)
- Bottom safe margin above CTA: `space-5` (20) + home indicator inset
- Chip gap: `space-3` (12)
- Title → subtitle: `space-2` (8)
- Header block → content: `space-8` (32)
- Progress bar top offset from status bar: `space-4` (16)
- Tag pill below progress: `space-4` (16)

---

## 5. Radius

| Token | Value | Usage |
|---|---|---|
| `radius-sm` | 8 | Book covers |
| `radius-md` | 16 | Buttons, chips |
| `radius-xl` | 40 | Device frame (mockup only) |
| `radius-full` | 999 | Tag pill, progress segments, dots, logo badge |

---

## 6. Size

| Token | Value | Usage |
|---|---|---|
| `size.button-height` | 56 | Continue / Yes / No |
| `size.chip-height` | 48 | Topic chip |
| `size.tag-height` | 32 | Step tag pill |
| `size.progress-height` | 6 | Progress segment |
| `size.dot` | 8 | Pagination dot |
| `size.logo-badge` | 96 | Welcome logo circle |
| `size.logo-glyph` | 40 | Logo inside badge |
| `size.cover-main` | 176 × 260 | Center book cover |
| `size.cover-side` | 150 × 220 | Flanking covers (rotate ±4°, opacity 0.9) |
| `size.cover-aspect` | 2:3 | Cover tiles in the welcome grid |
| `size.cover-grid-height` | 55% of screen | Welcome cover grid |
| `size.pagination-width` | 76 | Pagination dots container |
| `size.pagination-height` | 30 | Pagination dots container |
| `size.content-max-width` | 280 | Title / subtitle text block |
| `size.touch-min` | 44 | Minimum tap target |

Elevation:
- Book cover: `0 8px 24px rgba(0,0,0,0.12)`
- Cover card backdrop: white rounded rect, `radius-md`, `0 4px 16px rgba(0,0,0,0.06)`
- Buttons / chips: none

---

## 7. Icons

Style: outline, 1.5pt stroke, rounded caps and joins, 16pt default on a 24pt grid. Suggested set: **Lucide** or **Phosphor (Regular)**.

| Token | Glyph | Size | Color | Used in |
|---|---|---|---|---|
| `icon.plus` | + | 16 | gray-900 (white when chip selected) | Topic chips |
| `icon.close` | ✕ | 16 | danger | "No" button |
| `icon.check` | ✓ | 16 | success | "Yes" button |
| `icon.logo` | Brand mark (circle + b) | 40 | black on white | Welcome badge |
| status icons | signal / wifi / battery | system | gray-900 | OS-provided, not custom |

Note: the selected chip keeps the + icon, in white.

---

## 8. Components

### Primary Button
- Height 56, full width minus 40 margin, radius 16
- Bg black, text white, `type.label-lg`, centered

### Secondary Button (No)
- Same size, bg gray-100, text gray-900, `icon.close` in danger after label (gap 8)

### Positive Button (Yes)
- Bg black, text white, `icon.check` in success after label (gap 8)
- Yes/No row: two equal buttons, gap 12

### Topic Chip
| State | Bg | Text / icon | Border |
|---|---|---|---|
| default | white | gray-900 | 1px gray-200 |
| selected | black | white | none |
- Height 48, padding-x 16, gap icon→text 8, radius 16
- Layout: centered wrap rows, 12pt gaps

### Progress Indicator
- 5 equal segments, gap 4, height 6, radius full
- Filled = black, empty = gray-100
- Screen 2 shows 1/5 filled, screen 3 shows 3/5 filled
- Spans full width within 20pt padding

### Step Tag
- Pill, height 32, padding-x 16, white bg, 1px gray-200 border, `type.caption`
- Centered below progress bar

### Pagination Dots
- Container 76×30, bg gray-50, radius full
- Dots 8pt, gap 8; active black, inactive gray-200

### Book Cover Stack (screen 3)
- Center cover `cover-main` on a white rounded card, side covers behind at x offset ±100, scale 0.85, rotate ±4°

### Book Cover Grid (screen 1)
- 3-column bleed grid, covers 8pt radius, gap 8, fade to white over the bottom 40% (linear-gradient white 0 → 100%)
- Logo badge overlaps the fade, centered

---

## 9. Screen Layouts

### Screen 1 – Welcome
1. Cover grid (top, bleeds edge to edge, ~55% height)
2. Logo badge (96) centered at fade edge
3. Title (`type.title`) + subtitle (`type.body`), centered
4. Pagination dots (3), `space-6` below subtitle
5. Primary button "Continue", pinned bottom

### Screen 2 – Topic Select
1. Status bar
2. Progress indicator (1/5)
3. Tag "Profile"
4. Title "What Topics Interest You Most?" + subtitle
5. Chip cloud (multi-select, center wrap)
6. Primary button "Continue", pinned bottom

### Screen 3 – Book Interest
1. Status bar
2. Progress indicator (3/5)
3. Tag "Like time"
4. Title "Are you interested in this book?" + subtitle
5. Book cover stack
6. Pagination dots (3)
7. Yes / No buttons, pinned bottom

---

## 10. Tokens (code)

```css
:root {
  /* color */
  --color-black: #000000;
  --color-white: #FFFFFF;
  --color-gray-50: #F7F7F7;
  --color-gray-100: #EDEDED;
  --color-gray-200: #E2E2E2;
  --color-gray-500: #8C8C8C;
  --color-gray-900: #111111;
  --color-danger: #E5484D;
  --color-success: #30A46C;

  /* type */
  --font-sans: "Inter", "SF Pro Text", system-ui, sans-serif;
  --fs-title: 24px;  --lh-title: 30px;  --fw-title: 600;
  --fs-body: 14px;   --lh-body: 20px;   --fw-body: 400;
  --fs-label-lg: 16px; --lh-label-lg: 20px; --fw-label: 500;
  --fs-label-md: 14px; --lh-label-md: 20px;
  --fs-caption: 12px;  --lh-caption: 16px;

  /* space */
  --space-1: 4px;  --space-2: 8px;  --space-3: 12px; --space-4: 16px;
  --space-5: 20px; --space-6: 24px; --space-8: 32px; --space-10: 40px;

  /* radius */
  --radius-sm: 8px; --radius-md: 16px; --radius-full: 999px;

  /* size */
  --size-button: 56px; --size-chip: 48px; --size-tag: 32px;
  --size-progress: 6px; --size-dot: 8px; --size-icon: 16px;
}
```

```ts
// Tailwind (tailwind.config.ts → theme.extend)
{
  colors: {
    ink: "#111111", muted: "#8C8C8C",
    line: "#E2E2E2", track: "#EDEDED", surface: "#F7F7F7",
    danger: "#E5484D", success: "#30A46C",
  },
  borderRadius: { sm: "8px", md: "16px" },
  spacing: { 13: "52px", 14: "56px", 15: "60px" },
  fontFamily: { sans: ["Inter", "system-ui", "sans-serif"] },
}
```

---

## 11. Notes / Assumptions
- Values are estimated from a 1024×768 screenshot, so verify against the original Figma file before handoff if you have it.
- Fonts appear to be Inter or SF Pro; both match the geometric neutral look.
- Brand color is not present: the UI is strictly monochrome plus red/green semantic icons. Add a brand accent later via `bg.button-primary` without changing component structure.
- Accessibility: gray-500 on white is ≈3.4:1, so it fails AA for body text. Darken to `#6B6B6B` (5.3:1) if the subtitle must meet AA.