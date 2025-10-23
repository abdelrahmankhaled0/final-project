import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_form_filed.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot password', style: TextStyles.textStyle24),
            Text(
              'Don’t worry it happens. please enter the\ndatails associated with your account',
              style: TextStyles.textStyle16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
            Spacer(flex: 1),
            DefaultFormFiled(
              keyboardType: TextInputType.emailAddress,
              labelText: 'Enter your email',
              contrlloer: emailController,
            ),
            Spacer(flex: 10),
            DefaultBotton(
              textBotton: 'Get OTP',
              onPressrd: () {
                AppNavigations.pushReplaceMentTo(context, AppRoutes.otpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
