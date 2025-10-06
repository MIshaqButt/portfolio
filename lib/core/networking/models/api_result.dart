sealed class ApiResult<T> {
  const ApiResult();
}

class ApiSuccess<T> extends ApiResult<T> {
  const ApiSuccess({
    required this.data,
    this.message,
    this.statusCode,
    this.headers,
  });

  final T data;
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? headers;

  @override
  String toString() => 'ApiSuccess(data: $data, message: $message, statusCode: $statusCode)';
}

class ApiFailure<T> extends ApiResult<T> {
  const ApiFailure({
    required this.message,
    this.statusCode,
    this.errorCode,
    this.error,
    this.stackTrace,
    this.errorData,
  });

  final String message;
  final int? statusCode;
  final String? errorCode;
  final dynamic error;
  final StackTrace? stackTrace;
  final Map<String, dynamic>? errorData;

  @override
  String toString() => 'ApiFailure(message: $message, statusCode: $statusCode, errorCode: $errorCode)';
}