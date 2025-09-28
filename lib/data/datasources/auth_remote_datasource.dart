import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> googleSignIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({required this.dio, required this.googleSignIn});

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // This is a mock implementation.
      await Future.delayed(const Duration(seconds: 2));
      print('Signing up with name: $name, email: $email');
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      // This is a mock implementation.
      await Future.delayed(const Duration(seconds: 2));
      print('Logging in with email: $email');
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> googleSignIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }
      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      // TODO: Send the idToken to your backend to verify and create a session.
      print('Google Sign-In successful, token: $idToken');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
