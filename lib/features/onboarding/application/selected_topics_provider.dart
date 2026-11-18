import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ids of the topics selected during onboarding.
///
/// Lives above the navigator, so the selection survives moving between
/// onboarding steps. The set is always replaced, never mutated in place.
class SelectedTopicsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => const <String>{};

  /// Adds [id] when absent, removes it when present.
  void toggle(String id) {
    final Set<String> next = Set<String>.of(state);
    if (next.contains(id)) {
      next.remove(id);
    } else {
      next.add(id);
    }
    state = next;
  }
}

final NotifierProvider<SelectedTopicsNotifier, Set<String>>
selectedTopicsProvider = NotifierProvider<SelectedTopicsNotifier, Set<String>>(
  SelectedTopicsNotifier.new,
);
