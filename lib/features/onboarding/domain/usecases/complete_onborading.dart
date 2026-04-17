import 'package:one_pass/features/onboarding/domain/repositories/onborading_repositories.dart';

class CompleteOnborading {
  final OnboradingRepositories repo;

  CompleteOnborading(this.repo);

  Future<void> call() => repo.completeOnborading();
}
