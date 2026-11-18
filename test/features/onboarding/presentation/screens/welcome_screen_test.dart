import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnflutter/core/theme/app_theme.dart';
import 'package:learnflutter/features/onboarding/presentation/screens/welcome_screen.dart';

void main() {
  Widget buildScreen({VoidCallback? onContinue}) {
    return MaterialApp(
      theme: AppTheme.light,
      home: WelcomeScreen(onContinue: onContinue ?? () {}),
    );
  }

  testWidgets('renders the promise copy and the primary CTA', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(buildScreen());

    expect(find.text('Learn Smarter Not Longer'), findsOneWidget);
    expect(find.textContaining('Bite-sized summaries'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('tapping Continue fires the navigation callback', (
    WidgetTester tester,
  ) async {
    int taps = 0;
    await tester.pumpWidget(buildScreen(onContinue: () => taps++));

    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(taps, 1);
  });

  for (final Size size in <Size>[
    const Size(360, 640),
    const Size(390, 844),
    const Size(430, 932),
  ]) {
    testWidgets(
      'lays out without overflow at ${size.width.toInt()}x${size.height.toInt()}',
      (WidgetTester tester) async {
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(buildScreen());
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('Continue'), findsOneWidget);
      },
    );
  }
}
