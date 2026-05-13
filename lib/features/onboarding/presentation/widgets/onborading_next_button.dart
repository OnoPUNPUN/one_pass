import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/pages/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboradingNextButton extends StatelessWidget {
  const OnboradingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('has_seen_onboarding', true);
            if (context.mounted) {
              context.go(SignupScreen.name);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
