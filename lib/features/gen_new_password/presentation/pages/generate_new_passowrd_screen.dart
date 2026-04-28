import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_button.dart';
import 'package:one_pass/core/shared/presentation/widgets/app_outline_button.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/gen_new_password/presentation/widgets/generator_dropdown.dart';

class GenerateNewPassowrdScreen extends StatefulWidget {
  static const name = "/gen-new-password";
  const GenerateNewPassowrdScreen({super.key});

  @override
  State<GenerateNewPassowrdScreen> createState() =>
      _GenerateNewPassowrdScreenState();
}

class _GenerateNewPassowrdScreenState extends State<GenerateNewPassowrdScreen> {
  final _fromKey = GlobalKey<FormState>();
  int _passwordLength = 8;
  bool _includeSymbols = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "GENERATE NEW",
                  style: textTheme.headlineLarge!.copyWith(
                    color: AppColors.slate,
                  ),
                ),
                Gap(50),
                TextField(readOnly: true),
                Gap(30),
                GeneratorDropdown<int>(
                  headingText: "PASSWORD LENGTH",
                  value: _passwordLength,
                  items: const [8, 10, 12, 14, 16, 20],
                  itemLabel: (value) => value.toString(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _passwordLength = value);
                  },
                ),
                const Gap(35),
                GeneratorDropdown<bool>(
                  headingText: "INCLUDE SYMBOLS",
                  value: _includeSymbols,
                  items: const [false, true],
                  itemLabel: (value) => value ? "Yes" : "No",
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => _includeSymbols = value);
                  },
                ),
                Gap(30),
                Row(
                  children: [
                    AppOutlineButton(btnText: "RANDOMIZE", onPressed: () {}),
                    Gap(21),
                    Expanded(
                      child: AppButton(btnText: "COPY", onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
