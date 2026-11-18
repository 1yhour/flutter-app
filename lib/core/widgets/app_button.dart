import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Primary call-to-action button.
///
/// Height `size.button-height`, `radius-md` and `type.label-lg` come from the
/// [AppTheme] button themes; the button always fills the available width.
class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppTheme.buttonHeight,
      child: FilledButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
