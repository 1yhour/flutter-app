import 'package:flutter/foundation.dart';

/// A selectable onboarding topic.
@immutable
class Topic {
  const Topic({required this.id, required this.label});

  /// Stable id used in the selection set.
  final String id;

  /// Human readable label shown on the chip.
  final String label;
}

/// Topic catalogue in display order (`docs/screens/onboarding_02_welcome.md`).
const List<Topic> onboardingTopics = <Topic>[
  Topic(id: 'motivation', label: 'Motivation'),
  Topic(id: 'leadership', label: 'Leadership'),
  Topic(id: 'time_management', label: 'Time-Management'),
  Topic(id: 'emotions', label: 'Emotions'),
  Topic(id: 'nutrition', label: 'Nutrition'),
  Topic(id: 'parenting', label: 'Parenting'),
  Topic(id: 'planning', label: 'Planning'),
  Topic(id: 'self_confidence', label: 'Self-confidence'),
  Topic(id: 'self_care', label: 'Self-care'),
  Topic(id: 'management', label: 'Management'),
];
