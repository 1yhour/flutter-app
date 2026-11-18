import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

/// Selectable topic pill.
///
/// Default: white background, `gray-900` label and plus, 1px `gray-200`
/// border. Selected: black background, white label and plus, no border.
/// Height `size.chip-height`, padding-x `space-4`, `radius-md`,
/// `type.label-md` (design system §8). The colour change animates over 150ms.
class TopicChip extends StatelessWidget {
  const TopicChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  static const Duration _stateAnimation = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final Color foreground = selected
        ? AppColors.textOnDark
        : AppColors.textPrimary;

    return Semantics(
      button: true,
      selected: selected,
      child: AnimatedContainer(
        duration: _stateAnimation,
        // Grows past the token height only when a scaled label needs a second
        // line, so text scaling up to 1.3 never clips.
        constraints: const BoxConstraints(minHeight: AppTheme.chipHeight),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        decoration: BoxDecoration(
          color: selected ? AppColors.bgChipSelected : AppColors.bgChip,
          borderRadius: AppRadius.mdAll,
          border: selected ? null : Border.all(color: AppColors.borderDefault),
        ),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.mdAll,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.add, size: AppTheme.iconSize, color: foreground),
                const SizedBox(width: AppSpacing.sm),
                Flexible(
                  child: Text(
                    label,
                    style: AppTypography.labelMd.copyWith(color: foreground),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
