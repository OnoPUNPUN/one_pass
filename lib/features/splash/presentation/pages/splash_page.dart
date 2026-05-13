import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:one_pass/core/constants/app_strings.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/onboarding/presentation/pages/onborading_screen.dart';
import 'package:one_pass/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/home/presentation/pages/home_screen.dart';
import 'package:one_pass/features/auth/presentation/pages/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 3), _goToOnboarding);
  }

  void _goToOnboarding() async {
    if (!mounted) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('has_seen_onboarding') ?? false;

    final tokenManager = GetIt.instance<TokenManager>();
    final token = await tokenManager.getToken();
    
    if (!mounted) {
      return;
    }

    if (token != null) {
      context.go(HomeScreen.name);
    } else if (hasSeenOnboarding) {
      context.go(LoginScreen.name);
    } else {
      context.go(OnboradingScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(flex: 7),
              Center(child: Assets.logo.appLogo.svg(width: 104, height: 104)),
              const Spacer(flex: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  AppStrings.splashTagline,
                  textAlign: TextAlign.center,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
