import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_button.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_text_field.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_outline_button.dart';
import 'package:one_pass/features/gen_new_password/presentation/pages/generate_new_passowrd_screen.dart';

class AddPasswordScreen extends StatefulWidget {
  static const name = "/add-password";
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  final _fromKey = GlobalKey<FormState>();
  final _nameTEController = TextEditingController();
  final _urlTEController = TextEditingController();
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 20),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "ADD NEW",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(20),
                AppTextField(
                  headingText: "NAME",
                  hintText: "Website/App Name",
                  controller: _nameTEController,
                ),
                Gap(10),
                AppTextField(
                  headingText: "URL",
                  hintText: "Username",
                  controller: _urlTEController,
                ),
                Gap(10),
                AppTextField(
                  headingText: "EMAIL/Username",
                  hintText: "Email/Username",
                  controller: _emailTEController,
                ),
                Gap(10),
                AppTextField(
                  headingText: "Passwrod",
                  hintText: "Password",
                  controller: _passwordTEController,
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppOutlineButton(
                    btnText: "GENERATE NEW",
                    onPressed: () {
                      context.push(GenerateNewPassowrdScreen.name);
                    },
                  ),
                ),
                const Gap(20),
                AppButton(btnText: "ADD PASSWORD", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
