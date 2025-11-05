import 'package:flutter/material.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.title = "MIB",
    this.titleColor = ColorName.black,
    this.titleStyle,
    this.fontSize = 60,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: titleStyle ??
          textTheme.displayMedium?.copyWith(
            color: titleColor,
            fontSize: fontSize,
          ),
    );
  }
}
