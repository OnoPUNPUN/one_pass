import 'package:one_pass/src/app.dart';
import 'package:one_pass/src/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const OnePassApp());
}
