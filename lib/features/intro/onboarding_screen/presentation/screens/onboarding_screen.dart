import 'package:final_project/core/routes/navigations.dart';
import 'package:final_project/core/routes/routes.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/core/utils/text.dart';
import 'package:final_project/features/onboarding_screen/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();

  final OnboardingModel onboardingModel = OnboardingModel();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10),
            child: SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  AppNavigations.pushReplaceMentTo(context, AppRoutes.welcome);
                },
                child: Text('Skip', style: TextStyles.textStyle16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                physics: BouncingScrollPhysics(),
                itemCount: onboardingModel.images.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: Image.asset(onboardingModel.images[index]),
                      ),

                      Text(
                        textAlign: TextAlign.center,
                        onboardingModel.headTitles[index],
                        style: TextStyles.textStyle24,
                      ),
                      SizedBox(height: 50),
                      Text(
                        onboardingModel.subTitles[index],
                        textAlign: TextAlign.center,
                        style: TextStyles.textStyle16,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            SmoothPageIndicator(
              controller: pageController,
              count: onboardingModel.images.length,
              effect: WormEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: AppColors.darkColor,
              ),
            ),
            SizedBox(height: 50),
            SafeArea(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.backGroundColor,
                  fixedSize: Size(360, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (currentIndex == onboardingModel.images.length - 1) {
                    AppNavigations.pushReplaceMentTo(
                      context,
                      AppRoutes.welcome,
                    );
                  }
                  pageController.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.ease,
                  );
                },
                child: Text(
                  currentIndex == onboardingModel.images.length - 1
                      ? "Get Started"
                      : "Next",
                  style: TextStyles.textStyle16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
