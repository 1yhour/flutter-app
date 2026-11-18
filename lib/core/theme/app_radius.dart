import 'package:flutter/painting.dart';

/// Corner radius tokens from `docs/DESIGN_SYSTEM.md`.
abstract final class AppRadius {
  /// 8 — book covers.
  static const double sm = 8;

  /// 16 — buttons, chips, tag pills (the system snaps chip's 14 to 16).
  static const double md = 16;

  /// 40 — device frame in mockups only, not used in app UI.
  static const double xl = 40;

  /// 999 — pills, progress segments, pagination dots, logo badge.
  static const double full = 999;

  static const Radius smRadius = Radius.circular(sm);
  static const Radius mdRadius = Radius.circular(md);
  static const Radius xlRadius = Radius.circular(xl);
  static const Radius fullRadius = Radius.circular(full);

  static const BorderRadius smAll = BorderRadius.all(smRadius);
  static const BorderRadius mdAll = BorderRadius.all(mdRadius);
  static const BorderRadius xlAll = BorderRadius.all(xlRadius);
  static const BorderRadius fullAll = BorderRadius.all(fullRadius);

  /// Rounded top only, e.g. bottom sheets.
  static const BorderRadius mdTop = BorderRadius.vertical(top: mdRadius);
}
