import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/add/domain/entities/password_entity.dart';
import 'package:one_pass/features/add/domain/repositories/add_password_repository.dart';

class AddPasswordUseCase {
  final AddPasswordRepository repository;

  AddPasswordUseCase(this.repository);

  Future<Either<Failure, void>> call(PasswordEntity password) {
    return repository.addPassword(password);
  }
}
