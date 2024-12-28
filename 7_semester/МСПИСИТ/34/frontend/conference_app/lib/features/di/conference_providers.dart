import 'package:conference_app/features/conferences/data/conference_api.dart';
import 'package:conference_app/features/conferences/logic/manager/conference_detailed_manager.dart';
import 'package:conference_app/features/di/app_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../conferences/data/models/conference_search_options.dart';
import '../conferences/data/models/conference_short_response.dart';
import '../conferences/logic/manager/conference_list_manager.dart';
import '../conferences/logic/state/conference_list_notifier.dart';
import '../conferences/logic/state/conference_search_options_notifier.dart';

sealed class ConferenceProviders {
  static final _api = Provider(
    (ref) => ConferenceApi(
      ref.watch(AppProviders.dio),
    ),
  );

  static final searchOptionsProvider = StateNotifierProvider<
      ConferenceSearchOptionsNotifier, ConferenceSearchOptions?>(
    (ref) => ConferenceSearchOptionsNotifier(),
  );

  static final listProvider = StateNotifierProvider<ConferenceListNotifier,
      List<ConferenceShortResponse>?>(
    (ref) => ConferenceListNotifier(),
  );

  static final conferenceListManager = Provider(
    (ref) => ConferenceListManager(
      ref.watch(_api),
      ref.watch(AppProviders.navigationManager),
      ref.watch(searchOptionsProvider.notifier),
      ref.watch(listProvider.notifier),
    ),
  );

  static final conferenceDetailedManager = Provider(
    (ref) => ConferenceDetailedManager(
      ref.watch(_api),
      ref.watch(AppProviders.navigationManager),
      ref.watch(listProvider.notifier),
      ref.watch(conferenceListManager),
    ),
  );
}
