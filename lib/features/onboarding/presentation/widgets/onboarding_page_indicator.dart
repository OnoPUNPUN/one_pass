import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const OnboardingPageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPages, (index) {
        final isSelected = index == currentIndex;

        return Padding(
          padding: EdgeInsets.only(right: index == totalPages - 1 ? 0 : 12),
          child: Text(
            '${index + 1}',
            style: (isSelected ? textTheme.titleMedium : textTheme.bodyMedium)
                ?.copyWith(
                  fontFamily: 'BebasNeue',
                  fontSize: isSelected ? 20 : 14,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? AppColors.primary : AppColors.muted,
                ),
          ),
        );
      }),
    );
  }
}
