import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:flutter/material.dart';

class SuccessChangePasswordScreen extends StatelessWidget {
  const SuccessChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Congratulations', style: TextStyles.textStyle24),
            Text(
              'You account password successfully\nreset',
              textAlign: TextAlign.center,
              style: TextStyles.textStyle20.copyWith(
                color: AppColors.grayColor,
              ),
            ),
            Spacer(flex: 1),
            Image.asset(
              AppImages.successImage,
              fit: BoxFit.cover,
              width: 310,
              height: 280,
            ),
            Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: DefaultBotton(
                textBotton: 'Let’s Start',
                onPressrd: () {
                  AppNavigations.pushReplaceMentTo(context, AppRoutes.signin);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
