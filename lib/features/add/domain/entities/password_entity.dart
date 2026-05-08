import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  final String appName;
  final String url;
  final String username;
  final String email;
  final String encryptedPassword;

  const PasswordEntity({
    required this.appName,
    required this.url,
    required this.username,
    required this.email,
    required this.encryptedPassword,
  });

  @override
  List<Object?> get props => [
        appName,
        url,
        username,
        email,
        encryptedPassword,
      ];
}
