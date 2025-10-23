import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_divider.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_forget_password_row.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_form_filed.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_password_form_filed.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_social_register.dart';
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
              DefaultPasswordFormFiled(
                controller: passwordController,
                lableText: "Password",
              ),
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
                    onPressed: () {
                      AppNavigations.pushTo(context, AppRoutes.forgetPassword);
                    },
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
              DefaultBotton(
                textBotton: "Sign In",
                onPressrd: () {
                  AppNavigations.pushReplaceMentTo(
                    context,
                    AppRoutes.homeScreen,
                  );
                },
              ),
              Gap(30),
              DefaultDivider(),
              Gap(25),
              DefaultSocialRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
