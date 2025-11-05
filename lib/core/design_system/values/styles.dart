import 'package:flutter/material.dart';
import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';

class Styles {
  static TextStyle customTextStyle({
    Color color = ColorName.primaryColor,
    FontWeight fontWeight = FontWeight.w600,
    double fontSize = Sizes.textSize14,
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
    double fontSize = Sizes.textSize16,
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
    double fontSize = Sizes.textSize16,
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
    double fontSize = Sizes.textSize16,
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
