// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:newsapp/config/utils/size.dart';
import 'package:newsapp/config/utils/text.dart';
import 'package:newsapp/core/constants/colors.dart';

class RowTextWidget extends StatelessWidget {
  final String prefixText;
  final String? suffixText;
  final Function()? onTap;

  const RowTextWidget({
    Key? key,
    required this.prefixText,
    this.suffixText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        defaultText(
          prefixText,
          fontWeight: FontWeight.w600,
        ),
        if (suffixText != null)
          InkWell(
            onTap: onTap,
            child: defaultText(
              suffixText!,
              fontSize: AppSize.textSmall,
              color: AppColors.bodyText,
            ),
          ),
      ],
    );
  }
}
