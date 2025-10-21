import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultForgetPasswordRow extends StatefulWidget {
  const DefaultForgetPasswordRow({super.key});

  @override
  State<DefaultForgetPasswordRow> createState() =>
      _DefaultForgetPasswordRowState();
}

Color boxColor = AppColors.backGroundColor;

class _DefaultForgetPasswordRowState extends State<DefaultForgetPasswordRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          boxColor = boxColor == AppColors.backGroundColor
              ? AppColors.primaryColor
              : AppColors.backGroundColor;
        });
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: AppColors.grayColor),
        ),
        duration: Duration(milliseconds: 200),
        child: boxColor == AppColors.backGroundColor
            ? Text('')
            : Center(
                child: Icon(Icons.check, color: AppColors.backGroundColor),
              ),
      ),
    );
  }
}
