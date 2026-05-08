import 'package:dio/dio.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/add/data/models/password_model.dart';

abstract class AddPasswordRemoteDataSource {
  Future<void> addPassword(PasswordModel password);
}

class AddPasswordRemoteDataSourceImpl implements AddPasswordRemoteDataSource {
  final ApiClient apiClient;
  final TokenManager tokenManager;

  AddPasswordRemoteDataSourceImpl(this.apiClient, this.tokenManager);

  @override
  Future<void> addPassword(PasswordModel password) async {
    try {
      final userId = await tokenManager.getUserId();
      if (userId == null) {
        throw ServerException(message: 'User ID not found');
      }

      await apiClient.post(
        '/rest/v1/passwords',
        data: password.toJson(userId),
      );
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
