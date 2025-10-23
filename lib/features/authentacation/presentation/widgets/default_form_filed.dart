import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultFormFiled extends StatelessWidget {
  const DefaultFormFiled({
    super.key,
    required this.labelText,
    required this.contrlloer,
    this.keyboardType,
  });

  final String labelText;
  final TextEditingController contrlloer;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: contrlloer,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyles.textStyle16.copyWith(color: AppColors.grayColor),
      ),

      cursorColor: AppColors.primaryColor,
    );
  }
}
