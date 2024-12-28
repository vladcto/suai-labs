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

  int? currentCityId;
  int? currentTopicId;
  String? currentName;

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
    currentCityId = cityId;
    currentTopicId = topicId;
    currentName = name;

    await _applyFilters();
  }

  Future<void> clearFilter() async {
    currentCityId = null;
    currentTopicId = null;
    currentName = null;

    await _applyFilters();
  }

  Future<void> refreshSearch() => _applyFilters();

  Future<void> reapplyLastFilters() => _applyFilters();

  Future<void> _applyFilters() async {
    try {
      final list = await _api.getConferencesList(
        cityId: currentCityId,
        topicId: currentTopicId,
        name: currentName,
      );
      _conferenceListNotifier.updateConferenceList(list);
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }

  void openDetailedScreen(int conferenceId) =>
      _navigationManager.openDetailedConference(conferenceId);

  void openCreateConferenceScreen() =>
      _navigationManager.openCreateConferenceScreen();

  Future<void> createConference(ConferenceRequest request) async {
    try {
      await _api.createConference(request);
      _navigationManager.pop();
      refreshSearch();
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }
}
