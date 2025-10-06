import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:m_ishaq_butt/core/local_storage/secured_prefs.dart';
import 'package:m_ishaq_butt/core/networking/interceptors/connectivity_interceptor.dart';
import 'package:m_ishaq_butt/core/networking/interceptors/logging_interceptor.dart';
import 'package:m_ishaq_butt/core/networking/interceptors/token_interceptor.dart';
import 'package:m_ishaq_butt/infrastructure/api/email_api.dart';
import 'package:m_ishaq_butt/infrastructure/api/email_repository.dart';
import 'package:m_ishaq_butt/infrastructure/bloc/email_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';


final getIt = GetIt.instance;

Dio get dio => getIt<Dio>();

PackageInfo get appInfo => getIt<PackageInfo>();

SecuredPrefs get securedPrefs => getIt<SecuredPrefs>();

final class DependencyInjection {
  const DependencyInjection();

  Future<void> call() async {
    getIt.registerLazySingleton<SecuredPrefs>(() => SecuredPrefs());

    getIt.registerSingletonAsync<PackageInfo>(
      () async => await PackageInfo.fromPlatform(),
    );

    getIt.registerLazySingleton<Dio>(() => _configureDio());

    getIt.registerFactory(() => EmailBloc(getIt()));
    getIt.registerLazySingleton<EmailRepository>(
      () => EmailRepositoryImpl(emailApi: getIt()),
    );
    getIt.registerLazySingleton<EmailApi>(() => EmailApiImpl(client: getIt()));

    await getIt.allReady();
  }

  Dio _configureDio() {
    final dio = Dio();

    // Base configuration
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );

    // Add interceptors in order
    if (!kReleaseMode) {
      // Enhanced logging interceptor with timing
      dio.interceptors.add(const LoggingInterceptor());
    }

    // Production interceptors
    dio.interceptors.add(const ConnectivityInterceptor());
    dio.interceptors.add(const TokenInterceptor());

    return dio;
  }
}
