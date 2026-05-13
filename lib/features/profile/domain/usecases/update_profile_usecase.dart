import 'package:one_pass/features/profile/domain/entities/profile.dart';
import 'package:one_pass/features/profile/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Profile> call({String? username, String? imagePath}) async {
    return await repository.updateProfile(
      username: username,
      imagePath: imagePath,
    );
  }
}
