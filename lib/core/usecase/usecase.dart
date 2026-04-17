import 'package:fpdart/fpdart.dart';
import 'package:one_pass/core/error/failures.dart';

abstract interface class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

class NoParams {
  const NoParams();
}
