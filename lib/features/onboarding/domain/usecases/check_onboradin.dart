import 'package:one_pass/features/onboarding/domain/repositories/onborading_repositories.dart';

class CheckOnboradin {
  final OnboradingRepositories repo;

  CheckOnboradin(this.repo);

  Future<bool> call() => repo.isCompleted();
}
