/// Spacing tokens from `docs/DESIGN_SYSTEM.md` (4pt base scale).
///
/// Only the steps used by the onboarding screens are exposed; add higher steps
/// here if a layout needs them.
abstract final class AppSpacing {
  /// 4 — icon-to-text gaps, tight stacks.
  static const double xs = 4;

  /// 8 — title → subtitle, inline gaps.
  static const double sm = 8;

  /// 12 — chip gaps, yes/no button gap.
  static const double md = 12;

  /// 16 — chip padding, header offsets.
  static const double lg = 16;

  /// 20 — screen horizontal padding, CTA bottom margin.
  static const double xl = 20;

  /// 24 — pagination dots below subtitle, section spacing.
  static const double xxl = 24;

  /// 32 — header block → content.
  static const double xxxl = 32;
}
