import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_pass/core/shared/presentation/widgets/one_pass_root_navigation_bar.dart';
import 'package:one_pass/core/theme/app_colors.dart';
import 'package:one_pass/features/home/presentation/pages/home_screen.dart';

class RootNavigationShell extends StatelessWidget {
  final Widget child;
  final int selectedIndex;

  const RootNavigationShell({
    super.key,
    required this.child,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(child: child),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: OnePassRootNavigationBar.height,
            child: ColoredBox(color: AppColors.background),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: OnePassRootNavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) =>
                  _onDestinationSelected(context, index),
              onAddPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(HomeScreen.name);
      case 1:
        break;
    }
  }
}
