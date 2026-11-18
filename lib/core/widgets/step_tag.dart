import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Pill that names the current onboarding step ("Profile").
///
/// Height `size.tag-height`, padding-x `space-4`, `radius-full`, 1px
/// `color.gray-200` border, `type.caption` (design system §8).
class StepTag extends StatelessWidget {
  const StepTag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: AppTheme.tagHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.bgTag,
            borderRadius: AppRadius.fullAll,
            border: Border.all(color: AppColors.borderDefault),
          ),
          child: Text(label, style: AppTypography.caption),
        ),
      ],
    );
  }
}
