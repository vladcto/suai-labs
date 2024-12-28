import '../../../app/navigation_manager.dart';
import '../../data/conference_api.dart';
import '../../data/models/conference_detail_response.dart';
import '../../data/models/conference_updating_request.dart';
import '../state/conference_list_notifier.dart';
import 'conference_list_manager.dart';

class ConferenceDetailedManager {
  final ConferenceApi _api;
  final NavigationManager _navigationManager;
  final ConferenceListNotifier _conferenceListNotifier;
  final ConferenceListManager _listManager;

  ConferenceDetailedManager(
    this._api,
    this._navigationManager,
    this._conferenceListNotifier,
    this._listManager,
  );

  Future<ConferenceDetailResponse> getDetailedConference(int conferenceId) =>
      _api.getConferenceDetails(conferenceId);

  Future<void> deleteConference(int conferenceId) async {
    try {
      await _api.deleteConference(conferenceId);
      _conferenceListNotifier.removeConference(conferenceId);
      _listManager.refreshSearch();
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
      _listManager.refreshSearch();
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }

  Future<void> registerForConference(int conferenceId) async {
    try {
      await _api.registerForConference(conferenceId);
      _conferenceListNotifier.updateConferenceAttendance(conferenceId,
          isAttending: true);
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }

  Future<void> cancelConferenceRegistration(int conferenceId) async {
    try {
      await _api.cancelConferenceRegistration(conferenceId);
      _conferenceListNotifier.updateConferenceAttendance(
        conferenceId,
        isAttending: false,
      );
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }
}
