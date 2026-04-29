import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/gen/assets.gen.dart';

class ProfileActionTile extends StatelessWidget {
  final SvgGenImage icon;
  final String label;
  final VoidCallback onTap;

  const ProfileActionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: SizedBox(
          height: 18,
          child: Row(
            children: [
              icon.svg(
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              const Gap(5),
              Text(
                label,
                style: textTheme.bodySmall!.copyWith(
                  color: AppColors.slate,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
