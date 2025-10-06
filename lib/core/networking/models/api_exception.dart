import 'package:equatable/equatable.dart';
import 'package:m_ishaq_butt/core/constants/messages.dart';

class ApiException extends Equatable implements Exception {
  const ApiException(this.message, {this.code = 500, this.error}) : super();

  final String message;
  final int? code;
  final dynamic error;

  static ApiException get unknownError => const ApiException(Messages.someErrorOccurred);

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
}
