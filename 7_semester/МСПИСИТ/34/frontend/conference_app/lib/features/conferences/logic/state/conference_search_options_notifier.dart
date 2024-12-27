import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/conference_search_options.dart';

class ConferenceSearchOptionsNotifier
    extends StateNotifier<ConferenceSearchOptions?> {
  ConferenceSearchOptionsNotifier() : super(null);

  void updateSearchOptions(ConferenceSearchOptions? options) {
    state = options;
  }
}