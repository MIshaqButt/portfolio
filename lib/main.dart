import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mishaqbutt/app.dart';
import 'package:mishaqbutt/core/dependency_injection/injection_container.dart';
import 'package:mishaqbutt/core/utils/configure_web.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // add more dependencies here
      await Future.wait([
        const DependencyInjection()(),
      ]);

      if (kReleaseMode) {
        ErrorWidget.builder = (_) => const AppError();
      }
      configureApp();
      runApp(const MyApp());
    },
    (e, s) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          stack: s,
          library: 'main',
          context: ErrorDescription('Uncaught zone error'),
        ),
      );
    },
  );
}


