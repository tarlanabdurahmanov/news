import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import 'main_button.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool isIcon;
  final bool isIconLeft;
  final bool isIconRight;

  const PrimaryButton({
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
      backgroundColor: AppColors.primary,
      onPressed: onPressed,
      text: text,
      isIcon: isIcon,
      isIconLeft: isIconLeft,
      isIconRight: isIconRight,
      textColor: Colors.white,
    );
  }
}
