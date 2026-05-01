import 'package:get_it/get_it.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/dio_provider.dart';
import 'package:one_pass/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:one_pass/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:one_pass/features/auth/domain/repositories/auth_repository.dart';
import 'package:one_pass/features/auth/domain/usecases/login_usecase.dart';
import 'package:one_pass/features/auth/domain/usecases/signup_usecase.dart';
import 'package:one_pass/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(
        loginUseCase: sl(),
        signupUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  // Core
  sl.registerLazySingleton(() => ApiClient(sl()));
  sl.registerLazySingleton(() => DioProvider.createDio());
}
