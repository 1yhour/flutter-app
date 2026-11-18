import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';

/// Full-bleed book cover art for the welcome screen, with a fade to white over
/// the bottom 40% (`docs/DESIGN_SYSTEM.md` §8).
///
/// Two modes:
/// * [CoverGrid] — individual covers laid out in staggered columns (`images`).
/// * [CoverGrid.collage] — a single image that already contains the cover grid.
///
/// Tiles without an entry in [images] fall back to neutral placeholder blocks
/// (`color.gray-100` / `color.gray-200`).
class CoverGrid extends StatelessWidget {
  /// Individual covers, laid out column by column (top to bottom, then the
  /// next column). Images are repeated cyclically when [rows] × [columns]
  /// needs more tiles than provided.
  const CoverGrid({
    super.key,
    this.images = const <ImageProvider>[],
    this.columns = 3,
    this.rows = 3,
  }) : collage = null,
       assert(columns > 0, 'CoverGrid needs at least one column'),
       assert(rows > 0, 'CoverGrid needs at least one row');

  /// A single collage image (2:3) used as the whole cover backdrop.
  const CoverGrid.collage({super.key, required ImageProvider image})
    : images = const <ImageProvider>[],
      columns = 1,
      rows = 1,
      collage = image;

  /// Cover art, laid out column by column (top to bottom, then next column).
  final List<ImageProvider> images;

  final int columns;
  final int rows;

  /// Single-image backdrop, used by [CoverGrid.collage].
  final ImageProvider? collage;

  @override
  Widget build(BuildContext context) {
    final ImageProvider? collageImage = collage;
    if (collageImage != null) {
      return _withFade(
        Image(
          image: collageImage,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        const double gap = AppSpacing.sm;

        // Spread the bleed (space-5 on each side) across the columns so the
        // first and last column are cropped by the screen edges.
        final double tileWidth =
            (constraints.maxWidth + AppSpacing.xl * 2 - gap * (columns - 1)) /
            columns;

        // The middle column sits one step lower than its neighbours.
        final int middleColumn = columns ~/ 2;

        return _withFade(
          Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              for (int column = 0; column < columns; column++)
                Positioned(
                  left: -AppSpacing.xl + column * (tileWidth + gap),
                  top: columns.isOdd && column == middleColumn
                      ? 0
                      : -AppSpacing.xxl,
                  width: tileWidth,
                  child: Column(
                    children: <Widget>[
                      for (int row = 0; row < rows; row++) ...<Widget>[
                        if (row > 0) const SizedBox(height: gap),
                        _CoverTile(
                          image: images.isEmpty
                              ? null
                              : images[(column * rows + row) % images.length],
                          placeholderColor: (column + row).isEven
                              ? AppColors.gray100
                              : AppColors.gray200,
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  /// Clips the art and paints the white fade over its bottom 40%.
  Widget _withFade(Widget art) {
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          art,
          const IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    AppColors.whiteTransparent,
                    AppColors.whiteTransparent,
                    AppColors.white,
                  ],
                  stops: <double>[0, 0.6, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A single 2:3 cover tile: image when available, neutral placeholder block
/// otherwise.
class _CoverTile extends StatelessWidget {
  const _CoverTile({required this.image, required this.placeholderColor});

  final ImageProvider? image;
  final Color placeholderColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: AppTheme.coverAspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: placeholderColor,
          borderRadius: AppRadius.smAll,
          boxShadow: AppTheme.coverShadow,
          image: image == null
              ? null
              : DecorationImage(image: image!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
