import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnflutter/core/theme/app_theme.dart';
import 'package:learnflutter/core/widgets/step_tag.dart';
import 'package:learnflutter/core/widgets/topic_chip.dart';
import 'package:learnflutter/features/onboarding/application/selected_topics_provider.dart';
import 'package:learnflutter/features/onboarding/presentation/screens/topic_select_screen.dart';

void main() {
  Widget buildScreen(ProviderContainer container, {VoidCallback? onContinue}) {
    return UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.light,
        home: TopicSelectScreen(onContinue: onContinue ?? () {}),
      ),
    );
  }

  bool isChipSelected(WidgetTester tester, String label) {
    return tester
        .widget<TopicChip>(find.widgetWithText(TopicChip, label))
        .selected;
  }

  testWidgets('shows the topics in display order', (WidgetTester tester) async {
    await tester.pumpWidget(buildScreen(ProviderContainer.test()));

    final List<String> labels = <String>[
      'Motivation',
      'Leadership',
      'Time-Management',
      'Emotions',
      'Nutrition',
      'Parenting',
      'Planning',
      'Self-confidence',
      'Self-care',
      'Management',
    ];

    final double previousTop = -1;
    double lastTop = previousTop;
    for (final String label in labels) {
      expect(find.text(label), findsOneWidget);
      final double top = tester.getTopLeft(find.text(label)).dy;
      expect(top, greaterThanOrEqualTo(lastTop));
      lastTop = top;
    }

    // The step tag is a compact pill, not a full-width bar.
    expect(tester.getSize(find.byType(StepTag)).width, lessThan(200));
  });

  testWidgets('tapping a chip toggles its selected state', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = ProviderContainer.test();
    await tester.pumpWidget(buildScreen(container));

    expect(isChipSelected(tester, 'Motivation'), isFalse);
    expect(container.read(selectedTopicsProvider), isEmpty);

    await tester.tap(find.widgetWithText(TopicChip, 'Motivation'));
    await tester.pumpAndSettle();

    expect(isChipSelected(tester, 'Motivation'), isTrue);
    expect(container.read(selectedTopicsProvider), <String>{'motivation'});

    await tester.tap(find.widgetWithText(TopicChip, 'Time-Management'));
    await tester.pumpAndSettle();

    expect(container.read(selectedTopicsProvider), <String>{
      'motivation',
      'time_management',
    });

    await tester.tap(find.widgetWithText(TopicChip, 'Motivation'));
    await tester.pumpAndSettle();

    expect(isChipSelected(tester, 'Motivation'), isFalse);
    expect(container.read(selectedTopicsProvider), <String>{'time_management'});
  });

  testWidgets('tapping Continue fires the navigation callback', (
    WidgetTester tester,
  ) async {
    int taps = 0;
    await tester.pumpWidget(
      buildScreen(ProviderContainer.test(), onContinue: () => taps++),
    );

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

        await tester.pumpWidget(buildScreen(ProviderContainer.test()));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('Continue'), findsOneWidget);
      },
    );
  }

  testWidgets('handles a 1.3 text scale without overflow', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;
    tester.platformDispatcher.textScaleFactorTestValue = 1.3;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.platformDispatcher.clearTextScaleFactorTestValue();
    });

    await tester.pumpWidget(buildScreen(ProviderContainer.test()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
