import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/step_progress.dart';
import '../../../../core/widgets/step_tag.dart';
import '../../../../core/widgets/topic_chip.dart';
import '../../application/selected_topics_provider.dart';
import '../../application/topics_provider.dart';
import '../../data/topic.dart';

/// Onboarding 02 — Topic Select.
///
/// Multi-select profile step. The header (progress, tag, title) and the CTA are
/// fixed; the chip cloud scrolls when it does not fit. Selection lives in
/// [selectedTopicsProvider] and survives navigation.
class TopicSelectScreen extends ConsumerWidget {
  const TopicSelectScreen({super.key, required this.onContinue});

  /// Called when the user taps **Continue**. Routing is wired by the caller
  /// until `core/router` exists.
  final VoidCallback onContinue;

  static const String _title = 'What Topics Interest You Most?';
  static const String _subtitle = 'Select topics that match your goals.';
  static const String _stepLabel = 'Profile';

  static const int _stepTotal = 5;
  static const int _stepCurrent = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Topic> topics = ref.watch(topicsProvider);
    final Set<String> selected = ref.watch(selectedTopicsProvider);

    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                AppSpacing.lg,
                AppSpacing.xl,
                0,
              ),
              child: const StepProgress(
                total: _stepTotal,
                current: _stepCurrent,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Center(child: StepTag(label: _stepLabel)),
            const SizedBox(height: AppSpacing.xxl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Column(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppTheme.contentMaxWidth,
                    ),
                    child: const Text(
                      _title,
                      textAlign: TextAlign.center,
                      style: AppTypography.title,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: AppTheme.contentMaxWidth,
                    ),
                    child: const Text(
                      _subtitle,
                      textAlign: TextAlign.center,
                      style: AppTypography.body,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxxl),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: <Widget>[
                    for (final Topic topic in topics)
                      TopicChip(
                        label: topic.label,
                        selected: selected.contains(topic.id),
                        onTap: () => ref
                            .read(selectedTopicsProvider.notifier)
                            .toggle(topic.id),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xl,
                0,
                AppSpacing.xl,
                AppSpacing.xl,
              ),
              child: AppButton(label: 'Continue', onPressed: onContinue),
            ),
          ],
        ),
      ),
    );
  }
}
