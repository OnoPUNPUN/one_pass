import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class OnboradingNextButton extends StatelessWidget {
  const OnboradingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          child: const Text('LOGIN'),
        ),
      ),
    );
  }
}
