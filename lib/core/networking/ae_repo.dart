import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:m_ishaq_butt/core/constants/messages.dart';
import 'package:m_ishaq_butt/core/dependency_injection/injection_container.dart';
import 'package:m_ishaq_butt/core/networking/method_type.dart';
import 'package:m_ishaq_butt/core/networking/models/api_result.dart';
import 'package:m_ishaq_butt/core/networking/request_config.dart';
import 'package:m_ishaq_butt/core/utils/logger.dart';

base class AERepository with Logger {
  const AERepository();

  Future<ApiResult<T>> executeAPICall<T>(
    RequestConfig config, {
    required T Function(dynamic data) onSuccess,
  }) async {
    String? message;
    int? statusCode;
    String? errorCode;
    Object? error;
    StackTrace? stackTrace;
    Map<String, dynamic>? errorData;

    try {
      final response = await _performRequest(config);

      // Safely parse the response data
      final data = await _safelyParseResponse<T>(response.data, onSuccess);

      return ApiSuccess<T>(
        data: data,
        message: _extractMessage(response.data),
        statusCode: response.statusCode,
        headers: response.headers.map,
      );
    } on SocketException catch (e, s) {
      message = Messages.internetError;
      error = e;
      stackTrace = s;
      errorCode = 'SOCKET_EXCEPTION';
    } on FormatException catch (e, s) {
      message = 'Invalid data format received';
      error = e;
      stackTrace = s;
      errorCode = 'FORMAT_EXCEPTION';
    } on TimeoutException catch (e, s) {
      message = Messages.timeOutError;
      error = e;
      stackTrace = s;
      errorCode = 'TIMEOUT_EXCEPTION';
    } on DioException catch (e, s) {
      final result = _handleDioException(e);
      message = result.message;
      statusCode = result.statusCode;
      errorCode = result.errorCode;
      errorData = result.errorData;
      error = e;
      stackTrace = s;
    } on _JsonParsingException catch (e, s) {
      message = 'Failed to parse server response';
      error = e.originalError;
      stackTrace = s;
      errorCode = 'JSON_PARSING_ERROR';
      errorData = {'parsing_error': e.originalError.toString()};
    } catch (e, s) {
      message = Messages.someErrorOccurred;
      error = e;
      stackTrace = s;
      errorCode = 'UNKNOWN_EXCEPTION';

      // Report unexpected errors to Crashlytics
      _reportToCrashlytics(e, s, config);
    }

    // Log error for debugging
    logError(
      error,
      stackTrace,
      shouldReport: (statusCode ?? 0) >= 500,
    );

    return ApiFailure<T>(
      message: message,
      statusCode: statusCode,
      errorCode: errorCode,
      error: error,
      stackTrace: stackTrace,
      errorData: errorData,
    );
  }

  Future<Response> _performRequest(RequestConfig config) async {
    return switch (config.method) {
      MethodType.get => dio.get(
        config.url,
        cancelToken: config.cancelToken,
        queryParameters: config.queryParams,
        data: config.data,
        options: _buildOptions(config),
      ),
      MethodType.post => dio.post(
        config.url,
        data: config.data,
        cancelToken: config.cancelToken,
        queryParameters: config.queryParams,
        options: _buildOptions(config),
      ),
      MethodType.put => dio.put(
        config.url,
        data: config.data,
        cancelToken: config.cancelToken,
        queryParameters: config.queryParams,
        options: _buildOptions(config),
      ),
      MethodType.delete => dio.delete(
        config.url,
        data: config.data,
        cancelToken: config.cancelToken,
        queryParameters: config.queryParams,
        options: _buildOptions(config),
      ),
    };
  }

  Options _buildOptions(RequestConfig config) {
    return config.options?.copyWith(headers: config.headers) ??
        Options(headers: config.headers);
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] as String?;
    }
    return null;
  }

  void _reportToCrashlytics(
    Object error,
    StackTrace stackTrace,
    RequestConfig config,
  ) {
    logInfo(
      'Unexpected API error occurred',
      data: {
        'URL': config.url,
        'Method': config.method.name,
        'Headers': config.headers,
        'Query Params': config.queryParams,
      },
    );
    
    logError(error, stackTrace, shouldReport: true);
  }

  _DioExceptionResult _handleDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final data = exception.response?.data;

    if (statusCode != null && statusCode >= 500) {
      return _DioExceptionResult(
        message: Messages.serverError,
        statusCode: statusCode,
        errorCode: 'SERVER_ERROR',
        errorData: data is Map<String, dynamic> ? data : null,
      );
    }

    String message;
    String errorCode;
    Map<String, dynamic>? errorData;

    if (data is String) {
      message = data;
      errorCode = 'STRING_RESPONSE';
    } else if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? _getDefaultDioMessage(exception);
      errorCode = data['code'] as String? ?? _getDefaultDioErrorCode(exception);
      errorData = data;
    } else {
      message = _getDefaultDioMessage(exception);
      errorCode = _getDefaultDioErrorCode(exception);
    }

    return _DioExceptionResult(
      message: message,
      statusCode: statusCode,
      errorCode: errorCode,
      errorData: errorData,
    );
  }

  String _getDefaultDioMessage(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout => Messages.timeOutError,
      DioExceptionType.receiveTimeout => Messages.timeOutError,
      DioExceptionType.sendTimeout => Messages.timeOutError,
      DioExceptionType.badResponse => Messages.badResponse,
      DioExceptionType.badCertificate => Messages.someErrorOccurred,
      DioExceptionType.connectionError => Messages.internetError,
      _ => Messages.someErrorOccurred,
    };
  }

  String _getDefaultDioErrorCode(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout => 'CONNECTION_TIMEOUT',
      DioExceptionType.receiveTimeout => 'RECEIVE_TIMEOUT',
      DioExceptionType.sendTimeout => 'SEND_TIMEOUT',
      DioExceptionType.badResponse => 'BAD_RESPONSE',
      DioExceptionType.badCertificate => 'BAD_CERTIFICATE',
      DioExceptionType.connectionError => 'CONNECTION_ERROR',
      _ => 'UNKNOWN_DIO_ERROR',
    };
  }

  Future<T> _safelyParseResponse<T>(
    dynamic responseData,
    T Function(dynamic data) onSuccess,
  ) async {
    try {
      return onSuccess(responseData);
    } catch (e, s) {
      throw _JsonParsingException(e, s);
    }
  }
}

class _DioExceptionResult {
  const _DioExceptionResult({
    required this.message,
    this.statusCode,
    this.errorCode,
    this.errorData,
  });

  final String message;
  final int? statusCode;
  final String? errorCode;
  final Map<String, dynamic>? errorData;
}

class _JsonParsingException implements Exception {
  const _JsonParsingException(this.originalError, this.stackTrace);

  final Object originalError;
  final StackTrace stackTrace;

  @override
  String toString() => 'JsonParsingException: $originalError';
}
