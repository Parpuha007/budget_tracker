import 'package:budget_tracker/features/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required User user,
    required String token,
  }) = _AuthResponse;
}
