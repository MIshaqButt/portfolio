import 'package:flutter/material.dart';
import 'package:m_ishaq_butt/core/design_system/values/sizes.dart';
import 'package:m_ishaq_butt/core/design_system/values/strings.dart';
import 'package:m_ishaq_butt/generated/assets/colors.gen.dart';

class MIBTheme {
  static const _lightFillColor = ColorName.primaryColor;

  static final Color _lightFocusColor = ColorName.primaryColor.withValues(alpha: 0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: ColorName.white),
      canvasColor: colorScheme.inversePrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.primaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorName.black,
        selectionColor: ColorName.textSelectionColor,
        selectionHandleColor: ColorName.primaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.inversePrimary,
      highlightColor: Colors.transparent,
      focusColor: ColorName.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: ColorName.primaryColor,
    primaryContainer: ColorName.primaryColor,
    secondary: ColorName.secondaryColor,
    secondaryContainer: ColorName.black,
    surface: ColorName.primaryColor,
    onSurfaceVariant: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_96,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_60,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      fontSize: Sizes.TEXT_SIZE_48,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_34,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      fontSize: Sizes.TEXT_SIZE_24,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_20,
      color: ColorName.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: ColorName.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      fontSize: Sizes.TEXT_SIZE_14,
      color: ColorName.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: ColorName.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: Sizes.TEXT_SIZE_14,
      color: ColorName.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      fontSize: Sizes.TEXT_SIZE_14,
      color: ColorName.secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: _medium,
    ),
    bodySmall: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_12,
      color: ColorName.white,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}
