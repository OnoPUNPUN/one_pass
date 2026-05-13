import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_pass/features/profile/domain/entities/profile.dart';
import 'package:one_pass/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:one_pass/features/profile/domain/usecases/update_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await getProfileUseCase();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await updateProfileUseCase(
        username: event.username,
        imagePath: event.imagePath,
      );
      emit(ProfileUpdateSuccess(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
