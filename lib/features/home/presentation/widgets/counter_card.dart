import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class CounterCard extends StatelessWidget {
  final String count;
  final String cardTopTitle;
  final String cardBottomTitle;
  const CounterCard({
    super.key,
    required this.count,
    required this.cardTopTitle,
    required this.cardBottomTitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 157,
      width: 157,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: .circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(count, style: textTheme.headlineLarge),
          const Spacer(),
          Text(cardTopTitle, style: textTheme.bodyMedium),
          Gap(2),
          Text(cardBottomTitle, style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
