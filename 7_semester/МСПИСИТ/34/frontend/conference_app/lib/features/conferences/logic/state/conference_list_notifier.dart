import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/conference_short_response.dart';

class ConferenceListNotifier
    extends StateNotifier<List<ConferenceShortResponse>?> {
  ConferenceListNotifier() : super(null);

  void updateConferenceList(List<ConferenceShortResponse>? conferenceList) {
    state = conferenceList;
  }

  void removeConference(int conferenceId) {
    state = state?.where((item) => item.id != conferenceId).toList();
  }
}
