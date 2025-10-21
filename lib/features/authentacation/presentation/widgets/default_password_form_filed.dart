import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';

class DefaultPasswordFormFiled extends StatefulWidget {
  const DefaultPasswordFormFiled({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<DefaultPasswordFormFiled> createState() =>
      _DefaultPasswordFormFiledState();
}

class _DefaultPasswordFormFiledState extends State<DefaultPasswordFormFiled> {
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      cursorColor: AppColors.primaryColor,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyles.textStyle16.copyWith(
          color: AppColors.textLableColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          icon: isPassword
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
    );
  }
}
