import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/constants/app_strings.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/onboarding/domain/entities/onboradin_item.dart';

class OnboardingCard extends StatelessWidget {
  final OnboradinItem onboradinItem;
  const OnboardingCard({super.key, required this.onboradinItem});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: textTheme.headlineLarge?.copyWith(
                color: AppColors.slate,
                fontFamily: 'BebasNeue',
              ),
              children: _titleSpans(),
            ),
          ),
          const Gap(44),
          Text(
            onboradinItem.subLine,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12,
              height: 1.55,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _titleSpans() {
    if (onboradinItem.headLine == AppStrings.onboradingTitleOne) {
      return const [
        TextSpan(text: 'Generate\n'),
        TextSpan(
          text: 'Secure\n',
          style: TextStyle(color: AppColors.primary),
        ),
        TextSpan(text: 'Passwords.'),
      ];
    }

    if (onboradinItem.headLine == AppStrings.onboradingTitleTwo) {
      return const [
        TextSpan(text: 'ALL YOUR\n'),
        TextSpan(
          text: 'PASSWORDS\n',
          style: TextStyle(color: AppColors.primary),
        ),
        TextSpan(text: 'ARE HERE.'),
      ];
    }

    if (onboradinItem.headLine == AppStrings.onboradingTitleThree) {
      return const [
        TextSpan(text: 'DON’T TYPE,\n'),
        TextSpan(
          text: 'AUTOFILL\n',
          style: TextStyle(color: AppColors.primary),
        ),
        TextSpan(text: 'YOUR CREDENTIALS.'),
      ];
    }

    return [TextSpan(text: onboradinItem.headLine)];
  }
}
