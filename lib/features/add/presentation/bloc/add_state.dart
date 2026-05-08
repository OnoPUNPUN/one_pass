part of 'add_bloc.dart';

abstract class AddState extends Equatable {
  const AddState();  

  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {}

class AddLoading extends AddState {}

class AddSuccess extends AddState {}

class AddFailure extends AddState {
  final String message;

  const AddFailure(this.message);

  @override
  List<Object> get props => [message];
}
