import 'package:fas7ny/constants/my_colors.dart';
import 'package:flutter/material.dart';

class Constants {
  static const TextTheme appThemes = TextTheme(
    caption: TextStyle(
        color: MyColors.myblack,
        fontSize: 22,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.bold),
    subtitle1: TextStyle(
        color: MyColors.myWhite,
        fontSize: 14,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w300),
    headline2: TextStyle(
        color: MyColors.myDarkGrey,
        fontSize: 28,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w700),
  );
}
