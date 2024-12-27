import 'package:conference_app/features/app/navigation_manager.dart';
import 'package:conference_app/features/conferences/data/conference_api.dart';
import 'package:conference_app/features/conferences/data/models/conference_request.dart';

import '../state/conference_list_notifier.dart';
import '../state/conference_search_options_notifier.dart';

class ConferenceListManager {
  final ConferenceApi _api;
  final NavigationManager _navigationManager;
  final ConferenceSearchOptionsNotifier _conferenceSearchOptionsNotifier;
  final ConferenceListNotifier _conferenceListNotifier;

  ConferenceListManager(
    this._api,
    this._navigationManager,
    this._conferenceSearchOptionsNotifier,
    this._conferenceListNotifier,
  );

  Future<void> fetch() async {
    try {
      final options = await _api.getSearchOptions();
      _conferenceSearchOptionsNotifier.updateSearchOptions(options);
      final list = await _api.getConferencesList();
      _conferenceListNotifier.updateConferenceList(list);
    } on Object {
      _navigationManager.showErrorDialog();
      rethrow;
    }
  }

  Future<void> updateSearch({int? cityId, int? topicId, String? name}) async {
    final list = await _api.getConferencesList(
      cityId: cityId,
      topicId: topicId,
      name: name,
    );
    _conferenceListNotifier.updateConferenceList(list);
  }

  void openDetailedScreen(int conferenceId) =>
      _navigationManager.openDetailedConference(conferenceId);

  void openCreateConferenceScreen() =>
      _navigationManager.openCreateConferenceScreen();

  Future<void> createConference(ConferenceRequest request) async {
    try {
      await _api.createConference(request);
      _navigationManager.pop();
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }
}
