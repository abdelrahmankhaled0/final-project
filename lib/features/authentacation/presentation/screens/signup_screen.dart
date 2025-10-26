import 'package:flutter/material.dart';
import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_divider.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_form_filed.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_password_form_filed.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_social_register.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

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
              Text('Sign up', style: TextStyles.textStyle24),
              Gap(12),
              Text(
                'Welcome let’s start managing your health journey together.',
                style: TextStyles.textStyle16.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
              Gap(40),
              DefaultFormFiled(labelText: "Name", contrlloer: nameController),
              Gap(20),
              DefaultFormFiled(
                labelText: "Phone no/Email",
                contrlloer: emailController,
              ),
              Gap(20),
              DefaultPasswordFormFiled(
                controller: passwordController,
                lableText: "Password",
              ),
              Gap(20),
              DefaultPasswordFormFiled(
                controller: confirmPasswordController,
                lableText: "Confirm password",
              ),

              Gap(70),
              DefaultBotton(
                textBotton: "Sign Up",
                onPressrd: () {
                  AppNavigations.pushReplaceMentTo(context, AppRoutes.signin);
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
