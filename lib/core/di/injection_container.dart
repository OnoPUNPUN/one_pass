import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:one_pass/core/network/api_client.dart';
import 'package:one_pass/core/network/dio_provider.dart';
import 'package:one_pass/core/network/token_manager.dart';
import 'package:one_pass/features/add/data/datasources/add_password_remote_data_source.dart';
import 'package:one_pass/features/add/data/repositories/add_password_repository_impl.dart';
import 'package:one_pass/features/add/domain/repositories/add_password_repository.dart';
import 'package:one_pass/features/add/domain/usecases/add_password_usecase.dart';
import 'package:one_pass/features/add/presentation/bloc/add_bloc.dart';
import 'package:one_pass/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:one_pass/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:one_pass/features/auth/domain/repositories/auth_repository.dart';
import 'package:one_pass/features/auth/domain/usecases/login_usecase.dart';
import 'package:one_pass/features/auth/domain/usecases/signup_usecase.dart';
import 'package:one_pass/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:one_pass/features/home/data/datasources/home_remote_data_source.dart';
import 'package:one_pass/features/home/data/repositories/home_repository_impl.dart';
import 'package:one_pass/features/home/domain/repositories/home_repository.dart';
import 'package:one_pass/features/home/domain/usecases/get_passwords_usecase.dart';
import 'package:one_pass/features/home/presentation/bloc/home_bloc.dart';

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
    () => AuthRemoteDataSourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<AddPasswordRemoteDataSource>(
    () => AddPasswordRemoteDataSourceImpl(sl(), sl()),
  );

  // Features - Add
  sl.registerFactory(() => AddBloc(
        addPasswordUseCase: sl(),
      ));
  sl.registerLazySingleton(() => AddPasswordUseCase(sl()));
  sl.registerLazySingleton<AddPasswordRepository>(
    () => AddPasswordRepositoryImpl(remoteDataSource: sl()),
  );

  // Features - Home
  sl.registerLazySingleton(() => HomeBloc(
        getPasswordsUseCase: sl(),
      ));
  sl.registerLazySingleton(() => GetPasswordsUseCase(sl()));
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl(), sl()),
  );

  // Core
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => TokenManager(sl()));
  sl.registerLazySingleton(() => ApiClient(sl()));
  sl.registerLazySingleton(() => DioProvider.createDio(sl()));
}
