import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import 'main_button.dart';

class SecondaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool isIcon;
  final bool isIconLeft;
  final bool isIconRight;

  const SecondaryButton({
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
      backgroundColor: AppColors.secondaryButton,
      onPressed: onPressed,
      text: text,
      isIcon: isIcon,
      isIconLeft: isIconLeft,
      iconColor: AppColors.buttonText,
      isIconRight: isIconRight,
      textColor: AppColors.buttonText,
    );
  }
}
