import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:final_project/features/authentacation/presentation/widgets/default_password_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('Reset password', style: TextStyles.textStyle24),
            Spacer(flex: 1),
            DefaultPasswordFormFiled(
              controller: passwordController,
              lableText: "New Password",
            ),
            Gap(20),
            DefaultPasswordFormFiled(
              controller: confirmPasswordController,
              lableText: "Confirm password",
            ),
            Spacer(flex: 10),
            DefaultBotton(
              textBotton: 'Confirm password',
              onPressrd: () {
                AppNavigations.pushReplaceMentTo(
                  context,
                  AppRoutes.successChangePasswordScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
