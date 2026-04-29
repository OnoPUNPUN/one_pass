import 'package:go_router/go_router.dart';
import 'package:one_pass/core/shared/presentation/widgets/root_navigation_shell.dart';
import 'package:one_pass/features/add/presentation/pages/add_password_screen.dart';
import 'package:one_pass/features/auth/presentation/pages/forgot_screen_email.dart';
import 'package:one_pass/features/auth/presentation/pages/forgot_screen_resend.dart';
import 'package:one_pass/features/auth/presentation/pages/login_screen.dart';
import 'package:one_pass/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:one_pass/features/auth/presentation/pages/signup_screen.dart';
import 'package:one_pass/features/gen_new_password/presentation/pages/generate_new_passowrd_screen.dart';
import 'package:one_pass/features/home/presentation/pages/home_screen.dart';
import 'package:one_pass/features/onboarding/presentation/pages/onborading_screen.dart';
import 'package:one_pass/features/profile/presentation/pages/change_password_screen.dart';
import 'package:one_pass/features/profile/presentation/pages/profile_screen.dart';
import 'package:one_pass/features/profile/presentation/pages/profile_update_screen.dart';
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
      GoRoute(
        path: ForgotScreenEmail.name,
        builder: (context, state) => const ForgotScreenEmail(),
      ),
      GoRoute(
        path: ForgotScreenResend.name,
        builder: (context, state) => const ForgotScreenResend(),
      ),
      GoRoute(
        path: ResetPasswordScreen.name,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: HomeScreen.name,
        builder: (context, state) =>
            const RootNavigationShell(child: HomeScreen()),
      ),
      GoRoute(
        path: AddPasswordScreen.name,
        builder: (context, state) => const AddPasswordScreen(),
      ),
      GoRoute(
        path: GenerateNewPassowrdScreen.name,
        builder: (context, state) => const GenerateNewPassowrdScreen(),
      ),
      GoRoute(
        path: ProfileScreen.name,
        builder: (context, state) =>
            const RootNavigationShell(selectedIndex: 1, child: ProfileScreen()),
      ),
      GoRoute(
        path: ProfileUpdateScreen.name,
        builder: (context, state) => ProfileUpdateScreen(),
      ),
      GoRoute(
        path: ChangePasswordScreen.name,
        builder: (context, state) => ChangePasswordScreen(),
      ),
    ],
  );
}
