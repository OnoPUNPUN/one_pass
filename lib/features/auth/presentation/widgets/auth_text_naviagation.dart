import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class AuthTextNaviagation extends StatelessWidget {
  final String topText;
  final String botText;
  final VoidCallback onTap;
  const AuthTextNaviagation({
    super.key,
    required this.topText,
    required this.botText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        textAlign: .center,
        text: TextSpan(
          // text: "",
          text: topText,
          style: textTheme.bodySmall!.copyWith(
            color: AppColors.slate,
            fontWeight: .w500,
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              // text: "\nLogin",
              text: "\n${botText}",
              style: textTheme.bodySmall!.copyWith(
                color: AppColors.primary,
                fontWeight: .w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
