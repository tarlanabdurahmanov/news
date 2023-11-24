import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_font_size.dart';

// SizedBox defaultSizedBox({
//   double? height,
//   double? width,
//   bool bottomBar = false,
// }) {
//   if (height != null) {
//     return SizedBox(
//       height: height + (bottomBar ? ScreenUtil().bottomBarHeight : 0),
//     );
//   } else {
//     return SizedBox(
//       height: height ?? (bottomBar ? ScreenUtil().bottomBarHeight : 0),
//       width: width ?? 0,
//     );
//   }
// }

// var borderRadius24 = 24.r;
// var borderRadius20 = 20.r;
// var borderRadius16 = 16.r;
// var borderRadius12 = 12.r;
// var borderRadius14 = 14.r;

class AppSize {
  static double bottomBarHeight = ScreenUtil().bottomBarHeight;
  static double screenWidth = ScreenUtil().screenWidth;

  static double textXSmall = 13.csp;
  static double textSmall = 14.csp;
  static double textMedium = 16.csp;
  static double textLarge = 20.csp;
  static double textXLarge = 24.csp;
  static double textXSLarge = 32.csp;
  static double textXXLarge = 48.csp;

  static double buttonBorderRadius = 6.r;

  static BorderRadius borderRadius6 = BorderRadius.circular(6.r);
}
