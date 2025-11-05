
import 'package:flutter/material.dart';
import 'package:mishaqbutt/core/design_system/values/sizes.dart';
import 'package:mishaqbutt/generated/assets/colors.gen.dart';

class Borders {
   static  UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.grey,
      width: Sizes.width1,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.grey, //ColorName.primaryColor,
      width: Sizes.width2,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.black,
      width: Sizes.width2,
      style: BorderStyle.solid,
    ),
  );
}
