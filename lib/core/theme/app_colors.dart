import 'package:flutter/material.dart';

/// Color tokens measured in `docs/DESIGN_SYSTEM.md`.
///
/// The product palette is intentionally monochrome; red and green are reserved
/// for semantic icons. When styling widgets prefer the role aliases at the
/// bottom of this class (`bgButtonPrimary`, `textPrimary`, ...) over the raw
/// scale.
abstract final class AppColors {
  // ---------------------------------------------------------------------------
  // Neutral scale
  // ---------------------------------------------------------------------------
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  /// Pagination container, soft surfaces.
  static const Color gray50 = Color(0xFFF7F7F7);

  /// Secondary buttons, inactive progress segments.
  static const Color gray100 = Color(0xFFEDEDED);

  /// Chip / tag borders, inactive pagination dots.
  static const Color gray200 = Color(0xFFE2E2E2);

  /// Subtitles and helper text.
  static const Color gray500 = Color(0xFF8C8C8C);

  /// Titles and body copy.
  static const Color gray900 = Color(0xFF111111);

  /// Presentation backdrop only — never used inside the app.
  static const Color canvas = Color(0xFFC9C9C9);

  // ---------------------------------------------------------------------------
  // Semantic
  // ---------------------------------------------------------------------------
  static const Color danger = Color(0xFFE5484D);
  static const Color success = Color(0xFF30A46C);

  static const Color transparent = Color(0x00000000);

  /// White with zero alpha — start color of the cover-grid fade.
  static const Color whiteTransparent = Color(0x00FFFFFF);

  // ---------------------------------------------------------------------------
  // Elevation overlays (design system §6)
  // ---------------------------------------------------------------------------

  /// `rgba(0, 0, 0, 0.12)` — book cover elevation (`0 8 24`).
  static const Color shadowCover = Color(0x1F000000);

  /// `rgba(0, 0, 0, 0.06)` — cover card backdrop elevation (`0 4 16`).
  static const Color shadowCard = Color(0x0F000000);

  // ---------------------------------------------------------------------------
  // Role aliases
  // ---------------------------------------------------------------------------
  static const Color bgScreen = white;
  static const Color bgChip = white;
  static const Color bgChipSelected = black;
  static const Color bgButtonPrimary = black;
  static const Color bgButtonSecondary = gray100;
  static const Color bgTag = white;
  static const Color bgIndicatorTrack = gray100;
  static const Color bgIndicatorFill = black;

  static const Color textPrimary = gray900;

  /// gray-500 on white is ≈3.4:1 and fails WCAG AA for body text. Swap in a
  /// darker gray (`#6B6B6B`) if subtitles must meet AA.
  static const Color textSecondary = gray500;
  static const Color textOnDark = white;

  static const Color borderDefault = gray200;

  // ---------------------------------------------------------------------------
  // Material color roles used by widgets that expect a tinted container
  // ---------------------------------------------------------------------------
  static const Color errorContainer = Color(0xFFFFEDEA);
  static const Color onErrorContainer = Color(0xFF410002);
}
