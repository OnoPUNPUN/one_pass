import 'package:one_pass/features/onboarding/domain/repositories/onborading_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboradingRepositoriesImpl implements OnboradingRepositories {
  final SharedPreferences prefs;

  OnboradingRepositoriesImpl(this.prefs);

  @override
  Future<void> completeOnborading() async {
    await prefs.setBool("onborading_done", true);
  }

  @override
  Future<bool> isCompleted() async {
    return prefs.getBool("onborading_done") ?? false;
  }
}
