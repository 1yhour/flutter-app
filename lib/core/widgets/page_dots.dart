import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_theme.dart';

/// Pagination indicator shown on the onboarding screens.
///
/// Container `color.gray-50`, active dot `color.black`, inactive dots
/// `color.gray-200` (design system §8).
class PageDots extends StatelessWidget {
  const PageDots({super.key, required this.count, required this.index})
    : assert(count > 0, 'PageDots needs at least one dot'),
      assert(index >= 0 && index < count, 'index must be within 0..count-1');

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.paginationWidth,
      height: AppTheme.paginationHeight,
      decoration: const BoxDecoration(
        color: AppColors.gray50,
        borderRadius: AppRadius.fullAll,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int dot = 0; dot < count; dot++) ...<Widget>[
            if (dot > 0) const SizedBox(width: AppSpacing.sm),
            Container(
              width: AppTheme.dotSize,
              height: AppTheme.dotSize,
              decoration: BoxDecoration(
                color: dot == index ? AppColors.black : AppColors.gray200,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
