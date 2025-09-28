/// Repository interface for authentication operations
abstract class AuthRepository {
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

  /// Authenticate user using Google Sign-In
  Future<void> signInWithGoogle();
}
