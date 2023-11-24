import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';
import '../widgets/button/social_button.dart';
import '../widgets/textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultText(
                "Hello!",
                fontSize: AppSize.textXXLarge,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
              defaultText(
                "Signup to get Started",
                fontSize: AppSize.textLarge,
                fontWeight: FontWeight.w400,
                color: AppColors.bodyText,
              ),
              SizedBox(height: 48.h),
              defaultText(
                "Username",
                fontSize: AppSize.textSmall,
              ),
              SizedBox(height: 4.h),
              CustomTextFormField(
                textEditingController: TextEditingController(),
                onTapPrefixIcon: () {},
              ),
              SizedBox(height: 16.h),
              defaultText(
                "Password",
                fontSize: AppSize.textSmall,
              ),
              CustomTextFormField(
                textEditingController: TextEditingController(),
                onTapPrefixIcon: () {},
                obscureText: true,
                suffixIcon: AppSvgAssets.eyeHidden,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                        child: Checkbox(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          side: BorderSide(
                            color: AppColors.bodyText,
                          ),
                          value: true,
                          onChanged: (value) {},
                          activeColor: AppColors.primary,
                        ),
                      ),
                      defaultText(
                        "Remember me",
                        fontSize: AppSize.textSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.bodyText,
                      ),
                    ],
                  ),
                  defaultText(
                    "Forgot the password ?",
                    fontSize: AppSize.textSmall,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(
                width: double.maxFinite,
                child: PrimaryButton(onPressed: () {}, text: "Login"),
              ),
              SizedBox(height: 16.h),
              Center(
                child: defaultText(
                  "or continue with",
                  fontSize: AppSize.textSmall,
                  color: AppColors.bodyText,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Flexible(
                    child: SocialButton(
                      icon: AppSvgAssets.facebook,
                      onPressed: () {},
                      text: "Facebook",
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: SocialButton(
                      icon: AppSvgAssets.google,
                      onPressed: () {},
                      text: "Google",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account ?',
                    style: TextStyle(
                      color: AppColors.bodyText,
                      fontSize: 14.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
