part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String? username;
  final String? imagePath;

  const UpdateProfileEvent({this.username, this.imagePath});

  @override
  List<Object?> get props => [username, imagePath];
}
