import 'package:go_router/go_router.dart';
import 'package:one_pass/features/auth/presentation/pages/login_screen.dart';
import 'package:one_pass/features/auth/presentation/pages/signup_screen.dart';
import 'package:one_pass/features/onboarding/presentation/pages/onborading_screen.dart';
import 'package:one_pass/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: OnboradingScreen.name,
        builder: (context, state) => const OnboradingScreen(),
      ),
      GoRoute(
        path: SignupScreen.name,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
