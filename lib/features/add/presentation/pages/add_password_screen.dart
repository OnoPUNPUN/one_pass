import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/di/injection_container.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_button.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_text_field.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_outline_button.dart';
import 'package:one_pass/features/add/domain/entities/password_entity.dart';
import 'package:one_pass/features/add/presentation/bloc/add_bloc.dart';
import 'package:one_pass/features/gen_new_password/presentation/pages/generate_new_passowrd_screen.dart';

class AddPasswordScreen extends StatelessWidget {
  static const name = "/add-password";
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AddBloc>(),
      child: const _AddPasswordScreenContent(),
    );
  }
}

class _AddPasswordScreenContent extends StatefulWidget {
  const _AddPasswordScreenContent();

  @override
  State<_AddPasswordScreenContent> createState() => _AddPasswordScreenContentState();
}

class _AddPasswordScreenContentState extends State<_AddPasswordScreenContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameTEController = TextEditingController();
  final _urlTEController = TextEditingController();
  final _usernameTEController = TextEditingController();
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();

  @override
  void dispose() {
    _nameTEController.dispose();
    _urlTEController.dispose();
    _usernameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void _onAddPassword() {
    if (_formKey.currentState!.validate()) {
      final entity = PasswordEntity(
        appName: _nameTEController.text.trim(),
        url: _urlTEController.text.trim(),
        username: _usernameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        encryptedPassword: _passwordTEController.text,
      );
      context.read<AddBloc>().add(AddPasswordSubmit(entity));
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: BlocConsumer<AddBloc, AddState>(
            listener: (context, state) {
              if (state is AddSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password added successfully')),
                );
                context.pop();
              } else if (state is AddFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ADD NEW",
                      style: textTheme.headlineLarge!.copyWith(
                        color: AppColors.slate,
                      ),
                    ),
                    const Gap(20),
                    AppTextField(
                      headingText: "NAME",
                      hintText: "Website/App Name",
                      controller: _nameTEController,
                    ),
                    const Gap(10),
                    AppTextField(
                      headingText: "URL",
                      hintText: "Website URL (optional)",
                      controller: _urlTEController,
                    ),
                    const Gap(10),
                    AppTextField(
                      headingText: "USERNAME",
                      hintText: "Username",
                      controller: _usernameTEController,
                    ),
                    const Gap(10),
                    AppTextField(
                      headingText: "EMAIL",
                      hintText: "Email (Optional)",
                      controller: _emailTEController,
                    ),
                    const Gap(10),
                    AppTextField(
                      headingText: "Password",
                      hintText: "Password",
                      controller: _passwordTEController,
                    ),
                    const Gap(20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppOutlineButton(
                        btnText: "GENERATE NEW",
                        onPressed: () async {
                          final result = await context.push(GenerateNewPassowrdScreen.name);
                          if (result != null && result is String) {
                            _passwordTEController.text = result;
                          }
                        },
                      ),
                    ),
                    const Gap(20),
                    if (state is AddLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      AppButton(
                        btnText: "ADD PASSWORD",
                        onPressed: _onAddPassword,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
