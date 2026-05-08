part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object> get props => [];
}

class AddPasswordSubmit extends AddEvent {
  final PasswordEntity password;

  const AddPasswordSubmit(this.password);

  @override
  List<Object> get props => [password];
}
