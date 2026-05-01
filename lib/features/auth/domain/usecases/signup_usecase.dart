import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/auth/domain/entities/user.dart';
import 'package:one_pass/features/auth/domain/repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) async {
    return await repository.signup(email, password);
  }
}
