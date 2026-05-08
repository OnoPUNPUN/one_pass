import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';
import 'package:one_pass/features/home/domain/usecases/get_passwords_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPasswordsUseCase _getPasswordsUseCase;

  HomeBloc({required GetPasswordsUseCase getPasswordsUseCase})
      : _getPasswordsUseCase = getPasswordsUseCase,
        super(HomeInitial()) {
    on<LoadPasswords>(_onLoadPasswords);
  }

  Future<void> _onLoadPasswords(
    LoadPasswords event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await _getPasswordsUseCase();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (passwords) => emit(HomeLoaded(passwords)),
    );
  }
}
