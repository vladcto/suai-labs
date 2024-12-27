import 'package:conference_app/features/app/navigation_manager.dart';
import 'package:conference_app/features/auth/data/auth_api.dart';
import 'package:conference_app/features/auth/logic/state/token_holder.dart';

class AuthManager {
  final AuthApi _api;
  final TokenStateHolder _tokenStateHolder;
  final NavigationManager _navigationManager;

  AuthManager(
    this._api,
    this._tokenStateHolder,
    this._navigationManager,
  );

  Future<void> login(String username, String password) async {
    try {
      final token = await _api.authorize(username, password);
      _tokenStateHolder.token = token;
      _navigationManager.openConferenceList();
    } on Object {
      _navigationManager.showErrorDialog();
    }
  }
}
