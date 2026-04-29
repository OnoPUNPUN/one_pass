import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/profile/presentation/widgets/password_filed.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const name = "/change-password";
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordTEController = TextEditingController();
  final _confrimpasswordTEController = TextEditingController();
  bool _isPasswordObsecured = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
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
                  "CHANGE PASSWORD",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(50),
                PasswordFiled(
                  headingText: "NEW PASSWORD",
                  hintText: "Enter Password",
                  controller: _passwordTEController,
                  isObsecuredText: true,
                  onToggleObsecuredText: () {
                    setState(() {
                      _isPasswordObsecured = !_isPasswordObsecured;
                    });
                  },
                ),
                Gap(20),
                PasswordFiled(
                  headingText: "CONFIRM PASSWORD",
                  hintText: "Confirm new password",
                  controller: _confrimpasswordTEController,
                  isObsecuredText: true,
                  onToggleObsecuredText: () {
                    setState(() {
                      _isPasswordObsecured = !_isPasswordObsecured;
                    });
                  },
                ),
                Gap(30),
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "CHANGE PASSWORD",
                      style: textTheme.bodyLarge!.copyWith(
                        color: AppColors.surface,
                        fontWeight: .w900,
                      ),
                    ),
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
