import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class AppOutlineButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  const AppOutlineButton({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 157,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
          textStyle: textTheme.bodyLarge?.copyWith(
            color: AppColors.primary,
            fontWeight: .w800,
          ),
        ),
        onPressed: onPressed,
        child: Text(btnText),
      ),
    );
  }
}
