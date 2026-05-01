import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:one_pass/features/auth/presentation/pages/login_screen.dart';
import 'package:snackify/snackify.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_text_naviagation.dart';
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Snackify.show(
                context: context,
                type: SnackType.success,
                title: const Text('Success'),
                subtitle: const Text('Verify your account...'),
              );
              context.go(LoginScreen.name);
            } else if (state is AuthFailure) {
              Snackify.show(
                context: context,
                type: SnackType.error,
                title: const Text('Error'),
                subtitle: Text(state.message),
              );
            }
          },
          builder: (context, state) {
            return Padding(
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
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state is AuthLoading ? null : () {
                      if (_fromkey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          SignupRequested(
                            email: _emailTEController.text.trim(),
                            password: _passwordTEController.text,
                          ),
                        );
                      }
                    },
                    child: state is AuthLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text("REGISTER"),
                  ),
                ),
                Gap(50),
                AuthTextNaviagation(
                  onTap: () {
                    context.go(LoginScreen.name);
                  },
                  topText: "Already Have an Account?",
                  botText: "Login",
                ),
              ],
            ),
          ),
        );
      },
    ),
  ),
);
  }
}
