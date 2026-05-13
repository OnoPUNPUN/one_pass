import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String? username;
  final String? email;
  final String? avatarUrl;

  const Profile({
    required this.id,
    this.username,
    this.email,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [id, username, email, avatarUrl];
}
