import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/home/data/datasources/home_remote_data_source.dart';
import 'package:one_pass/features/home/domain/entities/password_item.dart';
import 'package:one_pass/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PasswordItem>>> getPasswords() async {
    try {
      final passwords = await remoteDataSource.getPasswords();
      return Right(passwords);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
