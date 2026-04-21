import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ForgotScreenResend extends StatelessWidget {
  static const name = "/forgot-screen-resend";
  const ForgotScreenResend({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: Form(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Assets.logo.onboardingLogo.svg(width: 37, height: 20),
                Gap(25),
                Text(
                  "FORGOT\nPASSWORD",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(16),
                Text(
                  "The link to reset your password has been sent to your\nemail. Check your email to reset your password.",
                  style: textTheme.bodySmall,
                ),
                Gap(30),
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(ResetPasswordScreen.name);
                    },
                    child: Text("RESEND"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
