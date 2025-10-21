import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultFormFiled extends StatelessWidget {
  const DefaultFormFiled({
    super.key,
    required this.labelText,
    required this.contrlloer,
  });

  final String labelText;
  final TextEditingController contrlloer;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contrlloer,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyles.textStyle16.copyWith(
          color: AppColors.textLableColor,
        ),
      ),

      cursorColor: AppColors.primaryColor,
    );
  }
}
