import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otlob/data/datasources/auth_remote_datasource.dart';
import 'package:otlob/data/datasources/profile_remote_datasource.dart';
import 'package:otlob/data/datasources/restaurant_remote_datasource.dart';
import 'package:otlob/data/repositories/auth_repository_impl.dart';
import 'package:otlob/data/repositories/profile_repository_impl.dart';
import 'package:otlob/data/repositories/restaurant_repository_impl.dart';
import 'package:otlob/domain/repositories/auth_repository.dart';
import 'package:otlob/domain/repositories/profile_repository.dart';
import 'package:otlob/domain/repositories/restaurant_repository.dart';
import 'package:otlob/features/auth/bloc/auth_bloc.dart';
import 'package:otlob/features/home/bloc/restaurant_bloc.dart';
import 'package:otlob/features/profile/bloc/profile_bloc.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => GoogleSignIn());

  // Register data sources first
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dio: sl(),
      googleSignIn: sl<GoogleSignIn>(),
    ),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl());
  sl.registerLazySingleton<RestaurantRemoteDataSource>(
      () => RestaurantRemoteDataSourceImpl());

  // Register repositories (they depend on datasources)
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<RestaurantRepository>(
      () => RestaurantRepositoryImpl(remoteDataSource: sl()));

  // Register use cases (they depend on repositories)
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => GoogleSignInUseCase(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => GetAddresses(sl()));
  sl.registerLazySingleton(() => AddAddressUseCase(sl()));
  sl.registerLazySingleton(() => EditAddressUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
  sl.registerLazySingleton(() => GetRestaurants(sl()));

  // Register BLoCs last (they depend on use cases)
  sl.registerFactory(() => AuthBloc(
        signUp: sl<SignUp>(),
        login: sl<Login>(),
        googleSignIn: sl<GoogleSignInUseCase>(),
      ));
  sl.registerFactory(() => ProfileBloc(
        getUser: sl(),
        getAddresses: sl(),
        addAddress: sl(),
        editAddress: sl(),
        deleteAddress: sl(),
      ));
  sl.registerFactory(() => RestaurantBloc(restaurantRepository: sl()));
}

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<void> call({
    required String name,
    required String email,
    required String password,
  }) async {
    await repository.signUp(name: name, email: email, password: password);
  }
}

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<void> call({
    required String email,
    required String password,
  }) async {
    await repository.login(email: email, password: password);
  }
}

class GoogleSignInUseCase {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  Future<void> call() async {
    await repository.signInWithGoogle();
  }
}

class GetUser {
  final ProfileRepository repository;

  GetUser(this.repository);

  Future<void> call() async {
    await repository.getUser();
  }
}

class GetAddresses {
  final ProfileRepository repository;

  GetAddresses(this.repository);

  Future<void> call() async {
    await repository.getAddresses();
  }
}

class AddAddressUseCase {
  final ProfileRepository repository;

  AddAddressUseCase(this.repository);

  Future<void> call(String address) async {
    await repository.addAddress(address);
  }
}

class EditAddressUseCase {
  final ProfileRepository repository;

  EditAddressUseCase(this.repository);

  Future<void> call(String oldAddress, String newAddress) async {
    await repository.editAddress(oldAddress, newAddress);
  }
}

class DeleteAddressUseCase {
  final ProfileRepository repository;

  DeleteAddressUseCase(this.repository);

  Future<void> call(String address) async {
    await repository.deleteAddress(address);
  }
}

class GetRestaurants {
  final RestaurantRepository repository;

  GetRestaurants(this.repository);

  Future<void> call() async {
    await repository.getRestaurants();
  }
}