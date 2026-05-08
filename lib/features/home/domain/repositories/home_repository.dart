import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PasswordItem>>> getPasswords();
}
