import 'package:dio/dio.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';

abstract class HomeRemoteDataSource {
  Future<List<PasswordItem>> getPasswords();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;
  final TokenManager tokenManager;

  HomeRemoteDataSourceImpl(this.apiClient, this.tokenManager);

  @override
  Future<List<PasswordItem>> getPasswords() async {
    try {
      final userId = await tokenManager.getUserId();
      if (userId == null) {
        throw ServerException(message: 'User ID not found');
      }

      final response = await apiClient.get('/rest/v1/passwords?select=*&user_id=eq.$userId');
      final data = response.data as List;
      
      return data.map((json) => PasswordItem(
        name: json['app_name'] ?? 'Unknown',
        username: json['username'] ?? json['email'] ?? 'Unknown',
        password: json['encrypted_password'] ?? '',
        iconName: 'google', // Default icon for now
      )).toList();
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        final data = e.response!.data;
        throw ServerException(message: data['message'] ?? e.message ?? 'Unknown error');
      }
      throw ServerException(message: e.message ?? 'Unknown error');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
