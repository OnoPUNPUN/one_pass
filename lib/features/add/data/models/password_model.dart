import 'package:one_pass/features/add/domain/entities/password_entity.dart';

class PasswordModel extends PasswordEntity {
  const PasswordModel({
    required super.appName,
    required super.url,
    required super.username,
    required super.email,
    required super.encryptedPassword,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) {
    return PasswordModel(
      appName: json['app_name'] ?? '',
      url: json['url'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      encryptedPassword: json['encrypted_password'] ?? '',
    );
  }

  Map<String, dynamic> toJson(String userId) {
    return {
      'user_id': userId,
      'app_name': appName,
      'url': url,
      'username': username,
      'email': email,
      'encrypted_password': encryptedPassword,
    };
  }

  factory PasswordModel.fromEntity(PasswordEntity entity) {
    return PasswordModel(
      appName: entity.appName,
      url: entity.url,
      username: entity.username,
      email: entity.email,
      encryptedPassword: entity.encryptedPassword,
    );
  }
}
