import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultSignUpButton extends StatelessWidget {
  const DefaultSignUpButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backGroundColor,
        foregroundColor: AppColors.primaryColor,
        fixedSize: Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: AppColors.borderColor, width: 1),
        ),
      ),
      onPressed: onPressed,
      child: Text("Sign Up", style: TextStyles.textStyle16),
    );
  }
}
