import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Gap(10),
        Text(
          "Or",
          style: TextStyles.textStyle16.copyWith(color: AppColors.grayColor),
        ),
        Gap(10),
        Expanded(child: Divider()),
      ],
    );
  }
}
