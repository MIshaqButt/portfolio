
import 'package:dio/dio.dart';
import 'package:mishaqbutt/core/dependency_injection/injection_container.dart';
import 'package:mishaqbutt/core/utils/logger.dart';

class TokenInterceptor extends Interceptor with Logger {
  const TokenInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['content-type'] != 'application/octet-stream') {
      final token = await securedPrefs.readToken() ?? '';

      if (token.isNotEmpty) options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
