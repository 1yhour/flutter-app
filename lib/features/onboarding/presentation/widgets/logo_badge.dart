import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

/// Circular brand badge overlapping the welcome cover grid.
///
/// Placeholder mark (`Icons.menu_book_rounded`) until the brand asset exists.
class LogoBadge extends StatelessWidget {
  const LogoBadge({
    super.key,
    this.size = AppTheme.logoBadgeSize,
    this.glyphSize = AppTheme.logoGlyphSize,
  });

  final double size;
  final double glyphSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        // Nearest token to the badge shadow in the screenshot: the design
        // system only defines the card backdrop elevation.
        boxShadow: AppTheme.cardShadow,
      ),
      child: Icon(
        Icons.menu_book_rounded,
        size: glyphSize,
        color: AppColors.black,
      ),
    );
  }
}
