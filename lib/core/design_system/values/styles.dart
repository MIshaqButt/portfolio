import 'package:flutter/material.dart';
import 'package:m_ishaq_butt/core/design_system/values/sizes.dart';
import 'package:m_ishaq_butt/generated/assets/colors.gen.dart';

class Styles {
  static TextStyle customTextStyle({
    Color color = ColorName.primaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle2({
    Color color = ColorName.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle3({
    Color color = ColorName.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle customTextStyle4({
    Color color = ColorName.secondaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.TEXT_SIZE_16,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
