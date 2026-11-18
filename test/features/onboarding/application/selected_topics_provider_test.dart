import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnflutter/features/onboarding/application/selected_topics_provider.dart';

void main() {
  test('toggle adds a topic id and removes it again', () {
    final ProviderContainer container = ProviderContainer.test();

    expect(container.read(selectedTopicsProvider), isEmpty);

    container.read(selectedTopicsProvider.notifier).toggle('motivation');
    expect(container.read(selectedTopicsProvider), <String>{'motivation'});

    container.read(selectedTopicsProvider.notifier).toggle('motivation');
    expect(container.read(selectedTopicsProvider), isEmpty);
  });

  test('selection holds multiple ids and never mutates the old set', () {
    final ProviderContainer container = ProviderContainer.test();
    final Set<String> initial = container.read(selectedTopicsProvider);

    container.read(selectedTopicsProvider.notifier).toggle('motivation');
    container.read(selectedTopicsProvider.notifier).toggle('emotions');

    expect(container.read(selectedTopicsProvider), <String>{
      'motivation',
      'emotions',
    });
    expect(initial, isEmpty);
    expect(identical(container.read(selectedTopicsProvider), initial), isFalse);
  });
}
