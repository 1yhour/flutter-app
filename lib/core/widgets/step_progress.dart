import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_theme.dart';

/// Segmented onboarding progress indicator.
///
/// `total` segments with `current` of them filled, `size.progress-height`
/// tall, `space-1` apart and `radius-full` (design system §8).
class StepProgress extends StatelessWidget {
  const StepProgress({super.key, required this.total, required this.current})
    : assert(total > 0, 'StepProgress needs at least one segment'),
      assert(
        current >= 0 && current <= total,
        'current must be within 0..total',
      );

  final int total;

  /// Number of filled segments.
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int segment = 0; segment < total; segment++) ...<Widget>[
          if (segment > 0) const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Container(
              height: AppTheme.progressHeight,
              decoration: BoxDecoration(
                color: segment < current
                    ? AppColors.bgIndicatorFill
                    : AppColors.bgIndicatorTrack,
                borderRadius: AppRadius.fullAll,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
