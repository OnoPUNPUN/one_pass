import 'package:dio/dio.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String email, String password, String name);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;
  final TokenManager tokenManager;

  AuthRemoteDataSourceImpl(this.apiClient, this.tokenManager);

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
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiClient.post(
        '/auth/v1/token?grant_type=password',
        data: {
          "email": email,
          "password": password,
        },
      );
      final user = UserModel.fromJson(response.data);
      if (user.accessToken != null) {
        await tokenManager.saveToken(user.accessToken!);
      }
      await tokenManager.saveUserId(user.id);
      return user;
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signup(String email, String password, String name) async {
    try {
      final response = await apiClient.post(
        '/auth/v1/signup',
        data: {
          "email": email,
          "password": password,
          "data": {
            "username": name,
          }
        },
      );
      
      UserModel user;
      if (response.data['user'] != null) {
        user = UserModel.fromJson(response.data);
      } else {
        user = UserModel(
          id: response.data['id'],
          email: response.data['email'],
          accessToken: response.data['access_token'],
        );
      }
      
      if (user.accessToken != null) {
        await tokenManager.saveToken(user.accessToken!);
      }
      await tokenManager.saveUserId(user.id);
      return user;
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
