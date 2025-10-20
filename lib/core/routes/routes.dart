import 'package:final_project/features/authentacation/presentation/screens/signin_screen.dart';
import 'package:final_project/features/authentacation/presentation/screens/signup_screen.dart';
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
    ],
  );
}
