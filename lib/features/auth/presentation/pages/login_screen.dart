import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:one_pass/features/auth/presentation/pages/forgot_screen_email.dart';
import 'package:snackify/snackify.dart';
import 'package:snackify/enums/snack_enums.dart';
import 'package:one_pass/features/auth/presentation/pages/signup_screen.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_field.dart';
import 'package:one_pass/features/auth/presentation/widgets/auth_text_naviagation.dart';
import 'package:one_pass/features/home/presentation/pages/home_screen.dart';
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go(HomeScreen.name);
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
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                if (_fromKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    LoginRequested(
                                      email: _eamilTEController.text.trim(),
                                      password: _passwordTEControler.text,
                                    ),
                                  );
                                }
                              },
                        child: state is AuthLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("LOGIN"),
                      ),
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
            );
          },
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
