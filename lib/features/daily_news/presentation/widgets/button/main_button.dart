// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/assets.dart';
import 'package:newsapp/core/constants/colors.dart';

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final bool isOutline;
  final bool isIconRight;
  final bool isIconLeft;
  final bool isIcon;

  const MainButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.isOutline = false,
    this.isIconRight = false,
    this.isIconLeft = false,
    this.isIcon = false,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isOutline
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              backgroundColor: backgroundColor,
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: !isIcon
                  ? EdgeInsets.symmetric(vertical: 13.h, horizontal: 24.w)
                  : EdgeInsets.only(
                      left: 24.w,
                      right: 16.w,
                      top: 13.h,
                      bottom: 13.h,
                    ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.buttonBorderRadius),
              ),
            ),
            child: !isIcon
                ? defaultText(
                    text,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isIconRight && !isIconLeft) ...[
                        SizedBox(width: 24.w),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                      ] else if (isIconLeft && !isIconRight) ...[
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 24.w),
                      ] else if (isIconLeft && isIconRight) ...[
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SvgPicture.asset(
                          AppSvgAssets.arrowDown,
                          color: iconColor,
                        ),
                      ]
                    ],
                  ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              backgroundColor: backgroundColor,
              elevation: 0,
              shadowColor: Colors.white,
              padding: !isIcon
                  ? EdgeInsets.symmetric(vertical: 13.h, horizontal: 24.w)
                  : EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                      top: 4.h,
                      bottom: 4.h,
                    ),
              side: BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.buttonBorderRadius),
              ),
            ),
            child: !isIcon
                ? defaultText(
                    text,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isIconRight && !isIconLeft) ...[
                        SizedBox(width: 24.w),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                      ] else if (isIconLeft && !isIconRight) ...[
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        // SizedBox(width: 24.w),
                      ] else if (isIconLeft && isIconRight) ...[
                        SvgPicture.asset(
                          AppSvgAssets.plus,
                          color: iconColor,
                        ),
                        defaultText(
                          text,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SvgPicture.asset(
                          AppSvgAssets.arrowDown,
                          color: iconColor,
                        ),
                      ]
                    ],
                  ),
          );
  }
}
