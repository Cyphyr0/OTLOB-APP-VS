import 'package:otlob/data/datasources/auth_remote_datasource.dart';
import 'package:otlob/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    await remoteDataSource.signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await remoteDataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInWithGoogle() async {
    await remoteDataSource.signInWithGoogle();
  }
}
