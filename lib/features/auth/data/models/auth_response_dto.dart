import 'package:budget_tracker/features/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_dto.freezed.dart';
part 'auth_response_dto.g.dart';

@freezed
class AuthResponseDto with _$AuthResponseDto {
  const factory AuthResponseDto({
    required UserDto user,
    required String token,
  }) = _AuthResponseDto;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  const AuthResponseDto._();

  AuthResponse toEntity() => AuthResponse(
        user: user.toEntity(),
        token: token,
      );
}
