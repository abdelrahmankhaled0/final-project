import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/intro/welcome_screen/widgets/deafult_sign_up_bottom.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(child: Image.asset(AppImages.welcomeImage)),
              Gap(40),
              Text('Hello !', style: TextStyles.textStyle24),
              Gap(20),
              Text(
                '"Choose an option to access your emergency\n services: Log in for returning users or Sign\n up for new users."',
                textAlign: TextAlign.center,
                style: TextStyles.textStyle16.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
              Gap(120),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    DefaultBotton(
                      textBotton: "Sign in",
                      onPressrd: () {
                        AppNavigations.pushTo(context, AppRoutes.signin);
                      },
                    ),
                    Gap(20),
                    DefaultSignUpButton(
                      onPressed: () {
                        AppNavigations.pushTo(context, AppRoutes.signup);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
