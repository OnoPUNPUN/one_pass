import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> signup(String email, String password);
}
