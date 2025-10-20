import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultBotton extends StatelessWidget {
  const DefaultBotton({super.key, required this.textBotton, this.onPressrd});

  final String textBotton;
  final VoidCallback? onPressrd;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.backGroundColor,
        fixedSize: Size(360, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),

      onPressed: onPressrd,
      child: Text(textBotton, style: TextStyles.textStyle16),
    );
  }
}
