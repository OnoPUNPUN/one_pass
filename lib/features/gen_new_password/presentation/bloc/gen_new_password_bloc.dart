import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gen_new_password_event.dart';
part 'gen_new_password_state.dart';

class GenNewPasswordBloc extends Bloc<GenNewPasswordEvent, GenNewPasswordState> {
  GenNewPasswordBloc() : super(GenNewPasswordInitial()) {
    on<GenNewPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
