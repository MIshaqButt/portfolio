import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mishaqbutt/core/constants/messages.dart';

class ConnectivityInterceptor extends Interceptor {
  const ConnectivityInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final results = await Connectivity().checkConnectivity();

    final isInternetConnected =
        results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi);

    if (!isInternetConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          message: Messages.internetError,
        ),
      );
    }

    super.onRequest(options, handler);
  }
}
