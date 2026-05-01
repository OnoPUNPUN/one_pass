import 'package:dio/dio.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

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
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signup(String email, String password) async {
    try {
      final response = await apiClient.post(
        '/auth/v1/signup',
        data: {
          "email": email,
          "password": password,
        },
      );
      
      if (response.data['user'] != null) {
        return UserModel.fromJson(response.data);
      } else {
        return UserModel(
          id: response.data['id'],
          email: response.data['email'],
        );
      }
    } on DioException catch (e) {
      throw ServerException(message: _parseError(e));
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
