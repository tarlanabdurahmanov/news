import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/custom_font_size.dart';
import '../../../../config/utils/text.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button/primary_button.dart';
import '../widgets/textformfield.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
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
                  "Reset\nPassword ?",
                  fontSize: 32.csp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.bodyText,
                ),
                SizedBox(height: 13.h),
                defaultText("New Password*"),
                CustomTextFormField(
                  textEditingController: TextEditingController(),
                  obscureText: true,
                  focusNode: _focusNode,
                ),
                SizedBox(height: 13.h),
                defaultText("Confirm new password*"),
                CustomTextFormField(
                  textEditingController: TextEditingController(),
                  obscureText: true,
                ),
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
              onPressed: () {},
              text: "Submit",
            ),
          ),
        ],
      ),
    );
  }
}
