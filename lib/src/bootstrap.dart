import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_pass/core/di/injection_container.dart' as di;

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  FlutterError.onError = FlutterError.presentError;

  runApp(await builder());
}
