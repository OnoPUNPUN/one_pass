import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';
import 'package:one_pass/gen/assets.gen.dart';

class PasswordCard extends StatelessWidget {
  final PasswordItem item;

  const PasswordCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final icon = _iconFor(item.iconName);

    return Container(
      width: double.infinity,
      height: 88,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.slate,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: icon.svg(
                width: 30,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const Gap(18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: item.username));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Username copied!')),
                    );
                  },
                  child: Text(
                    item.username,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppColors.muted,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: item.password));
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Password copied!')));
            },
            icon: const Icon(
              Icons.copy_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  SvgGenImage _iconFor(String iconName) {
    return switch (iconName) {
      'amazon' => Assets.icons.amazon,
      'apple' => Assets.icons.apple,
      'facebook' => Assets.icons.facebook,
      'google' => Assets.icons.google,
      'netflix' => Assets.icons.netflix,
      _ => Assets.icons.lock,
    };
  }
}
