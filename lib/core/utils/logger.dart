import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

mixin Logger {
  void logError(
    Object? error,
    StackTrace? stackTrace, {
    bool shouldReport = false,
  }) {
    final callerInfo = _getCallerInfo(stackTrace ?? StackTrace.current);

    dev.log(
      error?.toString() ?? 'Unknown error',
      name: callerInfo,
      error: error,
      stackTrace: stackTrace,
      level: 1000, // Error level
    );

    if (shouldReport && error != null) {
      _reportToCrashlytics(error, stackTrace ?? StackTrace.current, callerInfo);
    }
  }

  void logInfo(
    String message, {
    Map<String, dynamic>? data,
  }) {
    final callerInfo = _getCallerInfo(StackTrace.current);

    final logMessage = data != null ? '$message\nData: $data' : message;

    dev.log(
      logMessage,
      name: callerInfo,
      level: 800, // Info level
    );
  }

  String _getCallerInfo(StackTrace stackTrace) {
    try {
      final frames = stackTrace.toString().split('\n');

      // Skip the first few frames to get to the actual caller
      for (int i = 0; i < frames.length; i++) {
        final frame = frames[i];

        // Skip Logger internal methods and getters
        if (frame.contains('Logger.') ||
            frame.contains('_getCallerInfo') ||
            frame.contains('logError') ||
            frame.contains('logInfo')) {
          continue;
        }

        // Extract class and method name from stack trace
        final match = RegExp(r'#\d+\s+(.+?)\s+\(').firstMatch(frame);
        if (match != null) {
          final fullMethodName = match.group(1);
          if (fullMethodName != null) {
            // Format: ClassName.methodName or just methodName
            final parts = fullMethodName.split('.');
            if (parts.length >= 2) {
              final className = parts[parts.length - 2];
              final methodName = parts[parts.length - 1];
              return '$className.$methodName';
            } else {
              return fullMethodName;
            }
          }
        }
      }

      return 'Unknown';
    } catch (e) {
      return 'Logger_Error';
    }
  }

  void _reportToCrashlytics(
    Object error,
    StackTrace stackTrace,
    String context,
  ) {
    if (kReleaseMode) {
      try {
        // TODO Uncomment it once added
        // FirebaseCrashlytics.instance.recordError(
        //   error,
        //   stackTrace,
        //   reason: 'Error in $context',
        //   fatal: false,
        // );
      } catch (crashlyticsError) {
        // If Crashlytics fails, just log it locally to avoid infinite loops
        dev.log(
          'Failed to report to Crashlytics: $crashlyticsError',
          name: 'Logger._reportToCrashlytics',
          level: 1000,
        );
      }
    }
  }
}
