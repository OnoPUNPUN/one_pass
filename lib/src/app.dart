import 'package:flutter/material.dart';
import 'package:one_pass/core/router/app_router.dart';
import 'package:one_pass/core/theme/app_theme.dart';

class OnePassApp extends StatelessWidget {
  const OnePassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'One Pass',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: AppRouter.router,
    );
  }
}
