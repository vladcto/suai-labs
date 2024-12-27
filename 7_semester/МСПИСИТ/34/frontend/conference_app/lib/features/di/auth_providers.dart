import 'package:conference_app/features/auth/data/auth_api.dart';
import 'package:conference_app/features/auth/logic/%20network/auth_interceptor.dart';
import 'package:conference_app/features/auth/logic/manager/auth_manager.dart';
import 'package:conference_app/features/auth/logic/state/token_holder.dart';
import 'package:conference_app/features/di/app_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class AuthProviders {
  static final _tokenProvider = Provider(
    (_) => TokenStateHolder(),
  );

  static final _dio = Provider(
    (ref) => Dio(
      ref.watch(AppProviders.dioBaseOptions),
    ),
  );

  static final _api = Provider(
    (ref) => AuthApi(
      ref.watch(_dio),
    ),
  );

  static final manager = Provider(
    (ref) => AuthManager(
      ref.watch(_api),
      ref.watch(_tokenProvider),
      ref.watch(AppProviders.navigationManager),
    ),
  );

  static final interceptor = Provider(
    (ref) => AuthInterceptor(
      ref.watch(_tokenProvider),
    ),
  );
}
