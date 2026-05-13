import 'package:one_pass/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
  Future<Profile> updateProfile({
    String? username,
    String? imagePath,
  });
}
