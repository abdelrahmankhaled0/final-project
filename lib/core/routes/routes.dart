import 'package:final_project/features/authentacation/presentation/screens/signin_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/signup_screen.dart';
import 'package:final_project/features/home_screen/presentation/bloodDonors.dart';
import 'package:final_project/features/home_screen/presentation/homeScreen.dart';
import 'package:final_project/features/home_screen/presentation/icuScreen.dart';
import 'package:final_project/features/home_screen/presentation/patients.dart';
import 'package:final_project/features/onboarding_screen/presentation/screens/onboarding_screen.dart';
import 'package:final_project/features/splash_screen/prsentation/screens/splash_screen.dart';
import 'package:final_project/features/welcome_screen/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String welcome = "/welcome";
  static const String signin = "/signin";
  static const String signup = "/signup";
  static const String homeScreen = "/HomeScreen";
  static const String icu = "/icuScreen";
  static const String bloodDonors = "/bloodDonors";
  static const String patient = "/PatientScreen";




  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: onBoarding,
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: signin, builder: (context, state) => SigninScreen()),
      GoRoute(path: signup, builder: (context, state) => SignupScreen()),
      GoRoute(path: homeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(path: icu, builder: (context, state) => ICUBedsScreen()),
      GoRoute(path: bloodDonors, builder: (context, state) => BloodDonorsScreen()),
      GoRoute(path: patient, builder: (context, state) => PatientScreen()),



    ],
  );
}
