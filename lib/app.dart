import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:m_ishaq_butt/core/design_system/theme/mib_theme.dart';
import 'package:m_ishaq_butt/core/design_system/values/strings.dart';
import 'package:m_ishaq_butt/generated/assets/colors.gen.dart';
import 'package:m_ishaq_butt/modules/home/home_page.dart';
import 'package:m_ishaq_butt/presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.appTitle,
        theme: MIBTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}


final class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.grey,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 28,
              color: ColorName.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Some unexpected issue occurred during loading.\nPlease restart the app to get everything working smoothly again.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: ColorName.primaryColor.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}