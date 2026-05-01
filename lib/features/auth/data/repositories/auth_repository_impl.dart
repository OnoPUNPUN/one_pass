import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:one_pass/features/auth/domain/entities/user.dart';
import 'package:one_pass/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signup(String email, String password) async {
    try {
      final userModel = await remoteDataSource.signup(email, password);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
