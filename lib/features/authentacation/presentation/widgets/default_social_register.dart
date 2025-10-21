import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultSocialRegister extends StatelessWidget {
  const DefaultSocialRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.grayColor, width: 1),
          ),

          child: Image.asset(AppImages.googleImage),
        ),
        Gap(5),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.grayColor, width: 1),
          ),

          child: Image.asset(AppImages.facebookImage),
        ),
        Gap(5),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.grayColor, width: 1),
          ),

          child: Image.asset(AppImages.iphoneImage),
        ),
      ],
    );
  }
}
