import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Interface for authentication operations
abstract class AuthRemoteDataSource {
  /// Sign up a new user with email and password
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  });

  /// Log in an existing user with email and password
  Future<void> login({
    required String email,
    required String password,
  });

  /// Sign in user with Google account
  Future<void> signInWithGoogle();
}

/// Implementation of the authentication data source
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  final GoogleSignIn _googleSignInClient;

  AuthRemoteDataSourceImpl({
    required Dio dio,
    required GoogleSignIn googleSignIn,
  })  : _dio = dio,
       _googleSignInClient = googleSignIn;

  @override
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _dio.post('/auth/signup', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to sign up');
    }
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to log in');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignInClient.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in was cancelled');
      }
      
      final googleAuth = await googleUser.authentication;
      
      await _dio.post('/auth/google', data: {
        'idToken': googleAuth.idToken,
        'accessToken': googleAuth.accessToken,
      });
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to authenticate with server');
    } catch (e) {
      throw Exception('Authentication failed: ${e.toString()}');
    }
  }
}
