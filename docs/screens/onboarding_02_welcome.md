# Screen Spec: Onboarding 02 – Topic Select

Status: draft · Route: `/onboarding/topics` · Previous: `/onboarding/welcome` · Next: `/onboarding/book`
Screenshot: `docs/screenshots/onboarding_02_topics.png` (middle phone of the 3-screen image)
Rules: follow `AGENTS.md` and `docs/DESIGN_SYSTEM.md`. All values below are token names.

## Purpose
Profile step. The user picks the topics they care about (multi-select). The selection is stored in app state and used later to recommend books.

## Layout (top → bottom, 390pt baseline, inside SafeArea)
1. **Step progress** – 5 segments, 1 filled. Top offset `space-4` below the safe area. Horizontal margin `space-5`.
2. **Step tag** – "Profile", centered. Gap above: `space-4`.
3. **Title** – "What Topics Interest You Most?", `type.title`, `text.primary`, centered, wraps to 2 lines. Gap above: `space-6`.
4. **Subtitle** – "Select topics that match your goals.", `type.body`, `text.secondary`, centered. Gap above: `space-2`.
5. **Chip cloud** – centered wrap, gap `space-3` horizontal and vertical. Gap above: `space-8`.
6. **Continue button** – primary, full width, margin `space-5` horizontal, `space-5` + safe area bottom. Pinned to the bottom, outside the scroll area.

The status bar is provided by the OS. Do not draw a fake one.

## Content
Topics in display order (id → label):

| id | label |
|---|---|
| motivation | Motivation |
| leadership | Leadership |
| time_management | Time-Management |
| emotions | Emotions |
| nutrition | Nutrition |
| parenting | Parenting |
| planning | Planning |
| self_confidence | Self-confidence |
| self_care | Self-care |
| management | Management |

Screenshot shows "Time-Management" selected. That is the demo state only; the default is nothing selected.

## Components
| Component | Source | Notes |
|---|---|---|
| `StepProgress` | `core/widgets/` | Props: `total`, `current`. Segment `size.progress-height`, gap `space-1`, `radius-full`. Filled `color.black`, empty `color.gray-100` |
| `StepTag` | `core/widgets/` | Props: `label`. Height `size.tag-height`, padding-x `space-4`, `radius-full`, 1px `color.gray-200`, `type.caption` |
| `TopicChip` | `core/widgets/` | Props: `label`, `selected`, `onTap`. See states below |
| `AppButton` (primary) | `core/widgets/` | Reuse from screen 01 |

### TopicChip states
| State | Bg | Text | Icon | Border |
|---|---|---|---|---|
| default | `color.white` | `color.gray-900` | `icon.plus` 16, `color.gray-900` | 1px `color.gray-200` |
| selected | `color.black` | `color.white` | `icon.plus` 16, `color.white` | none |

Height `size.chip-height`, padding-x `space-4`, icon→label gap `space-2`, `radius-md`, label `type.label-md`. Tap target at least `size.touch-min`. Animate the state change (150ms, color only).

## State (Riverpod)
```
lib/features/onboarding/
├── data/topic.dart                              // Topic(id, label), const list
└── application/
    ├── topics_provider.dart                     // Provider<List<Topic>> (static list)
    └── selected_topics_provider.dart            // NotifierProvider<SelectedTopicsNotifier, Set<String>>
```
- `SelectedTopicsNotifier` state: `Set<String>` of topic ids, initial empty.
- Methods: `toggle(String id)`. Always replace the set, never mutate it.
- The screen is a `ConsumerWidget`. `ref.watch` for the selection, `ref.read(...notifier)` in `onTap`.
- Selection must survive navigating to the next screen and back.
- No API call in this version. Persistence to the backend comes later.

## Behavior
- Tap chip: toggle selected, multi-select, no maximum.
- Tap **Continue**: `context.go('/onboarding/book')`.
- Back: system back returns to `/onboarding/welcome`. Selection stays.
- Chips wrap by available width. Do not hardcode rows.

## Responsive
- No overflow at width 360 and 430.
- If the chip cloud is taller than the space above the button (small screens or large text scale), the cloud scrolls; the header and button stay fixed.
- Honor system text scaling up to 1.3 without clipping chips.

## Files to create
```
lib/features/onboarding/presentation/screens/topic_select_screen.dart
lib/features/onboarding/data/topic.dart
lib/features/onboarding/application/topics_provider.dart
lib/features/onboarding/application/selected_topics_provider.dart
lib/core/widgets/step_progress.dart
lib/core/widgets/step_tag.dart
lib/core/widgets/topic_chip.dart
```
Register the route in `lib/core/router/` only if the router exists; otherwise skip and say so.

## Acceptance (done = all true)
- [ ] Matches the screenshot at 390 width: layout, chip order, wrap, spacing, text.
- [ ] Selected chip looks identical to the screenshot (black bg, white text, white +).
- [ ] Zero hardcoded colors, sizes, paddings or radii (tokens only).
- [ ] Selection is held in Riverpod, not in `setState`.
- [ ] `flutter analyze` clean, `dart format .` applied.
- [ ] No overflow at 360 and 430 width.
- [ ] Tests: provider toggles an id on and off; widget test taps a chip and its selected state changes.
- [ ] Summary lists files created, assumptions, and token mismatches.

## Open questions (do not guess, ask)
- Must the user select at least one topic before Continue? Default for now: Continue always enabled.
- Is there a minimum or maximum number of topics?
- Should the selection be sent to the Laravel API at this step or at the end of onboarding?