import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/utils/custom_font_size.dart';
import '../../../../config/utils/size.dart';
import '../../../../core/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? prefixIcon;
  final String? suffixIcon;
  final Function()? onTapPrefixIcon;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;

  final bool isError;
  final bool obscureText;
  final String? errorText;
  final String? hintText;

  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapPrefixIcon,
    required this.textEditingController,
    this.isError = false,
    this.errorText,
    this.focusNode,
    this.hintText,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () {
        widget.focusNode?.unfocus();
      },
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      cursorColor: AppColors.bodyText,
      style: TextStyle(
        color: Colors.black,
        fontSize: AppSize.textSmall,
        fontWeight: FontWeight.w400,
      ),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14.csp,
          fontWeight: FontWeight.w400,
          color: AppColors.placeholder,
        ),
        errorText: widget.isError ? "\u26A0 ${widget.errorText}" : null,
        errorStyle: TextStyle(
          color: AppColors.errorDark,
          fontSize: AppSize.textSmall,
          fontWeight: FontWeight.w400,
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(15.r),
        prefixIcon: widget.prefixIcon != null
            ? Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: SvgPicture.asset(widget.prefixIcon!))
            : null,
        suffixIcon: widget.suffixIcon != null
            ? InkWell(
                onTap: widget.onTapPrefixIcon,
                child: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: SvgPicture.asset(widget.suffixIcon!),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.bodyText,
          ),
          borderRadius: AppSize.borderRadius6,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.bodyText,
          ),
          borderRadius: AppSize.borderRadius6,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.bodyText,
          ),
          borderRadius: AppSize.borderRadius6,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.errorDark,
          ),
          borderRadius: AppSize.borderRadius6,
        ),
      ),
    );
  }
}
