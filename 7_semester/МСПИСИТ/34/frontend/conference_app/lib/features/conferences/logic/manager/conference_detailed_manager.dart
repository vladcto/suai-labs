import '../../../app/navigation_manager.dart';
import '../../data/conference_api.dart';
import '../../data/models/conference_detail_response.dart';
import '../../data/models/conference_updating_request.dart';
import '../state/conference_list_notifier.dart';

class ConferenceDetailedManager {
  final ConferenceApi _api;
  final NavigationManager _navigationManager;
  final ConferenceListNotifier _conferenceListNotifier;

  ConferenceDetailedManager(
    this._api,
    this._navigationManager,
    this._conferenceListNotifier,
  );

  Future<ConferenceDetailResponse> getDetailedConference(int conferenceId) =>
      _api.getConferenceDetails(conferenceId);

  Future<void> deleteConference(int conferenceId) async {
    try {
      await _api.deleteConference(conferenceId);
      _conferenceListNotifier.removeConference(conferenceId);
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }

  Future<void> updateConference(
    int conferenceId,
    ConferenceUpdatingRequest request,
  ) async {
    try {
      await _api.updateConference(conferenceId, request);
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }
}
