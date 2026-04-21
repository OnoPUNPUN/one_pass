import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/pages/forgot_screen_resend.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ForgotScreenEmail extends StatefulWidget {
  static const name = "/forgot-password-email";
  const ForgotScreenEmail({super.key});

  @override
  State<ForgotScreenEmail> createState() => _ForgotScreenEmailState();
}

class _ForgotScreenEmailState extends State<ForgotScreenEmail> {
  final _fromKey = GlobalKey<FormState>();
  final _eamilTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: Form(
            key: _fromKey,
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
                Gap(30),
                AuthField(
                  headingText: "EMAIL",
                  hintText: "jhondoe@gmail.com",
                  controller: _eamilTEController,
                ),
                Gap(30),
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(ForgotScreenResend.name);
                    },
                    child: Text("SUBMIT"),
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
