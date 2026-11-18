import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/page_dots.dart';
import '../widgets/cover_grid.dart';
import '../widgets/logo_badge.dart';

/// Onboarding 01 — Welcome.
///
/// First screen after install: cover grid, logo badge, promise copy, page dots
/// and a primary CTA. No providers, no data (see
/// `docs/screens/onboarding_01_welcome.md`).
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onContinue});

  /// Called when the user taps **Continue**. Routing is wired by the caller
  /// until `core/router` exists.
  final VoidCallback onContinue;

  static const String _title = 'Learn Smarter Not Longer';
  static const String _subtitle =
      'Bite-sized summaries designed to fit your day. '
      'Discover insights, not just pages.';

  static const int _pageCount = 3;
  static const int _pageIndex = 0;

  /// Placeholder cover art until real cover images are available.
  static const ImageProvider _coverCollage = AssetImage(
    'assets/onboarding/manybook.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgScreen,
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double coverGridHeight =
                constraints.maxHeight * AppTheme.coverGridHeightFactor;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: coverGridHeight,
                  child: const CoverGrid.collage(image: _coverCollage),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints inner) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: inner.maxHeight,
                          ),
                          child: Column(
                            // Keep the badge, copy and dots grouped just above
                            // the pinned CTA; spare height goes above the badge.
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const LogoBadge(),
                              const SizedBox(height: AppSpacing.xxl),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.xl,
                                ),
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
                              const SizedBox(height: AppSpacing.xxl),
                              const PageDots(
                                count: _pageCount,
                                index: _pageIndex,
                              ),
                              // Gap between the dots and the pinned CTA.
                              const SizedBox(height: AppSpacing.xxxl),
                            ],
                          ),
                        ),
                      );
                    },
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
            );
          },
        ),
      ),
    );
  }
}
