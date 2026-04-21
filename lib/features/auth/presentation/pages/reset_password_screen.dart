import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const name = "/reset-password";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _fromKey = GlobalKey<FormState>();
  final _passwordTEController = TextEditingController();
  bool _isPasswordObsecured = true;
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
                  headingText: "NEW PASSWORD",
                  hintText: "Password",
                  controller: _passwordTEController,
                  isObsecuredText: _isPasswordObsecured,
                  onToggleObsecuredText: () {
                    setState(() {
                      _isPasswordObsecured = !_isPasswordObsecured;
                    });
                  },
                ),
                Gap(30),
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("RESET")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
