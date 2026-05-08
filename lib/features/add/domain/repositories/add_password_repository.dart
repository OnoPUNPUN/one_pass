import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/add/domain/entities/password_entity.dart';

abstract class AddPasswordRepository {
  Future<Either<Failure, void>> addPassword(PasswordEntity password);
}
