import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign In', style: TextStyles.textStyle24),
            Gap(12),
            Text(
              'Welcome back! Let’s continue your\njourney with us.',
              style: TextStyles.textStyle16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
            Gap(40),
            TextFormField(decoration: InputDecoration()),
          ],
        ),
      ),
    );
  }
}
