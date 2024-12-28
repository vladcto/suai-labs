import 'package:conference_app/features/app/navigation_manager.dart';
import 'package:conference_app/features/di/auth_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

sealed class AppProviders {
  static final dioBaseOptions = Provider(
    (_) => BaseOptions(baseUrl: 'http://localhost:8080'),
  );

  static final dio = Provider(
    (ref) => Dio(
      ref.watch(dioBaseOptions),
    )..interceptors.add(
        ref.watch(
          AuthProviders.interceptor,
        ),
      ),
  );

  static final navigatorKey = Provider(
    (_) => GlobalKey<NavigatorState>(),
  );

  static final navigationManager = Provider(
    (ref) => NavigationManager(ref.watch(navigatorKey)),
  );
}
