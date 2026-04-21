import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/pages/forgot_screen_email.dart';
import 'package:one_pass/features/auth/presentation/pages/signup_screen.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_text_naviagation.dart';
import 'package:one_pass/gen/assets.gen.dart';

class LoginScreen extends StatefulWidget {
  static const name = "/login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _fromKey = GlobalKey<FormState>();
  final _eamilTEController = TextEditingController();
  final _passwordTEControler = TextEditingController();
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
                  "LOGIN",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(12),
                Text("Welcome Back!", style: textTheme.bodySmall),
                const Gap(50),
                AuthField(
                  headingText: "EMAIL",
                  hintText: "jhondow@gmail.com",
                  controller: _eamilTEController,
                ),
                Gap(20),
                AuthField(
                  headingText: "PASSWORD",
                  hintText: "Password",
                  controller: _passwordTEControler,
                  isObsecuredText: _isPasswordObsecured,
                  onToggleObsecuredText: () {
                    setState(() {
                      _isPasswordObsecured = !_isPasswordObsecured;
                    });
                  },
                ),
                Gap(25),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.go(ForgotScreenEmail.name);
                    },
                    child: Text(
                      "Forgot Password",
                      style: textTheme.bodySmall!.copyWith(
                        color: AppColors.primary,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                Gap(25),
                SizedBox(
                  width: .infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("LOGIN")),
                ),
                Gap(35),
                AuthTextNaviagation(
                  topText: "Don't Have an Account",
                  botText: "REGISTER",
                  onTap: () {
                    context.go(SignupScreen.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _eamilTEController.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }
}
