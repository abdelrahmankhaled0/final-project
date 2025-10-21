import 'package:final_project/core/constants/app_images.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_forget_password_row.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_form_filed.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_password_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              DefaultFormFiled(
                labelText: "Phone no/Email",
                contrlloer: emailController,
              ),
              Gap(20),
              DefaultPasswordFormFiled(controller: passwordController),
              Row(
                children: [
                  DefaultForgetPasswordRow(),
                  Gap(10),
                  Text(
                    'Remember me',
                    style: TextStyles.textStyle16.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyles.textStyle16.copyWith(
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(70),
              DefaultBotton(textBotton: "Sign In", onPressrd: () {}),
              Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(10),
                  Text(
                    "Or",
                    style: TextStyles.textStyle16.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                  Gap(10),
                  Expanded(child: Divider()),
                ],
              ),

              Gap(25),
              Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
