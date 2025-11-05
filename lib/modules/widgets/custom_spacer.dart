import 'package:mishaqbutt/core/layout/adaptive.dart';
import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({ super.key, this.widthFactor, this.heightFactor, });

  final double? widthFactor;
  final double? heightFactor;

  @override
  Widget build(BuildContext context) {
    double widthFraction = widthFactor ?? 0;
    double heightFraction = heightFactor ?? 0;
    return SizedBox(
      width: assignWidth(context, widthFraction),
      height: assignHeight(context, heightFraction),
    );
  }
}