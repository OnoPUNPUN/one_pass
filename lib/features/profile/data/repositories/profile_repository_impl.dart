import 'package:one_pass/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:one_pass/features/profile/domain/entities/profile.dart';
import 'package:one_pass/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Profile> getProfile() async {
    return await remoteDataSource.getProfile();
  }

  @override
  Future<Profile> updateProfile({String? username, String? imagePath}) async {
    return await remoteDataSource.updateProfile(
      username: username,
      imagePath: imagePath,
    );
  }
}
