import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:m_ishaq_butt/core/utils/logger.dart';

class LoggingInterceptor extends Interceptor with Logger {
  const LoggingInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!kReleaseMode) {
      // Start timing
      options.extra['request_start_time'] = DateTime.now().millisecondsSinceEpoch;
      _logRequest(options);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      _logResponse(response);
      _logTiming(response.requestOptions, 'SUCCESS', response.statusCode);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!kReleaseMode) {
      _logError(err);
      _logTiming(err.requestOptions, 'ERROR', err.response?.statusCode);
    }
    super.onError(err, handler);
  }

  void _logRequest(RequestOptions options) {
    final buffer = StringBuffer();

    buffer.writeln('📤 API REQUEST');
    buffer.writeln('Method: ${options.method.toUpperCase()}');
    buffer.writeln('URL: ${options.uri}');
    buffer.writeln('Base URL: ${options.baseUrl}');
    buffer.writeln('Path: ${options.path}');

    // Headers
    if (options.headers.isNotEmpty) {
      buffer.writeln('Headers:');
      options.headers.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    // Query Parameters
    if (options.queryParameters.isNotEmpty) {
      buffer.writeln('Query Parameters:');
      options.queryParameters.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    // Request Body
    if (options.data != null) {
      buffer.writeln('Request Body:');
      final body = _formatRequestBody(options.data);
      for (final line in body.split('\n')) {
        buffer.writeln('  $line');
      }
    }

    // Additional Options
    buffer.writeln(
      'Connect Timeout: ${options.connectTimeout?.inMilliseconds}ms',
    );

    buffer.writeln(
      'Receive Timeout: ${options.receiveTimeout?.inMilliseconds}ms',
    );

    buffer.writeln('Send Timeout: ${options.sendTimeout?.inMilliseconds}ms');
    buffer.writeln('Follow Redirects: ${options.followRedirects}');
    buffer.writeln('Max Redirects: ${options.maxRedirects}');

    dev.log(buffer.toString(), name: 'API_REQUEST');
  }

  void _logResponse(Response response) {
    final buffer = StringBuffer();
    final options = response.requestOptions;

    buffer.writeln('📥 API RESPONSE');
    buffer.writeln('Method: ${options.method.toUpperCase()}');
    buffer.writeln('URL: ${options.uri}');
    buffer.writeln(
      'Status Code: ${response.statusCode} ${response.statusMessage ?? ''}',
    );

    // Response Headers
    if (response.headers.map.isNotEmpty) {
      buffer.writeln('Response Headers:');
      response.headers.map.forEach((key, value) {
        buffer.writeln('  $key: ${value.join(', ')}');
      });
    }

    // Response Body
    if (response.data != null) {
      buffer.writeln('Response Body:');
      final body = _formatResponseBody(response.data);
      for (final line in body.split('\n')) {
        buffer.writeln('  $line');
      }
    }

    // Response Info
    if (response.extra.isNotEmpty) {
      buffer.writeln('Response Extra:');
      response.extra.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    buffer.writeln('Is Redirect: ${response.isRedirect}');
    buffer.writeln('Real URI: ${response.realUri}');

    dev.log(buffer.toString(), name: 'API_RESPONSE');
  }

  void _logError(DioException error) {
    final buffer = StringBuffer();
    final options = error.requestOptions;
    final response = error.response;

    buffer.writeln('❌ API ERROR');
    buffer.writeln('Method: ${options.method.toUpperCase()}');
    buffer.writeln('URL: ${options.uri}');
    buffer.writeln('Error Type: ${error.type.name}');
    buffer.writeln('Error Message: ${error.message}');

    if (response != null) {
      buffer.writeln(
        'Status Code: ${response.statusCode} ${response.statusMessage ?? ''}',
      );

      // Error Response Headers
      if (response.headers.map.isNotEmpty) {
        buffer.writeln('Error Response Headers:');
        response.headers.map.forEach((key, value) {
          buffer.writeln('  $key: ${value.join(', ')}');
        });
      }

      // Error Response Body
      if (response.data != null) {
        buffer.writeln('Error Response Body:');
        final body = _formatResponseBody(response.data);
        for (final line in body.split('\n')) {
          buffer.writeln('  $line');
        }
      }
    }

    // Request Information for Error Context
    buffer.writeln('Request Headers:');
    options.headers.forEach((key, value) {
      buffer.writeln('  $key: $value');
    });

    if (options.data != null) {
      buffer.writeln('Request Body:');
      final body = _formatRequestBody(options.data);
      for (final line in body.split('\n')) {
        buffer.writeln('  $line');
      }
    }

    dev.log(buffer.toString(), name: 'API_ERROR');
  }

  String _formatRequestBody(dynamic data) {
    if (data == null) return 'null';

    try {
      if (data is String) {
        // Try to parse and format if it's JSON string
        try {
          final parsed = jsonDecode(data);
          return _prettyPrintJson(parsed);
        } catch (_) {
          return data;
        }
      } else if (data is Map || data is List) {
        return _prettyPrintJson(data);
      } else if (data is FormData) {
        final buffer = StringBuffer();
        buffer.writeln('FormData:');
        for (final field in data.fields) {
          buffer.writeln('  ${field.key}: ${field.value}');
        }
        for (final file in data.files) {
          buffer.writeln(
            '  ${file.key}: ${file.value.filename} (${file.value.length} bytes)',
          );
        }
        return buffer.toString();
      } else {
        return data.toString();
      }
    } catch (e) {
      return 'Error formatting request body: $e\nRaw: $data';
    }
  }

  String _formatResponseBody(dynamic data) {
    if (data == null) return 'null';

    try {
      if (data is String) {
        // Try to parse and format if it's JSON string
        try {
          final parsed = jsonDecode(data);
          return _prettyPrintJson(parsed);
        } catch (_) {
          return data;
        }
      } else if (data is Map || data is List) {
        return _prettyPrintJson(data);
      } else {
        return data.toString();
      }
    } catch (e) {
      return 'Error formatting response body: $e\nRaw: $data';
    }
  }

  String _prettyPrintJson(dynamic json) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(json);
    } catch (e) {
      return json.toString();
    }
  }

  void _logTiming(RequestOptions options, String result, int? statusCode) {
    final startTime = options.extra['request_start_time'] as int?;
    if (startTime == null) return;

    final endTime = DateTime.now().millisecondsSinceEpoch;
    final duration = endTime - startTime;
    
    final message = '⏱️ Duration: ${duration}ms - Speed: ${_getSpeedIndicator(duration)}';

    dev.log(message, name: 'API_TIMING');
  }

  String _getSpeedIndicator(int durationMs) {
    if (durationMs < 200) return '🚀 Very Fast';
    if (durationMs < 500) return '⚡ Fast';
    if (durationMs < 1000) return '🔶 Moderate';
    if (durationMs < 3000) return '🔸 Slow';
    return '🐌 Very Slow';
  }
}
