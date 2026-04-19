import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/gen/assets.gen.dart';

class SignupScreen extends StatefulWidget {
  static const name = "/signup-screen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fromkey = GlobalKey<FormState>();
  final _emailTEController = TextEditingController();
  final _nameTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  bool _isPasswordObsecured = true;

  @override
  void dispose() {
    _emailTEController.dispose();
    _nameTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
          child: Form(
            key: _fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.logo.onboardingLogo.svg(width: 37, height: 20),
                const Gap(25),
                Text(
                  "Register",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                const Gap(12),
                Text(
                  "Let's get you setup with a new account",
                  style: textTheme.bodySmall,
                ),
                const Gap(50),
                AuthField(
                  headingText: "Name",
                  hintText: "John Doe",
                  controller: _nameTEController,
                ),
                const Gap(20),
                AuthField(
                  headingText: "Email",
                  hintText: "johndoe@gmail.com",
                  controller: _emailTEController,
                ),
                const Gap(20),
                AuthField(
                  headingText: "Password",
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("REGISTER"),
                  ),
                ),
                Gap(50),
                Center(
                  child: RichText(
                    textAlign: .center,
                    text: TextSpan(
                      text: "Already Have an Account?",
                      style: textTheme.bodySmall!.copyWith(
                        color: AppColors.slate,
                        fontWeight: .w500,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "\nLogin",
                          style: textTheme.bodySmall!.copyWith(
                            color: AppColors.primary,
                            fontWeight: .w700,
                          ),
                        ),
                      ],
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
