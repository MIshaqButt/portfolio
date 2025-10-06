import 'package:dio/dio.dart';
import 'package:m_ishaq_butt/core/networking/method_type.dart';
import 'package:m_ishaq_butt/core/utils/typedefs.dart';

class RequestConfig {
  const RequestConfig({
    required this.url,
    required this.method,
    this.data,
    this.headers,
    this.queryParams,
    this.cancelToken,
    this.options,
  });

  final String url;
  final MethodType method;
  final dynamic data;
  final Json? headers;
  final Json? queryParams;
  final CancelToken? cancelToken;
  final Options? options;

  RequestConfig copyWith({
    String? url,
    MethodType? method,
    dynamic data,
    Json? headers,
    Json? queryParams,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return RequestConfig(
      url: url ?? this.url,
      method: method ?? this.method,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      queryParams: queryParams ?? this.queryParams,
      cancelToken: cancelToken ?? this.cancelToken,
      options: options ?? this.options,
    );
  }
}