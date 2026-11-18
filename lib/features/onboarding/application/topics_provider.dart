import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/topic.dart';

/// Static list of topics offered on the topic-select step.
///
/// No API call in this version; the catalogue is bundled with the app.
final Provider<List<Topic>> topicsProvider = Provider<List<Topic>>(
  (Ref ref) => onboardingTopics,
);
