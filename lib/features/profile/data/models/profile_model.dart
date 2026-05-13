import 'package:one_pass/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    super.username,
    super.email,
    super.avatarUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      username: json['name'],
      email: json['email'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (username != null) 'name': username,
      if (email != null) 'email': email,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
    };
  }
}
