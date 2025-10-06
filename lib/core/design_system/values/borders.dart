
import 'package:flutter/material.dart';
import 'package:m_ishaq_butt/core/design_system/values/sizes.dart';
import 'package:m_ishaq_butt/generated/assets/colors.gen.dart';

class Borders {
   static  UnderlineInputBorder primaryInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.grey,
      width: Sizes.WIDTH_1,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder enabledBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.grey, //ColorName.primaryColor,
      width: Sizes.WIDTH_2,
      style: BorderStyle.solid,
    ),
  );

  static  UnderlineInputBorder focusedBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: ColorName.black,
      width: Sizes.WIDTH_2,
      style: BorderStyle.solid,
    ),
  );
}
