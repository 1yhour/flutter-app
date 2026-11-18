# Screen Spec: Onboarding 01 – Welcome

Status: draft · Route: `/onboarding/welcome` · Next: `/onboarding/topics`
Screenshot: `docs/screenshots/onboarding_01_welcome.png` (left phone of the 3-screen image)
Rules: follow `AGENTS.md` and `docs/DESIGN_SYSTEM.md`. All values below are token names.

## Purpose
First screen after install. Communicates the product promise and sends the user into onboarding. No input, no data loading.

## Layout (top → bottom, full-bleed, 390pt baseline)
1. **Cover grid** – edge to edge, top of screen, ~55% of screen height.
   - 3 columns × 3 visible rows, gap `space-2`, covers `radius-sm`.
   - Columns are staggered vertically (middle column offset down) and bleed off the left, right and top edges.
   - Bottom 40% fades to `color.white` (linear gradient, transparent → white).
2. **Logo badge** – `size.logo-badge` circle, `color.white`, `radius-full`, centered, overlapping the bottom edge of the fade. Glyph `icon.logo` at `size.logo-glyph`, `color.black`.
3. **Title** – "Learn Smarter Not Longer", `type.title`, `text.primary`, centered. Gap above: `space-6`.
4. **Subtitle** – "Bite-sized summaries designed to fit your day. Discover insights, not just pages.", `type.body`, `text.secondary`, centered, max width 280. Gap above: `space-2`.
5. **Page dots** – 3 dots, first active. Gap above: `space-6`.
6. **Continue button** – primary, full width, horizontal margin `space-5`, bottom margin `space-5` + safe area. Gap above: `space-8` from dots.

No status bar mock, no progress bar (those appear from screen 2 onward).

## Components
| Component | Source | Notes |
|---|---|---|
| `AppButton` (primary) | `core/widgets/` | Reuse if it exists; else create. Height `size.button-height`, `radius-md`, label `type.label-lg` |
| `PageDots` | `core/widgets/` | Props: `count`, `index`. Container `color.gray-50`, dots `size.dot`, active `color.black`, inactive `color.gray-200` |
| `CoverGrid` | `features/onboarding/presentation/widgets/` | New. Takes a `List<ImageProvider>`; renders staggered columns + fade |
| `LogoBadge` | `features/onboarding/presentation/widgets/` | New. Circle with logo glyph |

## Content & assets
- Text is hardcoded in the screen for now (no localization yet).
- Covers: use neutral placeholder tiles (`color.gray-100` / `color.gray-200`, aspect ratio 2:3). Do **not** use real book covers from the screenshot.
- Real covers later go in `assets/images/covers/`, declared in `pubspec.yaml` (ask first).
- Logo: placeholder `Icons.menu_book_rounded` until a brand mark exists.

## Behavior
- Tap **Continue** → `context.go('/onboarding/topics')`.
- Dots are static (index 0 of 3) in this version. No swipe, no carousel.
- No providers needed. Plain `StatelessWidget`.
- Back button / swipe-back: none (first screen).

## Responsive
- Must not overflow at width 360 and 430, and heights 640–932.
- Cover grid height = 55% of screen height; text block and button keep fixed spacing.
- Respect safe area at the bottom.

## Files to create
```
lib/features/onboarding/presentation/screens/welcome_screen.dart
lib/features/onboarding/presentation/widgets/cover_grid.dart
lib/features/onboarding/presentation/widgets/logo_badge.dart
lib/core/widgets/page_dots.dart
lib/core/widgets/app_button.dart        (only if missing)
```
Register the route in `lib/core/router/` only if the router exists; otherwise skip and say so.

## Acceptance (done = all true)
- [ ] Matches the screenshot at 390 width: layout, order, spacing, text.
- [ ] Zero hardcoded colors, sizes, paddings or radii (tokens only).
- [ ] `flutter analyze` clean, `dart format .` applied.
- [ ] No overflow at 360 and 430 width.
- [ ] Widget test: renders title and "Continue"; tapping Continue triggers navigation callback.
- [ ] Summary lists files created, assumptions, and token mismatches.

## Open questions (do not guess, ask)
- Should the 3 dots become a swipeable carousel later?
- Final logo asset and cover images.