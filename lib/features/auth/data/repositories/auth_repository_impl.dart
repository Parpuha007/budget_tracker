import 'package:budget_tracker/features/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  // final AuthService _authService;
  // final StorageService _storageService;

  // AuthRepositoryImpl({
  //   required AuthService authService,
  //   required StorageService storageService,
  // })  : _authService = authService,
  //       _storageService = storageService;
  AuthRepositoryImpl();

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return const AuthResponse(
      user: User(id: '1', email: 'test@test.com', name: 'Test User'),
      token: '123',
    );
    // try {
    //   final response = await _authService.login(
    //     email: email,
    //     password: password,
    //   );

    //   await _storageService.saveToken(response.token);

    //   return response.toEntity();
    // } catch (e) {
    //   throw Exception('Failed to login: $e');
    // }
  }

  @override
  Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    return const AuthResponse(
      user: User(id: '1', email: 'test@test.com', name: 'Test User'),
      token: '123',
    );
    // try {
    //   final response = await _authService.register(
    //     email: email,
    //     password: password,
    //     name: name,
    //   );

    //   await _storageService.saveToken(response.token);

    //   return response.toEntity();
    // } catch (e) {
    //   throw Exception('Failed to register: $e');
    // }
  }

  @override
  Future<void> logout() async {
    // try {
    //   await _storageService.deleteToken();
    // } catch (e) {
    //   throw Exception('Failed to logout: $e');
    // }
  }

  @override
  Future<User> getCurrentUser() async {
    return const User(id: '1', email: 'test@test.com', name: 'Test User');
    // try {
    //   final token = await _storageService.getToken();
    //   if (token == null) {
    //     throw Exception('No token found');
    //   }

    //   final user = await _authService.getCurrentUser();
    //   return user.toEntity();
    // } catch (e) {
    //   throw Exception('Failed to get current user: $e');
    // }
  }
}
