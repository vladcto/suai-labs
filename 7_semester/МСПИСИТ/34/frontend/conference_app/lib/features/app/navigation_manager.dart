import 'package:flutter/material.dart';

import '../conferences/ui/conference_detail_screen.dart';
import '../conferences/ui/conference_list.dart';
import '../conferences/ui/create_conference_screen.dart';

class NavigationManager {
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigationManager(this._navigatorKey);

  void pop() => _navigatorKey.currentState?.pop();

  void openConferenceList() {
    _navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ConferenceListScreen(),
      ),
    );
  }

  void openDetailedConference(int conferenceId) {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) =>
            ConferenceDetailScreen(conferenceId: conferenceId),
      ),
    );
  }

  void openCreateConferenceScreen() {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => const CreateConferenceScreen()),
    );
  }

  void showErrorDialog() {
    showDialog(
      context: _navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
