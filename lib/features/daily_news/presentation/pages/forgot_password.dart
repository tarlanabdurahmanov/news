import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/custom_font_size.dart';
import '../../../../config/utils/size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';
import '../widgets/textformfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  int isState = 0;
  int selectedRadio = 0;
  FocusNode focusNode = FocusNode();

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  void changeState(val) {
    setState(() {
      isState = val;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultText(
                  "Forgot\nPassword ?",
                  fontSize: 32.csp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bodyText,
                ),
                defaultText(
                  "Don’t worry! it happens. Please select the email or number associated with your account.",
                  color: AppColors.bodyText,
                ),
                SizedBox(height: 16.h),
                if (isState == 0) ...[
                  _radioItem(
                    title: 'via Email:',
                    subTitle: "example@youremail.com",
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(val!);
                    },
                    selectedRadio: selectedRadio,
                    icon: AppSvgAssets.email,
                  ),
                  SizedBox(height: 16.h),
                  _radioItem(
                    title: 'via SMS:',
                    subTitle: "+62-8421-4512-2531",
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      setSelectedRadio(val!);
                    },
                    selectedRadio: selectedRadio,
                    icon: AppSvgAssets.message,
                  ),
                ] else ...[
                  defaultText("Email ID / Mobile number"),
                  CustomTextFormField(
                    textEditingController: TextEditingController(),
                    focusNode: focusNode,
                  ),
                ]
              ],
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
              onPressed: () {
                if (isState == 0) {
                  changeState(1);
                  focusNode.requestFocus();
                }
              },
              text: "Submit",
            ),
          ),
        ],
      ),
    );
  }

  Container _radioItem({
    required String title,
    required String subTitle,
    required int value,
    required int groupValue,
    required String icon,
    required Function(int?) onChanged,
    required int selectedRadio,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryButton,
        borderRadius: AppSize.borderRadius6,
      ),
      padding: EdgeInsets.only(
        left: 18.w,
        top: 18.h,
        bottom: 18.h,
        right: 10.w,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: AppSize.borderRadius6,
            ),
            padding: EdgeInsets.all(20.r),
            child: SvgPicture.asset(icon),
          ),
          Flexible(
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: AppColors.buttonText.withOpacity(0.3),
              ),
              child: RadioListTile(
                value: value,
                contentPadding: EdgeInsets.only(left: 10.w),
                groupValue: groupValue,
                title: defaultText(
                  title,
                  fontSize: AppSize.textSmall,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                ),
                selected: true,
                selectedTileColor: AppColors.backgroundDarkmode,
                subtitle: defaultText(
                  subTitle,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: onChanged,
                activeColor: AppColors.primary,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
          )
        ],
      ),
    );
  }
}
