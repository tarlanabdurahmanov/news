import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/custom_font_size.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 64.w,
      height: 64.w,
      textStyle: TextStyle(
        fontSize: 32.csp,
        color: AppColors.titleActive,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: AppSize.borderRadius6,
        border: Border.all(color: AppColors.bodyText),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(AppSvgAssets.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: defaultText(
              "OTP Verification",
              color: AppColors.bodyText,
              fontSize: AppSize.textXSLarge,
              fontWeight: FontWeight.w700,
            ),
          ),
          Center(
            child: defaultText(
              "Enter the OTP sent to +67-1234-5678-9",
              color: AppColors.bodyText,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 27.h),
          Pinput(
            controller: pinController,
            focusNode: focusNode,
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            validator: (value) {
              return value == '2222' ? null : 'Invalid OTP';
            },
            // onClipboardFound: (value) {
            //   debugPrint('onClipboardFound: $value');
            //   pinController.setText(value);
            // },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
            },
            onChanged: (value) {
              debugPrint('onChanged: $value');
            },
            showCursor: false,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: AppSize.borderRadius6,
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: AppSize.borderRadius6,
              ),
            ),
            errorPinTheme: defaultPinTheme.copyWith(
              decoration: BoxDecoration(
                color: AppColors.errorLight,
                border: Border.all(color: AppColors.errorDark),
                borderRadius: AppSize.borderRadius6,
              ),
            ),
          ),
          SizedBox(height: 27.h),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Resend code in ',
                style: TextStyle(
                  color: AppColors.bodyText,
                  fontSize: 14.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '56s',
                      style: TextStyle(
                        color: AppColors.errorDark,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(-2, 4),
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 20,
                )
              ],
            ),
            padding: EdgeInsets.symmetric(
              vertical: 30.h,
              horizontal: 20.w,
            ),
            child: PrimaryButton(
              onPressed: () {},
              text: "Verify",
            ),
          ),
        ],
      ),
    );
  }
}
