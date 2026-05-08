import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';
import 'package:one_pass/features/home/domain/repositories/home_repository.dart';

class GetPasswordsUseCase {
  final HomeRepository repository;

  GetPasswordsUseCase(this.repository);

  Future<Either<Failure, List<PasswordItem>>> call() {
    return repository.getPasswords();
  }
}
