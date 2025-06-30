import 'package:budget_tracker/features/auth/auth.dart';

abstract class AuthRepository {
  Future<AuthResponse> login({
    required String email,
    required String password,
  });

  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
  });

  Future<void> logout();

  Future<User> getCurrentUser();
}
