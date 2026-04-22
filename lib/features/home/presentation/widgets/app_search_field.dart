import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.muted),
        hint: Text(
          "Search Websites...",
          style: textTheme.bodyLarge!.copyWith(color: AppColors.muted),
        ),
      ),
    );
  }
}
