import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';

class ComplatePage extends StatelessWidget {
  const ComplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            SvgPicture.asset(
              AppSvgAssets.logo,
            ),
            SizedBox(height: 60.h),
            Center(
              child: defaultText(
                "Congratulations!",
                fontSize: AppSize.textXSLarge,
                fontWeight: FontWeight.w700,
                color: AppColors.bodyText,
              ),
            ),
            Center(
                child: defaultText(
              "Your account is ready to use!",
              fontWeight: FontWeight.w400,
              color: AppColors.bodyText,
            )),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: PrimaryButton(onPressed: () {}, text: "Go to Homepage"),
            ),
          ],
        ),
      ),
    );
  }
}
