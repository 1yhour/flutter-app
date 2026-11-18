# AGENTS.md

Book app (Flutter). Design source of truth: `docs/DESIGN_SYSTEM.md`.

## Stack & architecture
- Flutter (stable), Dart null-safe, Material 3 with a custom `ThemeData`.
- State: `flutter_riverpod`. Navigation: `go_router`. HTTP: `dio`.
- Backend: Laravel REST API. UI never calls Dio directly; go through a repository.
- Layers per feature: `presentation` (widgets) → `application` (providers) → `data` (repositories).
- Keep it simple: no code generation, no extra packages without asking.

## Folder structure
```
lib/
├── main.dart
├── core/
│   ├── theme/      app_colors, app_typography, app_spacing, app_radius, app_theme
│   ├── widgets/    shared widgets (AppButton, TopicChip, StepProgress, ...)
│   ├── router/
│   └── network/
└── features/<name>/
    ├── data/
    ├── application/
    └── presentation/   (screens/ and widgets/)
```
- Feature code stays inside its feature. Shared code moves to `core/`.
- One public widget per file. File names are `snake_case`.

## Design rules
- Never hardcode colors, font sizes, paddings, or radii. Use `AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`.
- Check `core/widgets/` before building any UI. Reuse or extend; do not duplicate.
- New value needed? Add a token to `docs/DESIGN_SYSTEM.md` and its `app_*.dart` file first, then use it.
- Spacing is a 4pt grid. Minimum tap target is 44.
- Use `const` constructors wherever possible.

## Riverpod conventions
- Use `Notifier` / `AsyncNotifier` with `NotifierProvider` / `AsyncNotifierProvider`.
- Providers live in `application/`, named `<thing>Provider`.
- `ref.watch` in `build`; `ref.read` only in callbacks and event handlers.
- Widgets are `ConsumerWidget`; no business logic inside widgets.
- State is immutable. Update through the notifier, never mutate in place.
- Handle `loading`, `error`, and `data` for every `AsyncValue`.

## Working with screenshots
1. List what you see first: layout, components, text, states.
2. Map every value to an existing token. Do not invent pixel values.
3. If nothing matches, name the nearest token and flag the mismatch in your summary.
4. Reuse existing widgets before creating new ones.
5. Treat screenshot sizes as approximate (390pt baseline).
6. Do not copy brand assets or book covers from screenshots; use placeholders.

## Definition of done
- `dart format .` and `flutter analyze` pass with zero issues.
- `flutter test` passes; new logic has a test.
- No hardcoded colors/sizes (`Color(0x`, `fontSize:`, raw `EdgeInsets` numbers).
- No overflow at 360 and 430 width.
- Loading, empty, and error states are handled.
- Final message states: what changed, files touched, anything assumed.

## Don't
- Don't edit `android/`, `ios/`, or `pubspec.yaml` unless asked.
- Don't refactor unrelated code.
- Ask when the requirement is unclear; don't guess.