import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/gen/assets.gen.dart';

class OnePassRootNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final VoidCallback? onAddPressed;

  const OnePassRootNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.onDestinationSelected,
    this.onAddPressed,
  });

  static const double height = 85;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth.clamp(0.0, 335.0);
            final scale = width / 335;

            return SizedBox(
              width: width,
              height: height,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 21,
                    height: 64,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(color: AppColors.input),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 38 * scale,
                    top: 29,
                    width: 48,
                    height: 48,
                    child: _RootNavigationIconButton(
                      icon: Assets.icons.home,
                      isSelected: selectedIndex == 0,
                      onTap: () => onDestinationSelected?.call(0),
                    ),
                  ),
                  Positioned(
                    left: 249 * scale,
                    top: 29,
                    width: 48,
                    height: 48,
                    child: _RootNavigationIconButton(
                      icon: Assets.icons.user,
                      isSelected: selectedIndex == 1,
                      onTap: () => onDestinationSelected?.call(1),
                    ),
                  ),
                  Positioned(
                    left: (width - 60) / 2,
                    top: 5,
                    width: 60,
                    height: 60,
                    child: Material(
                      color: AppColors.primary,
                      shape: const CircleBorder(),
                      elevation: 14,
                      shadowColor: AppColors.primary.withValues(alpha: .34),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: onAddPressed,
                        child: Center(
                          child: Assets.icons.add.svg(
                            width: 24,
                            height: 24,
                            colorFilter: const ColorFilter.mode(
                              AppColors.background,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (selectedIndex == 0)
                    Positioned(
                      left: 59 * scale,
                      top: 66,
                      width: 6,
                      height: 2,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.slate,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RootNavigationIconButton extends StatelessWidget {
  final SvgGenImage icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _RootNavigationIconButton({
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Center(
          child: icon.svg(
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.slate,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
