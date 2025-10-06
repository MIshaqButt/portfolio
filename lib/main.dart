import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m_ishaq_butt/app.dart';
import 'package:m_ishaq_butt/core/dependency_injection/injection_container.dart';
import 'package:m_ishaq_butt/core/utils/configure_web.dart';

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
      // TODO Add logging/crashlytics support here
    },
  );
}


