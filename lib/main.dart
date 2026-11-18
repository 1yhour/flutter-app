import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/screens/topic_select_screen.dart';
import 'features/onboarding/presentation/screens/welcome_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      theme: AppTheme.light,
      home: Builder(
        builder: (BuildContext context) {
          return WelcomeScreen(
            onContinue: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (_) =>
                      const TopicSelectScreen(onContinue: _continueToBook),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// TODO(router): replace the Navigator push in [MyApp] and this callback with
/// `context.go(...)` once `core/router` exists.
void _continueToBook() {}
