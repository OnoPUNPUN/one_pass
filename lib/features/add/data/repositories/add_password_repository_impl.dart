import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/exceptions.dart';
import 'package:one_pass/core/error/failures.dart';
import 'package:one_pass/features/add/data/datasources/add_password_remote_data_source.dart';
import 'package:one_pass/features/add/data/models/password_model.dart';
import 'package:one_pass/features/add/domain/entities/password_entity.dart';
import 'package:one_pass/features/add/domain/repositories/add_password_repository.dart';

class AddPasswordRepositoryImpl implements AddPasswordRepository {
  final AddPasswordRemoteDataSource remoteDataSource;

  AddPasswordRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> addPassword(PasswordEntity password) async {
    try {
      await remoteDataSource.addPassword(PasswordModel.fromEntity(password));
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
