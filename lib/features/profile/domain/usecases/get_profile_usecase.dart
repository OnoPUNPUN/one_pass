import 'package:one_pass/features/profile/domain/entities/profile.dart';
import 'package:one_pass/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Profile> call() async {
    return await repository.getProfile();
  }
}
