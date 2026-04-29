import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class PasswordFiled extends StatelessWidget {
  final String headingText;
  final String hintText;
  final TextEditingController controller;
  final bool isObsecuredText;
  final VoidCallback? onToggleObsecuredText;

  const PasswordFiled({
    super.key,
    required this.headingText,
    required this.hintText,
    required this.controller,
    this.isObsecuredText = false,
    this.onToggleObsecuredText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.slate,
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
        const Gap(8),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "$hintText is missing";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: onToggleObsecuredText != null
                ? IconButton(
                    onPressed: onToggleObsecuredText,
                    icon: Icon(
                      isObsecuredText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.primary,
                    ),
                  )
                : null,
          ),
          controller: controller,
          obscureText: isObsecuredText,
        ),
      ],
    );
  }
}
