import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/core/widgets/default_botton.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verification ', style: TextStyles.textStyle24),
            Text(
              'We’ve send you the verification code on mobail number.',
              style: TextStyles.textStyle16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
            Spacer(flex: 1),
            Pinput(length: 6, animationDuration: Duration(seconds: 1)),
            Spacer(flex: 10),
            DefaultBotton(
              textBotton: 'Continue',
              onPressrd: () {
                AppNavigations.pushReplaceMentTo(
                  context,
                  AppRoutes.changePasswordScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
