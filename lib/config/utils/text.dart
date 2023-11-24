import 'package:flutter/material.dart';
import 'size.dart';

Text defaultText(
  String text, {
  double? fontSize,
  double? height,
  FontWeight? fontWeight,
  Color? color,
  int? maxLines,
  TextOverflow? overflow,
  TextAlign? textAlign,
  TextStyle? style,
}) {
  return Text(
    text,
    style: style ??
        TextStyle(
          fontFamily: "Poppins",
          fontSize: fontSize ?? AppSize.textMedium,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          height: height,
          // fontFamily: "UberMoveText",
        ),
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );
}
