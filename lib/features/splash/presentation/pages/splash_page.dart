import 'package:flutter/material.dart';

import 'package:one_pass/core/constants/app_strings.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/gen/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
              Center(
                child: Assets.logo.appLogo.svg(
                  width: 104,
                  height: 104,
                ),
              ),
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
