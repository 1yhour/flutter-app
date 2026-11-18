import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Material 3 [ThemeData] assembled from the design tokens in
/// `docs/DESIGN_SYSTEM.md`.
///
/// The design system is monochrome, so [ColorScheme.primary] is black and
/// [ColorScheme.secondary] is the muted gray used by secondary buttons.
abstract final class AppTheme {
  /// `size.button-height` — primary / secondary / yes-no buttons.
  static const double buttonHeight = 56;

  /// `size.chip-height` — topic chips.
  static const double chipHeight = 48;

  /// `size.tag-height` — step tag pills.
  static const double tagHeight = 32;

  /// `size.progress-height` — progress segments.
  static const double progressHeight = 6;

  /// `size.icon` — default icon size on a 24pt grid.
  static const double iconSize = 16;

  /// `size.touch-min` — minimum tap target.
  static const double touchTargetMin = 44;

  /// `size.logo-badge` — welcome logo circle.
  static const double logoBadgeSize = 96;

  /// `size.logo-glyph` — mark inside the logo badge.
  static const double logoGlyphSize = 40;

  /// `size.dot` — pagination dot.
  static const double dotSize = 8;

  /// `size.pagination-width` / `size.pagination-height` — page dots container.
  static const double paginationWidth = 76;
  static const double paginationHeight = 30;

  /// `size.content-max-width` — title and subtitle block.
  static const double contentMaxWidth = 280;

  /// `size.cover-aspect` — cover tiles are 2:3 (width : height).
  static const double coverAspectRatio = 2 / 3;

  /// `size.cover-grid-height` — the welcome cover grid is 55% of the screen.
  static const double coverGridHeightFactor = 0.55;

  /// `0 8 24 rgba(0,0,0,0.12)` — book cover elevation.
  static const List<BoxShadow> coverShadow = <BoxShadow>[
    BoxShadow(
      color: AppColors.shadowCover,
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];

  /// `0 4 16 rgba(0,0,0,0.06)` — cover card backdrop elevation.
  static const List<BoxShadow> cardShadow = <BoxShadow>[
    BoxShadow(
      color: AppColors.shadowCard,
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.bgButtonPrimary,
    onPrimary: AppColors.textOnDark,
    primaryContainer: AppColors.gray100,
    onPrimaryContainer: AppColors.gray900,
    secondary: AppColors.bgButtonSecondary,
    onSecondary: AppColors.gray900,
    secondaryContainer: AppColors.gray50,
    onSecondaryContainer: AppColors.gray900,
    error: AppColors.danger,
    onError: AppColors.white,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    surface: AppColors.bgScreen,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textSecondary,
    surfaceContainerLowest: AppColors.white,
    surfaceContainerLow: AppColors.gray50,
    surfaceContainer: AppColors.gray50,
    surfaceContainerHigh: AppColors.gray100,
    surfaceContainerHighest: AppColors.gray100,
    outline: AppColors.borderDefault,
    outlineVariant: AppColors.borderDefault,
    shadow: AppColors.black,
    scrim: AppColors.black,
    inverseSurface: AppColors.gray900,
    onInverseSurface: AppColors.white,
    inversePrimary: AppColors.white,
    surfaceTint: AppColors.transparent,
  );

  /// Light theme — the only mode the design system defines.
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: AppTypography.fontFamily,
      fontFamilyFallback: AppTypography.fontFamilyFallback,
      textTheme: AppTypography.textTheme,
      scaffoldBackgroundColor: AppColors.bgScreen,
      canvasColor: AppColors.bgScreen,
      dividerColor: AppColors.borderDefault,
      visualDensity: VisualDensity.standard,
      iconTheme: const IconThemeData(color: AppColors.gray900, size: 24),
      appBarTheme: AppBarThemeData(
        backgroundColor: AppColors.bgScreen,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTypography.labelLg.copyWith(
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(color: AppColors.gray900, size: 24),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdTop),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        titleTextStyle: AppTypography.title,
        contentTextStyle: AppTypography.body,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.borderDefault,
        thickness: 1,
        space: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.bgChip,
        selectedColor: AppColors.bgChipSelected,
        disabledColor: AppColors.gray50,
        checkmarkColor: AppColors.textOnDark,
        showCheckmark: false,
        labelStyle: AppTypography.labelMd,
        secondaryLabelStyle: AppTypography.labelMd.copyWith(
          color: AppColors.textOnDark,
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        side: const BorderSide(color: AppColors.borderDefault),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        iconTheme: const IconThemeData(size: AppTheme.iconSize),
        elevation: 0,
        pressElevation: 0,
        brightness: Brightness.light,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, buttonHeight),
          backgroundColor: AppColors.bgButtonPrimary,
          foregroundColor: AppColors.textOnDark,
          disabledBackgroundColor: AppColors.gray100,
          disabledForegroundColor: AppColors.textSecondary,
          textStyle: AppTypography.labelLg,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, buttonHeight),
          backgroundColor: AppColors.bgButtonPrimary,
          foregroundColor: AppColors.textOnDark,
          disabledBackgroundColor: AppColors.gray100,
          disabledForegroundColor: AppColors.textSecondary,
          textStyle: AppTypography.labelLg,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, buttonHeight),
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTypography.labelLg.copyWith(
            color: AppColors.textPrimary,
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          side: const BorderSide(color: AppColors.borderDefault),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          textStyle: AppTypography.labelMd,
          minimumSize: const Size(0, touchTargetMin),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.bgButtonPrimary,
        foregroundColor: AppColors.textOnDark,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.bgIndicatorFill,
        linearTrackColor: AppColors.bgIndicatorTrack,
        circularTrackColor: AppColors.bgIndicatorTrack,
        linearMinHeight: progressHeight,
      ),
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        hintStyle: AppTypography.body,
        labelStyle: AppTypography.body,
        helperStyle: AppTypography.caption.copyWith(
          color: AppColors.textSecondary,
        ),
        border: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.borderDefault),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.mdAll,
          borderSide: BorderSide(color: AppColors.danger),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.gray900,
        contentTextStyle: AppTypography.body.copyWith(
          color: AppColors.textOnDark,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
    );
  }
}
