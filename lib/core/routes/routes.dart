import 'package:final_project/features/authentacation/presentation/screens/change_password_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/forget_password_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/o_t_p_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/signin_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/signup_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/success_change_password_screen.dart';
import 'package:final_project/features/blood_donors/presentation/screens/blood_donors.dart';
import 'package:final_project/features/home_screen/presentation/screens/home_screen.dart';
import 'package:final_project/features/icu/presentation/screen/icu_screen.dart';
import 'package:final_project/features/intro/onboarding_screen/presentation/screens/onboarding_screen.dart';
import 'package:final_project/features/intro/welcome_screen/presentation/screens/welcome_screen.dart';
import 'package:final_project/features/patient/presentation/screen/patients_screen.dart';
import 'package:final_project/features/intro/splash_screen/prsentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = "/";
  static const String onBoarding = "/onBoarding";
  static const String welcome = "/welcome";
  static const String signin = "/signin";
  static const String forgetPassword = "/forgetPassword";
  static const String otpScreen = "/otpScreen";
  static const String changePasswordScreen = "/changePasswordScreen";
  static const String successChangePasswordScreen =
      "/successChangePasswordScreen";
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
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(path: otpScreen, builder: (context, state) => OTPScreen()),
      GoRoute(
        path: changePasswordScreen,
        builder: (context, state) => ChangePasswordScreen(),
      ),
      GoRoute(
        path: successChangePasswordScreen,
        builder: (context, state) => SuccessChangePasswordScreen(),
      ),
      GoRoute(path: signup, builder: (context, state) => SignupScreen()),
      GoRoute(path: homeScreen, builder: (context, state) => HomeScreen()),
      GoRoute(path: icu, builder: (context, state) => ICUBedsScreen()),
      GoRoute(
        path: bloodDonors,
        builder: (context, state) => BloodDonorsScreen(),
      ),
      GoRoute(path: patient, builder: (context, state) => PatientScreen()),
    ],
  );
}
