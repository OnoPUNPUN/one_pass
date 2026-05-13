import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile({String? username, String? imagePath});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient apiClient;
  final TokenManager tokenManager;

  ProfileRemoteDataSourceImpl(this.apiClient, this.tokenManager);

  String _parseError(DioException e) {
    if (e.response != null && e.response!.data != null) {
      final data = e.response!.data;
      if (data is Map) {
        return data['msg']?.toString() ??
            data['error_description']?.toString() ??
            data['message']?.toString() ??
            e.message ??
            'Unknown error';
      } else {
        return data.toString();
      }
    }
    return e.message ?? 'Unknown error';
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final userId = await tokenManager.getUserId();
      if (userId == null) throw ServerException(message: "User not found");

      final response = await apiClient.get(
        '/rest/v1/profiles?id=eq.$userId&select=*',
      );

      ProfileModel profile;
      if (response.data is List && response.data.isNotEmpty) {
        profile = ProfileModel.fromJson(response.data[0]);
      } else {
        // If trigger failed to create profile, return a default one.
        profile = ProfileModel(id: userId);
      }

      // If email or name is missing (e.g. because profile row was missing or RLS blocked it), fetch it from Auth
      if (profile.email == null || profile.username == null) {
        try {
          final userResponse = await apiClient.get('/auth/v1/user');
          final authEmail = userResponse.data['email'];
          final authName = userResponse.data['user_metadata']?['username'];

          if (authEmail != null || authName != null) {
            profile = ProfileModel(
              id: profile.id,
              username: profile.username ?? authName,
              email: profile.email ?? authEmail,
              avatarUrl: profile.avatarUrl,
            );
          }
        } catch (_) {
          // Ignore if auth user fetch fails
        }
      }

      return profile;
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  Future<String> _uploadAvatar(String userId, String imagePath) async {
    try {
      final file = File(imagePath);
      final fileBytes = await file.readAsBytes();
      final mimeType = lookupMimeType(imagePath) ?? 'application/octet-stream';
      final ext = imagePath.split('.').last;
      final fileName =
          '${userId}_${DateTime.now().millisecondsSinceEpoch}.$ext';

      await apiClient.post(
        '/storage/v1/object/avatars/$fileName',
        data: fileBytes,
        options: Options(headers: {'Content-Type': mimeType}),
      );

      return 'avatars/$fileName';
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    String? username,
    String? imagePath,
  }) async {
    try {
      final userId = await tokenManager.getUserId();
      if (userId == null) throw ServerException(message: "User not found");

      String? avatarPath;
      if (imagePath != null) {
        avatarPath = await _uploadAvatar(userId, imagePath);
      }

      final Map<String, dynamic> data = {'id': userId};
      if (username != null) data['name'] = username;
      if (avatarPath != null) data['avatar_url'] = avatarPath;

      if (data.length > 1) {
        // more than just 'id'
        // Also update the auth user metadata so the fallback works instantly!
        try {
          if (username != null) {
            await apiClient.dio.put(
              '/auth/v1/user',
              data: {
                "data": {"username": username},
              },
            );
          }
        } catch (_) {}
        final response = await apiClient.patch(
          '/rest/v1/profiles?id=eq.$userId',
          data: data,
          options: Options(headers: {'Prefer': 'return=representation'}),
        );

        if (response.data is List && response.data.isNotEmpty) {
          return ProfileModel.fromJson(response.data[0]);
        }
      }

      return await getProfile();
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }
}
