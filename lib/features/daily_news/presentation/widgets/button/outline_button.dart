import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import 'main_button.dart';

class OutlineButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool isIcon;
  final bool isIconRight;
  final bool isIconLeft;

  const OutlineButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isIcon = false,
    this.isIconRight = false,
    this.isIconLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return MainButton(
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
      text: text,
      isOutline: true,
      iconColor: AppColors.primary,
      isIcon: isIcon,
      isIconLeft: isIconLeft,
      isIconRight: isIconRight,
      textColor: AppColors.primary,
    );
  }
}
