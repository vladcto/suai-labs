import 'package:conference_app/features/auth/logic/state/token_holder.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final TokenGetter _tokenGetter;

  AuthInterceptor(this._tokenGetter);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenGetter.token;
    handler.next(
      options..headers['Authorization'] = token,
    );
  }
}
