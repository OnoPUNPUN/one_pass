import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final TextEditingController controller;

  const AppTextField({
    super.key,
    required this.headingText,
    required this.hintText,
    required this.controller,
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
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
