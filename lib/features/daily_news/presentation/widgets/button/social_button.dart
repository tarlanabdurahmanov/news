// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/colors.dart';

class SocialButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final String icon;

  const SocialButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.secondaryButton,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.only(
          left: 24.w,
          right: 16.w,
          top: 13.h,
          bottom: 13.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.buttonBorderRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 10.w),
          defaultText(
            text,
            color: AppColors.buttonText,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
