import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class OnboradingBackButton extends StatelessWidget {
  const OnboradingBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          child: const Text('REGISTER'),
        ),
      ),
    );
  }
}
