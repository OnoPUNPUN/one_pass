import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_pass/features/add/domain/entities/password_entity.dart';
import 'package:one_pass/features/add/domain/usecases/add_password_usecase.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  final AddPasswordUseCase _addPasswordUseCase;

  AddBloc({required AddPasswordUseCase addPasswordUseCase})
      : _addPasswordUseCase = addPasswordUseCase,
        super(AddInitial()) {
    on<AddPasswordSubmit>(_onAddPasswordSubmit);
  }

  Future<void> _onAddPasswordSubmit(
    AddPasswordSubmit event,
    Emitter<AddState> emit,
  ) async {
    emit(AddLoading());
    final result = await _addPasswordUseCase(event.password);
    result.fold(
      (failure) => emit(AddFailure(failure.message)),
      (_) => emit(AddSuccess()),
    );
  }
}
