import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Typography tokens from `docs/DESIGN_SYSTEM.md`.
///
/// The design calls for Inter. Add the font files to `pubspec.yaml` under the
/// family name [fontFamily] to activate them; until then Flutter falls back to
/// [fontFamilyFallback] and the platform font.
abstract final class AppTypography {
  static const String fontFamily = 'Inter';

  static const List<String> fontFamilyFallback = <String>[
    'SF Pro Text',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Titles are the only style with negative tracking.
  static const double titleLetterSpacing = -0.2;

  /// 24 / 30 · w600 — screen titles ("Learn Smarter Not Longer").
  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 24,
    height: 30 / 24,
    fontWeight: FontWeight.w600,
    letterSpacing: titleLetterSpacing,
    color: AppColors.textPrimary,
  );

  /// 14 / 20 · w400 — subtitle under the title (secondary text color).
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// 16 / 20 · w500 — primary / secondary / yes-no button labels.
  static const TextStyle labelLg = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  /// 14 / 20 · w500 — chip labels.
  static const TextStyle labelMd = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// 12 / 16 · w500 — tag pills ("Profile", "Like time").
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// 15 / 20 · w600 — status bar time.
  static const TextStyle status = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 15,
    height: 20 / 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// Material [TextTheme] mapped onto the tokens above.
  static const TextTheme textTheme = TextTheme(
    displayLarge: title,
    headlineSmall: title,
    bodyMedium: body,
    titleSmall: status,
    labelLarge: labelLg,
    labelMedium: labelMd,
    labelSmall: caption,
  );
}
